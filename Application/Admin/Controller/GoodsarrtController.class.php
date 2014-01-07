<?php
// +----------------------------------------------------------------------
// | Author:  和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;

/**
 * 商品属性 控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodsarrtController extends AdminController {
	 /**
     * 商品属性 首页
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){
        
        $list = $this->lists('goodsarrt');
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '商品属性-列表';
        $this->display();
        
    }

    /**
     * 获取可用的商品属性列表数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getlist(){
        
        $Model = D("Goodsarrt"); 
        $map = array('status' => 1 );
        $list = $Model->where($map)->order("sortorder")->select();
        return $list;
        
    }

     /**
     * 新增页面初始化
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function add(){

        $this->meta_title = '商品属性-新增';
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
        $Model = D('Goodsarrt');
        $data = $Model->field(true)->find($id);
        if(!$data){
            $this->error($Model->getError());
        }

        $this->assign('fields', $data);
        $this->meta_title = '商品属性-编辑';
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

        $Model = D("Goodsarrt"); 
        foreach ($ids as $value){
            //$res = D('autocode')->del($value);
            
            $res = $Model->delete("$value");
            if(!$res){
                break;
            }
        }

        if(!$res){
            $this->error(D('Goodsarrt')->getError());
        }else{
            $this->success('删除成功！');
        }
    }

    /**
     * 更新一条数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function update(){
        $Model = D("Goodsarrt"); 
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
        	$this->error(D('Goodsarrt')->getError());
        }

    }

    /**
     * 获取所有子属性（深度）
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getsubitems($goodsid,$gid=0,$deeplengh=0,$noitemid=0)
    {
        //echo "========================$deeplengh <br>";
        $Model = D("Goodsarrt");
        $map = array(
            'goodsid' => $goodsid,
            'gid' => $gid
            ); 
        
        $list = $Model->where($map)->order("arrttype,sortorder")->select();
        $arrpostion = 0;
        $deeplengh = $deeplengh+1;
        if ($list) {
            $tmplist = array();
            foreach ($list as $key => $value) {
                $arrpostion += 1;
                $value["deeplengh"] = $deeplengh;

                if ($value["id"] != $noitemid) {
                    $tmplist = array_insert($tmplist,$value,$arrpostion);
                    $arrclient = $this->getsubitems($goodsid,$value["typeid"],$deeplengh,$noitemid);
                    if (!($arrclient === array()))
                    {
                        foreach ($arrclient as $clientkey => $val) {
                            if ($value["id"] != $noitemid) {
                                $tmplist = array_insert($tmplist,$val,$arrpostion);
                                $arrpostion += 1;
                            }
                        }
                    }
                }
            }
            //echo "========================<br>";
            return $tmplist;
        }
        else
        {
            //echo "========================<br>";
            return array();
        }
    }

    /**
     * 获取指定goodsid的属性列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getitemlist($goodsid)
    {
        $list = $this->getsubitems($goodsid);

        if ($list) {
            int_to_string($list);
            $tmplist = array();
            $arrpostion = 0;

            foreach ($list as $key => &$value) {
                switch ($value["arrttype"]) {
                    case '1':
                        $tmplist[1][] = $value;
                        break;
                    case '2':
                        $tmplist[2][] = $value;
                        break;
                    case '3':
                        $tmplist[3][] = $value;
                        break;
                }

            };

            $data['status']  = 1;
            $data['info'] = "完成";
            $data['content'] = $tmplist;

            //$this->ajaxReturn($data);
        }
        else
        {
            $data['status']  = 0;
            $data['info'] = "无数据！";

            //$this->ajaxReturn($data);
        }

        $this->assign('listdata', $data);

        $this->display();

        
    }

    /**
     * ajax编辑单属性表单
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function ajaxedit($id)
    {
        $Model = D("Goodsarrt");
        $map = array(
            'id' => $id
            ); 
        $data = $Model->where($map)->find();

        if ($data) {
            $grouplist = $this->getgrouplist($data["goodsid"]);
            $this->assign('grouplist', $grouplist);
            $this->assign('data', $data);
            $this->display();
        }
        else
        {
            $this->error("错误的数据参数！");
        }
        
    }

    /**
     * 获取指定typeid的属性组列表
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getgrouplist($goodsid,$gid=0){
        $Model = D("Goodsarrt");
        $map = array(
            'goodsid' => $goodsid,
            'isgroup' => 1,
            'gid' => $gid
            );
        $list = $Model->where($map)->order("sortorder")->select();
        
        if ($list) {
            return $list;
        }
        else
        {
            return array();
        }
    }

}

?>