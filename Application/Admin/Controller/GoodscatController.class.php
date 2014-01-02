<?php
// +----------------------------------------------------------------------
// | Author:  和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;

/**
 * 商品类别 控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodscatController extends AdminController {
	 /**
     * 商品类别 首页
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){
        
        $list = $this->lists('goodscat');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '商品类别-列表';
        $this->display();
        
    }

        /**
     * 新增页面初始化
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function add(){

        $this->meta_title = '商品类别-新增';
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
        $Model = D('Goodscat');
        $data = $Model->field(true)->find($id);
        if(!$data){
            $this->error($Model->getError());
        }

        $this->assign('fields', $data);
        $this->meta_title = '商品类别-编辑';
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

        $Model = D("Goodscat"); 
        foreach ($ids as $value){
            //$res = D('autocode')->del($value);
            
            $res = $Model->delete("$value");
            if(!$res){
                break;
            }
        }

        if(!$res){
            $this->error(D('Goodscat')->getError());
        }else{
            $this->success('删除成功！');
        }
    }

    /**
     * 更新一条数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function update(){
        $Model = D("Goodscat"); 
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
        	$this->error(D('Goodscat')->getError());
        }

    }

    /**
     * 获取类别treeview
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function gettreedata(){
        $pid = I("pid");
        if (empty($pid)) {
            
            $data['status']  = 0;
            $data['content'] = '错误的请求！';
            //$this->ajaxReturn($data);
        }

        echo "$pid";

        $Model = D("Goodscat"); 

        $map =  array('pid' => $pid, );


        $datalist = $Model->where($map)->order("sortorder")->select();

        $data['status']  = 1;
        $data['content'] = $datalist;

        $this->ajaxReturn($data);




    }




}

?>