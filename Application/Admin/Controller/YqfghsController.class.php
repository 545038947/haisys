<?php
// +----------------------------------------------------------------------
// | Author:  和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Common\Api\OpensdkApi;

/**
 * 够划算配置控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */

class YqfghsController extends AdminController {

    /**
     * 够划算首页----- 类别列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){
        $list = $this->lists('yqf_ghscat');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '够划算类别列表';
        $this->display("ghscatlist");
        
    }

    /**
     * 够划算类别列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function ghscatlist(){
        $list = $this->lists('yqf_ghscat');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '够划算类别列表';
        $this->display();
    }


    /**
     * 更新够划算类别列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function catupdate(){
        //获取够划算类别
        
        $catlist = OpensdkApi::getghscat();


        $ghscat = M("yqf_ghscat");

        foreach ($catlist as $key => $value) {
            $thisdata = $ghscat->where('ghs_catid="'.$value["ghs_catid"].'"')->find();
            if(is_null($thisdata))
            {
                $ghscat->add($value);
            }
            else
            {
                $value["sort_order"] = $thisdata["sort_order"];
                $ghscat->where('ghs_catid="'.$value["ghs_catid"].'"')->save($value);;
            }
        }

        $this->success('更新完成');

    }

    /**
     * 删除一条够划算类型数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function ghscatdel(){
        $ids = I('get.ids');

        empty($ids) && $this->error('参数不能为空！');

        $ids = explode(',', $ids);

        $shopset = M("yqf_ghscat"); 
        foreach ($ids as $value){
            //$res = D('shopset')->del($value);
            
            $res = $shopset->delete("$value");
            if(!$res){
                break;
            }
        }

        if(!$res){
            $this->error("数据错误！");
        }else{
            $this->success('删除成功！');
        }
    }

    /**
     * 编辑划算类型数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function ghscatedit(){
        $id = I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }

        /*获取一条记录的详细数据*/
        $Model = M('yqf_ghscat');
        $data = $Model->field(true)->find($id);
        if(!$data){
            $this->error("数据错误");
        }

        $this->assign('fields', $data);
        $this->meta_title = '编辑划算类型数据';
        $this->display();
    }


    /**
     * 更新一条数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function ghscatupdate(){

        $Model = M("yqf_ghscat"); // 实例化shopset对象
        // 根据表单提交的POST数据创建数据对象
        if($Model->create()){
            //判断是新增还是更新
            if (I("id")) {
                $result = $Model->where('id='.I("id"))->save(); // 写入数据到数据库 
                if($result){
                    // 如果主键是自动增长型 成功后返回值就是最新插入的值
                    $insertId = $result;
                    $this->success('更新成功,ID:'.$insertId, Cookie('__forward__'));
                }
                else
                {
                    $this->error("更新失败！");
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
    }


     /**
     * 设置一条或者多条数据的状态
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function ghscatsetStatus(){
        $Model = "yqf_ghscat";
        $ids    =   I('request.ids');
        $status =   I('request.status');
        if(empty($ids)){
            $this->error('请选择要操作的数据');
        }

        $map['id'] = array('in',$ids);
        switch ($status){
            case -1 :
                $this->delete($Model, $map, array('success'=>'删除成功','error'=>'删除失败'));
                break;
            case 0  :
                $this->forbid($Model, $map, array('success'=>'禁用成功','error'=>'禁用失败'));
                break;
            case 1  :
                $this->resume($Model, $map, array('success'=>'启用成功','error'=>'启用失败'));
                break;
            default :
                $this->error('参数错误');
                break;
        }
    }

    
}
