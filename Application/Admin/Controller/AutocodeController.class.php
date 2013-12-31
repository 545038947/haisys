<?php
// +----------------------------------------------------------------------
// | Author:  和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Common\Api\OpensdkApi;

/**
 * 代码脚手架控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */

class AutocodeController extends AdminController {
	 /**
     * 脚手架首页
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){
        
        $list = $this->lists('Autocode');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '代码生成配置列表';
        $this->display();
        
    }

        /**
     * 新增页面初始化
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function add(){

        $this->meta_title = '新增代码生成配置';
        $this->display();
    }

    /**
     * 编辑页面初始化
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function edit(){
        $id = I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }

        /*获取一条记录的详细数据*/
        $Model = D('Autocode');
        $data = $Model->field(true)->find($id);
        if(!$data){
            $this->error($Model->getError());
        }

        $this->assign('fields', $data);
        $this->meta_title = '编辑代码生成配置';
        $this->display();
    }

    /**
     * 删除一条数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function del(){
        $ids    =   I('request.ids');
        if(empty($ids)){
            $this->error('请选择要操作的数据');
        }

        if (!is_array($ids)) {
            $ids = explode(',', $ids);
        }        

        $Model = D("Autocode"); 
        foreach ($ids as $value){
            //$res = D('autocode')->del($value);
            
            $res = $Model->delete("$value");
            if(!$res){
                break;
            }
        }

        if(!$res){
            $this->error(D('Autocode')->getError());
        }else{
            $this->success('删除成功！');
        }
    }

    /**
     * 更新一条数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function update(){

        $Model = D("Autocode"); // 实例化autocode对象
        // 根据表单提交的POST数据创建数据对象

        $data = $Model->create();

        if($data){
            //判断是新增还是更新
            if (I("id")) {
                $result = $Model->save(); // 写入数据到数据库 
                if($result){
                    $this->success('更新成功,ID:'.I("id"), Cookie('__forward__'));
                }
                else
                {
                    $this->error("更新失败!！");
                }
            }
            else
            {
                $result = $Model->add(); // 写入数据到数据库 
                if($result){
                    // 如果主键是自动增长型 成功后返回值就是最新插入的值
                    $insertId = $result;
                    $this->success('新增成功,ID:'.$insertId, Cookie('__forward__'));
                }
                else {
                    $this->error("新增失败！");
                }
            }

        }
        else
        {
        	$this->error(D('Autocode')->getError());
        }

    }

    /**
     * 生成设置界面
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function generateor(){
        $id = I('id','');
        if(empty($id)){
            $this->error('错误的配置项！');
        }
    	$cfg = M("Autocode"); 
		$data = $cfg->where('status=1 AND id="'.$id.'"')->find();
        if(!$data){
            $this->error($Model->getError());
        }

        $this->assign('fields', $data);


		if($data){
			$tables = D('Model')->getTables();
			$this->assign('tables', $tables);

		}
		else
		{
			$this->error('无效的生成配置！');
		}


    	$this->display();

    }

    /**
     * 生成操作
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function generate(){

    	if (!IS_POST) {
    		$this->error('非法的操作');
    	}
    	else
    	{
            

            $cfgarr = $_POST;


            $table = $cfgarr['table'];
            $mtname = str_replace(C('DB_PREFIX'), '', $table);
            $gen_name = $cfgarr['gen_name'];


            $thiserr = array('status' => 0 , 'msg' => '' );

            if (empty($gen_name)) {
                $thiserr['status'] = 1;
                $thiserr['msg'] .= "生成标示缺失，无法进行生成操作！<br>";
                $this->error($thiserr['msg']);
            }

            if ($table=='null') {
                $thiserr['status'] = 1;
                $thiserr['msg'] .= "数据表缺失，无法进行生成操作！<br>";
                $this->error($thiserr['msg']);
            }
            

            //验证需要生成的文件是否存在
            $gen_ctrfile = '.'.I('ctrpath').'/'.$gen_name.'Controller.class.php';
            if (is_file($gen_ctrfile)) {

                $thiserr['status'] = 1;
                $thiserr['msg'] .= "控制器文件: $gen_ctrfile 已经存在!请更换标示名称.<br>";
            }
            $gen_modelfile = '.'.I('modelpath').'/'.$gen_name.'Model.class.php';
            if (is_file($gen_modelfile)) {
                $thiserr['status'] = 1;
                $thiserr['msg'] .= "模型文件: $gen_modelfile 已经存在!请更换标示名称.<br>";
            }
            $gen_tmplfile = '.'.I('tmplpath').'/'.$gen_name.'/';
            if (file_exists($gen_tmplfile)) {
                $thiserr['status'] = 1;
                $thiserr['msg'] .= "视图文件夹: $gen_tmplfile 已经存在!请更换标示名称.<br>";
            }

            if ($thiserr['status'] == 1) {
                //$this->error($thiserr['msg']);
            }

            

            $name = substr($table, strlen(C('DB_PREFIX')));
            $data = array('name'=>$name, 'title'=>$name);
            $fields = M()->query('SHOW FULL COLUMNS FROM '.$table);


            //获取控制器模板文件 
            $gen_ctrtpml = '.'.I('ctrtmpl').'/Controller.class.php';
            $tpml_ctrfile = file_get_contents($gen_ctrtpml);
            
            //获取模型模板文件
            $gen_modeltpml = '.'.I('modeltmpl').'/Model.class.php';
            $tpml_modelfile = file_get_contents($gen_modeltpml);

            //获取模板文件：index,edit,add
            $gen_tpmltpml_index = '.'.I('tmpltmpl').'/index.html';
            $tpml_tpmltpml_indexfile = file_get_contents($gen_tpmltpml_index);

            $gen_tpmltpml_add = '.'.I('tmpltmpl').'/add.html';
            $tpml_tpmltpml_addfile = file_get_contents($gen_tpmltpml_add);

            $gen_tpmltpml_edit = '.'.I('tmpltmpl').'/edit.html';
            $tpml_tpmltpml_editfile = file_get_contents($gen_tpmltpml_edit);

            // P($cfgarr);

            // P($fields);
            // die();



            //处理模板文件

            $model_validatestr = "";
            $tpml_index_listthstr = "";
            $tpml_index_listtdstr = "";

            $tpml_eidt_ctrsstr = "";
            $tpml_add_ctrsstr = "";



            foreach ($fields as $key => $value) {
                //读取对应字段配置
                $field_edittype = $cfgarr[$value['Field'].'_edittype'];
                $field_iskey = $cfgarr[$value['Field'].'_iskey'];
                $field_inlist = $cfgarr[$value['Field'].'_inlist'];
                $field_inedit = $cfgarr[$value['Field'].'_inedit'];
                $field_nonull = $cfgarr[$value['Field'].'_nonull'];
                $field_ishide = $cfgarr[$value['Field'].'_ishide'];
                $field_memo = $cfgarr[$value['Field'].'_memo'];

                //模型部分
                if ($field_nonull == 1) {
                    $model_validatestr .= "array('".$value['Field']."', 'require', '".$value['Comment']."不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),\n";
                    
                }

                
                //模板部分
                //index列表部分
                if ($field_inlist == 1) {
                    $tpml_index_listthstr .= "<th>".$value['Comment']."</th>\n";
                    $tpml_index_listtdstr .= "<td>{\$vo.".$value['Field']."}</td>\n";
                }

                //edit表单部分
                if ($field_inedit == 1) {
                    if ($field_ishide == 1) {
                        $tpml_eidt_ctrsstr .= "<input type=\"hidden\" name=\"".$value['Field']."\" value=\"{\$fields['".$value['Field']."']}\"/>\n";
                        $tpml_add_ctrsstr .= "<input type=\"hidden\" name=\"".$value['Field']."\" value=\"{\$fields['".$value['Field']."']}\"/>\n";

                    }
                    else
                    {
                        $tpml_eidt_ctrsstr .= "<div class='form-item cf'>\n";
                        $tpml_add_ctrsstr .= "<div class='form-item cf'>\n";

                        $tpml_eidt_ctrsstr .= "<label class=\"item-label\">".$value['Comment']."<span class=\"check-tips\"> ".$field_memo." </span></label>\n";
                        $tpml_add_ctrsstr .= "<label class=\"item-label\">".$value['Comment']."<span class=\"check-tips\"> ".$field_memo." </span></label>\n";

                        $tpml_eidt_ctrsstr .= "<div class='controls'>\n";
                        $tpml_add_ctrsstr .= "<div class='controls'>\n";
                        if ($field_edittype == 0) {//输入框

                            $tpml_eidt_ctrsstr .= "<input type=\"text\" class=\"text input-large\" name=\"".$value['Field']."\" value=\"{\$fields.".$value['Field']."}\">\n";
                            $tpml_add_ctrsstr .= "<input type=\"text\" class=\"text input-large\" name=\"".$value['Field']."\" value=\"\">\n";
                        }
                        elseif ($field_edittype == 1) {//时间选择器
                            $tpml_eidt_ctrsstr .= "<input type=\"text\" name=\"".$value['Field']."\" class=\"text input-large time\" value=\"{\$data[\$fields['".$value['Field']."']]|time_format}\" placeholder=\"请选择时间\" />";
                            $tpml_add_ctrsstr .= "<input type=\"text\" name=\"".$value['Field']."\" class=\"text input-large time\" value=\"{\$data[\$fields['".$value['Field']."']]|time_format}\" placeholder=\"请选择时间\" />";
                        }
                        elseif ($field_edittype == 2) {//编辑器
                            $tpml_eidt_ctrsstr .= "<label class=\"textarea\">\n";
                            $tpml_eidt_ctrsstr .= "<textarea name=\"".$value['Field']."\">{\$fields.".$value['Field']."}</textarea>\n";
                            $tpml_eidt_ctrsstr .= "{:hook('adminArticleEdit', array('name'=>'".$value['Field']."','value'=>\$fields.".$value['Field']."))}";
                            $tpml_eidt_ctrsstr .= "</label>\n";

                            $tpml_add_ctrsstr .= "<label class=\"textarea\">\n";
                            $tpml_add_ctrsstr .= "<textarea name=\"".$value['Field']."\"></textarea>\n";
                            $tpml_add_ctrsstr .= "{:hook('adminArticleEdit', array('name'=>'".$value['Field']."','value'=>\$fields.".$value['Field']."))}";
                            $tpml_add_ctrsstr .= "</label>\n";
                        }
                        elseif ($field_edittype == 3) {//文件上传[{$field.name}]
                            //[{$field.name}] [$field['name']]
                            $upfiletpml = '.'.I('tmpltmpl').'/fileup.html';
                            $upfilestr = file_get_contents($upfiletpml);
                            $upfilestr = str_replace("[{\$field.name}]", $value['Field'],$upfilestr);
                            $upfilestr = str_replace("[\$field['name']]", $value['Field'],$upfilestr);

                            $tpml_eidt_ctrsstr .= $upfilestr."\n";
                            $tpml_add_ctrsstr .= $upfilestr."\n";

                        }


                        $tpml_eidt_ctrsstr .= "</div>\n";
                        $tpml_add_ctrsstr .= "</div>\n";
                        
                        $tpml_eidt_ctrsstr .= "</div>\n";
                        $tpml_add_ctrsstr .= "</div>\n";
                    }
                }


            }

            //生成控制器文件
            $tpml_ctrfile = str_replace('[#gen_name]', $gen_name, $tpml_ctrfile);//[#gen_name]：生成的控制器名称
            $tpml_ctrfile = str_replace('[#gen_mtname]', $mtname, $tpml_ctrfile);//[#gen_mtname]：对应表名(无前缀)

            //---------------保存控制器文件
            if (!saveFile($gen_ctrfile,$tpml_ctrfile)){
                $this->error("保存文件错误:".$gen_ctrfile,$tpml_ctrfile);
            }



            //生成模型文件
            $tpml_modelfile = str_replace('[#gen_name]', $gen_name, $tpml_modelfile);//[#gen_name]：生成的模型名称
            $tpml_modelfile = str_replace('[#validate]', $model_validatestr, $tpml_modelfile);//[#validate]：数据校验数据

            //---------------保存模型文件
            if (!saveFile($gen_modelfile,$tpml_modelfile)){
                $this->error("保存文件错误:".$gen_modelfile);
            }


            //生成模板文件index
            $tpml_tpmltpml_indexfile = str_replace('[#indexthstr]', $tpml_index_listthstr, $tpml_tpmltpml_indexfile);//[#indexthstr]：列表表头
            $tpml_tpmltpml_indexfile = str_replace('[#indextdstr]', $tpml_index_listtdstr, $tpml_tpmltpml_indexfile);//[#indexthstr]：列表表体
            $tpml_tpmltpml_indexfile = str_replace('[#gen_name]', $gen_name, $tpml_tpmltpml_indexfile);//[#gen_name]：控制器名

            //---------------保存模板文件index
            
            if (!saveFile($gen_tmplfile.'/index.html',$tpml_tpmltpml_indexfile)){
                $this->error("保存文件错误:".$gen_tmplfile.'/index.html');
            }


            // $tpml_eidt_ctrsstr = "";
            // $tpml_add_ctrsstr = "";
            //生成模板文件edit
            $tpml_tpmltpml_editfile = str_replace('[#ctrsstr]', $tpml_eidt_ctrsstr, $tpml_tpmltpml_editfile);//[#ctrsstr]：编辑控件

            //---------------保存模板文件edit
            
            if (!saveFile($gen_tmplfile.'/edit.html',$tpml_tpmltpml_editfile)){
                $this->error("保存文件错误:".$gen_tmplfile.'/edit.html');
            }

            //生成模板文件add
            $tpml_tpmltpml_addfile = str_replace('[#ctrsstr]', $tpml_add_ctrsstr, $tpml_tpmltpml_addfile);//[#ctrsstr]：编辑控件

            //---------------保存模板文件edit
            
            if (!saveFile($gen_tmplfile.'/add.html',$tpml_tpmltpml_addfile)){
                $this->error("保存文件错误:".$gen_tmplfile.'/add.html');
            }



            //生成菜单项目
            $Menu = D('Menu');

            //$data['id'] = 
            $data['title'] = '临时菜单';
            $data['pid'] = 0;
            $data['sort'] = 100;
            $data['url'] = $gen_name.'/index';
            $data['hide'] = 0;
            //$data['tip'] = '';
            //$data['group'] = '';
            $data['is_dev'] = 0;

            $newid = $Menu->data($data)->add();
            if ($newid) {
                $data['title'] = '列表';
                $data['pid'] = $newid;
                $data['sort'] = 100;
                $data['url'] = $gen_name.'/index';
                $data['hide'] = 0;
                //$data['tip'] = '';
                //$data['group'] = '';
                $data['is_dev'] = 0;
                $Menu->data($data)->add();

                $data['title'] = '新增';
                $data['pid'] = $newid;
                $data['sort'] = 100;
                $data['url'] = $gen_name.'/add';
                $data['hide'] = 0;
                //$data['tip'] = '';
                //$data['group'] = '';
                $data['is_dev'] = 0;
                $Menu->data($data)->add();

                $data['title'] = '编辑';
                $data['pid'] = $newid;
                $data['sort'] = 100;
                $data['url'] = $gen_name.'/edit';
                $data['hide'] = 1;
                //$data['tip'] = '';
                //$data['group'] = '';
                $data['is_dev'] = 0;
                $Menu->data($data)->add();
            }
            else
            {
                $this->error('添加菜单出错！');
            }



            $resmsg = '代码生成完成，生成如下文件：<br>';
            $resmsg .= $gen_ctrfile.'<br>';
            $resmsg .= $gen_modelfile.'<br>';
            $resmsg .= $gen_tmplfile.'/index.html'.'<br>';
            $resmsg .= $gen_tmplfile.'/edit.html'.'<br>';
            $resmsg .= $gen_tmplfile.'/add.html'.'<br>';

            echo "$resmsg";

            






    		

    	}

    	//$this->display();

    }

    /**
     * 获取数据表属性
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function gettablearrt(){

    	if (!IS_POST) {
    		$this->error('非法的操作');
    	}
    	else
    	{
    		$table = I('table');

    		$name = substr($table, strlen(C('DB_PREFIX')));
    		$fields = M()->query('SHOW FULL COLUMNS FROM '.$table);
    		//P($fields);
    		$data['status']  = 1;
			$data['tablefullname'] = $table;
			$data['tablename'] = $name;
			$data['content'] = $fields;
			$this->ajaxReturn($data);
			//p($data);
    	}

    	//$this->display();

    }


}

?>