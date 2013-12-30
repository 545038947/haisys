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
        $ids = I('get.ids');

        empty($ids) && $this->error('参数不能为空！');

        $ids = explode(',', $ids);

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
            $this->success('删除该配置成功！');
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
            P($_POST);
            $gen_name = I('gen_name');
            $thiserr = array('status' => 0 , 'msg' => '' );
            

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
            if (is_file($gen_ctrfile)) {
                $thiserr['status'] = 1;
                $thiserr['msg'] .= "视图文件夹: $gen_tmplfile 已经存在!请更换标示名称.<br>";
            }

            if ($thiserr['status'] == 1) {
                //$this->error($thiserr['msg']);
            }

            $table = I('table');

            $name = substr($table, strlen(C('DB_PREFIX')));
            $data = array('name'=>$name, 'title'=>$name);
            $fields = M()->query('SHOW FULL COLUMNS FROM '.$table);


            //获取控制器模板文件
            $gen_ctrtpml = '.'.I('ctrtmpl').'/Controller.class.php';
            $tpml_ctrfile = file_get_contents($gen_ctrtpml);
            //[#gen_name] 
            $tpml_ctrfile = str_replace('[#gen_name]', $gen_name, $tpml_ctrfile);

            //保存控制器文件
            //saveFile($gen_ctrfile,$tpml_ctrfile);

            //获取模型模板文件
            $gen_modeltpml = '.'.I('modeltmpl').'/Model.class.php';
            $tpml_modelfile = file_get_contents($gen_modeltpml);


            P($fields);



            //echo "$tpml_modelfile";
            //[#validate]
            //$tpml_ctrfile = str_replace('[#gen_name]', $gen_name, $tpml_ctrfile);

            //保存控制器文件
            //saveFile($gen_ctrfile,$tpml_ctrfile);







            






    		

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