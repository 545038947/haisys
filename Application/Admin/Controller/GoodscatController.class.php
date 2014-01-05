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
        $list = $this->getlist(0);

        int_to_string($list);

        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '商品类别-列表';
        $this->display();

        //p($list);
        
    }

    /**
     * 获取可用的商品类列表数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getlist($pid){
        
        $list = $this->getsubitems($pid);

        foreach ($list as $key => &$value) {
            $deeps = $value["deeplengh"];
            
            if ($list[$key+1]["deeplengh"] < $deeps) {
                $value["name"] = $this->prestr($deeps,1) . $value["name"];
            }
            else
            {
                $value["name"] = $this->prestr($deeps) . $value["name"];
            }
        };

        return $list;
        
    }

    /**
     * 处理树型列表中name前制表符
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function prestr($deeps,$isend=0){
        
        if ($deeps==1) {
            $treetmpstr = "";
        }
        else
        {
            $treetmpstr = "";
            for ($i=1; $i < $deeps-1; $i++) { 
                $treetmpstr .= "&nbsp;&nbsp;│&nbsp;&nbsp;&nbsp;&nbsp;";
            }

            if ($isend == 1) {
                $treetmpstr .= "&nbsp;&nbsp;└──&nbsp;&nbsp;";
            }
            else
            {
                $treetmpstr .= "&nbsp;&nbsp;├──&nbsp;&nbsp;";
            }

            
        }
        return $treetmpstr;
    }

    /**
     * 获取所有子类型（深度）
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getsubitems($pid,$deeplengh=0,$noitemid=0)
    {
        //echo "========================$deeplengh <br>";
        $Model = D("Goodscat"); 
        $map = array('pid' => $pid );
        $list = $Model->where($map)->order("sortorder")->select();
        $arrpostion = 0;
        $deeplengh = $deeplengh+1;
        if ($list) {
            $tmplist = array();
            foreach ($list as $key => $value) {
                $arrpostion += 1;
                $value["deeplengh"] = $deeplengh;

                if ($value["id"] != $noitemid) {
                    $tmplist = array_insert($tmplist,$value,$arrpostion);
                    $arrclient = $this->getsubitems($value["id"],$deeplengh,$noitemid);
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
     * 新增页面初始化
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function add(){
        $catlist = $this->getsubitems(0);

        foreach ($catlist as $key => &$value) {
            if ($value["status"] != 1) {
                unset($catlist[$key]);
            }
            else
            {
                $deeps = $value["deeplengh"];
                if ($list[$key+1]["deeplengh"] < $deeps) {
                    $value["name"] = $this->prestr($deeps,1) . $value["name"];
                }
                else
                {
                    $value["name"] = $this->prestr($deeps) . $value["name"];
                }
                //$value["name"] = $this->prestr($deeps) . $value["name"];
            }
            
        };

        $this->assign('catlist', $catlist);

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


        $catlist = $this->getsubitems(0,0,$id);

        foreach ($catlist as $key => &$value) {
            if ($value["status"] != 1) {
                unset($catlist[$key]);
            }
            else
            {
                $deeps = $value["deeplengh"];
                if ($list[$key+1]["deeplengh"] < $deeps) {
                    $value["name"] = $this->prestr($deeps,1) . $value["name"];
                }
                else
                {
                    $value["name"] = $this->prestr($deeps) . $value["name"];
                }
                //$value["name"] = $this->prestr($deeps) . $value["name"];
            }
            
        };

        $this->assign('catlist', $catlist);

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
        $pid = I("pid","0");
        if ( $pid == "") {
            
            $data['status']  = 0;
            $data['content'] = '错误的请求！'.$pid;
            $this->ajaxReturn($data);
        }

        $datalist = $this->getcatdata($pid);

        $data['status']  = 1;
        $data['content'] = $datalist;

        $this->ajaxReturn($data);
        //P($data);
    }

    /**
     * 获取类别数据
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getcatdata($pid)
    {
        $Model = D("Goodscat"); 
        $map =  'pid = '.$pid;
        $datalist = $Model->where($map)->order("sortorder")->select();
        if($datalist)
        {
            foreach ($datalist as $key => &$value) {
                $value["additionalParameters"] = array();

                $value["client"] = $this->getcatdata($value["id"]);
                if ($value["client"]===array()) {
                    $value["type"] = "item";
                }
                else
                {
                    $value["type"] = "folder";
                }
                
            }
            return $datalist;
        }
        else
        {
            return array();
        }

    }




}

?>