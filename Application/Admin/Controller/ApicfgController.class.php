<?php
// +----------------------------------------------------------------------
// | Author:  和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;

/**
 * api配置管理控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */

class ApicfgController extends AdminController {

    /**
     * api配置管理首页
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){
        $map = array('status'=>array('gt',-1));
        $list = $this->lists('shopset',$map);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = 'Api配置管理';
        
        $this->display();
    }

    /**
     * 新增页面初始化
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function add(){
        //获取所有的模型
        //$models = M('shopset')->where(array('extend'=>0))->field('id,title')->select();

        //$this->assign('models', $models);
        $this->meta_title = '新增Api配置';
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
        $Model = M('shopset');
        $data = $Model->field(true)->find($id);
        if(!$data){
            $this->error($Model->getError());
        }

        $this->assign('fields', $data);
        $this->meta_title = '编辑Api配置';
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

        $shopset = M("shopset"); 
        foreach ($ids as $value){
            //$res = D('shopset')->del($value);
            
            $res = $shopset->delete("$value");
            if(!$res){
                break;
            }
        }

        if(!$res){
            $this->error(M('shopset')->getError());
        }else{
            $this->success('删除该配置成功！');
        }
    }

    /**
     * 更新一条数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function update(){

        $shopset = M("shopset"); // 实例化shopset对象
        // 根据表单提交的POST数据创建数据对象
        if($shopset->create()){
            //判断是新增还是更新
            if (I("id")) {
                $result = $shopset->where('id='.I("id"))->save(); // 写入数据到数据库 
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
                $result = $shopset->add(); // 写入数据到数据库 
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
    public function setStatus(){
        $Model = "shopset";
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
