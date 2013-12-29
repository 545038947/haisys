<?php
// +----------------------------------------------------------------------
// | Author:  和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Common\Api\OpensdkApi;

/**
 * 五十九秒开放平台配置控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */

class OpenwjmController extends AdminController {

    /**
     * 首页----- 商品类别列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){
        $list = $this->lists('59m_itemcat');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '商品类别列表';
        $this->display("hotweblist");
        
    }

    /**
     * 商品类别列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function itemcatlist(){
        $list = $this->lists('59m_itemcat');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '商品类别列表';
        $this->display();
    }


    /**
     * 更新59秒商品类别列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function catupdate($pid = 0){
        $datalist = OpensdkApi::get59miaoitemcat($pid);
        $Model = M("59m_itemcat");
        foreach ($datalist as $key => $value) {
            if($value['status'] == 'normal'){
                $value['status'] = 1;
            }
            else
            {
                $value['status'] = 0;
            }
            $thisdata = $Model->where('cid="'.$value["cid"].'"')->find();
            if(is_null($thisdata))
            {
                $value['parent_id'] = "$pid";
                $Model->add($value);
                if ($value['is_parent'] == 'true') {
                    $this->catupdate($value['cid']);
                }
            }
            else
            {
                $value['parent_id'] = "$pid";
                $Model->where('cid="'.$value["cid"].'"')->save($value);
                if ($value['is_parent'] == 'true') {
                    $this->catupdate($value['cid']);
                }
            }
        }



        //$this->success('更新完成');

    }

    /**
     * 删除一条59秒商品类别数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function itemcatdel(){
        $ids = I('get.ids');

        empty($ids) && $this->error('参数不能为空！');

        $ids = explode(',', $ids);

        $shopset = M("59m_itemcat"); 
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
     * 编辑59秒商品类别
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function itemcatedit(){
        $id = I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }

        /*获取一条记录的详细数据*/
        $Model = M('59m_itemcat');
        $data = $Model->field(true)->find($id);
        if(!$data){
            $this->error("数据错误");
        }

        $this->assign('fields', $data);
        $this->meta_title = '编辑59秒商品类别';
        $this->display();
    }


    /**
     * 更新一条59秒商品类别数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function itemcatupdate(){

        $Model = M("59m_itemcat"); // 实例化shopset对象
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
     * 设置一条或者多条59秒商品类别的状态
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function itemcatsetStatus(){
        $Model = "59m_itemcat";
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
