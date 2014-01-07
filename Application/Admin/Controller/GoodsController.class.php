<?php
// +----------------------------------------------------------------------
// | Author:  和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;

/**
 * 商品 控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodsController extends AdminController {
	 /**
     * 商品 首页
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){
        
        $list = $this->lists('goods');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '商品-列表';
        $this->display();
        
    }

        /**
     * 新增页面初始化
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function add(){
        //P(session('user_auth'));

        $Model = D('Goods');


        //供货商列表 商品类别列表 商品属性类型类别
        $supplier = A('Supplier');
        $supplierlist = $supplier->getlist();

        $goodcat = A("Goodscat");
        $goodcatlist = $goodcat->getlist(0);

        $goodtype = A("Goodstype");
        $goodtypelist = $goodtype->getlist();    



        $this->assign('supplierlist', $supplierlist);
        $this->assign('goodcatlist', $goodcatlist);
        $this->assign('goodtypelist', $goodtypelist);


        $this->meta_title = '商品-新增';
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
        $Model = D('Goods');
        $data = $Model->field(true)->find($id);
        if(!$data){
            $this->error($Model->getError());
        }

        //供货商列表 商品类别列表 商品属性类型类别
        $supplier = A('Supplier');
        $supplierlist = $supplier->getlist();

        $goodcat = A("Goodscat");
        $goodcatlist = $goodcat->getlist(0);

        $goodtype = A("Goodstype");
        $goodtypelist = $goodtype->getlist();        

        $this->assign('supplierlist', $supplierlist);
        $this->assign('goodcatlist', $goodcatlist);
        $this->assign('goodtypelist', $goodtypelist);

        $this->assign('fields', $data);
        $this->meta_title = '商品-编辑';
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

        $Model = D("Goods"); 
        foreach ($ids as $value){
            //$res = D('autocode')->del($value);
            
            $res = $Model->delete("$value");
            if(!$res){
                break;
            }
        }

        if(!$res){
            $this->error(D('Goods')->getError());
        }else{
            $this->success('删除成功！');
        }
    }

    /**
     * 更新一条数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function update(){
        $Model = D("Goods"); 
        $data = $Model->create();

        if($data){
            //判断是新增还是更新
            if (I("id")) {
                $data["modifyid"] = session('user_auth.uid');
                $data["modifytime"] = time();
                $data["endtime"] = strtotime($data["endtime"]);
                $data["starttime"] = strtotime($data["starttime"]);


                $result = $Model->save($data); // 写入数据到数据库 
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
                $data["adderid"] = session('user_auth.uid');
                $data["addtime"] = time();
                $data["modifyid"] = session('user_auth.uid');
                $data["modifytime"] = time();


                $result = $Model->add($data); // 写入数据到数据库 
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
        	$this->error(D('Goods')->getError());
        }

    }

    /**
     * 重置对应商品类型为默认商品属性
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function resetarrt($id,$typeid)
    {
        $Model = D("Goodstypearrt"); 
        $map = array(
            'typeid' => $typeid
            ); 
        $defaultlist = $Model->where($map)->select();
        if($defaultlist)
        {
            //清除现有属性
            $delmap = array(
                'goodsid' => $id
            ); 
            $goodsarrt = D("Goodsarrt");
            $delres = $goodsarrt->where($delmap)->delete();
            


            //添加新属性
            foreach ($defaultlist as $key => $value) {
                
                $newvalue = $value;
                $newvalue["typeid"] = $value["id"];
                $newvalue["id"] = null;
                $newvalue["goodsid"] = $id;
                $res = $goodsarrt->add($newvalue);
                if (!$res) {
                    $this->error("数据添加错误");
                }
                
            }
        }
    }



}

?>