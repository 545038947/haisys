<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;
use Common\Api\OpensdkApi;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据 
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){

        $category = D('Category')->getTree();
        $lists    = D('Document')->lists(null);

        $this->assign('category',$category);//栏目
        $this->assign('lists',$lists);//列表
        $this->assign('page',D('Document')->page);//分页



        //够划算类目
        $this->assign('ghslists',$this->getghsgoods(6));//列表

        //类目下商品列表

                 
        $this->display();
    }

    /**
	 * 首页够划算楼层列表
	 * @param  变量
	 * @return array 导航数据数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public function getghsgoods($goodssize)
	{
		
		$Model = M('yqf_ghscat')->where("status=1")->order("sort_order")->select();

		foreach ($Model as $key => $value) {
			
			$Model[$key]['goods'] = OpensdkApi::getghsitemlist($value['ghs_catid'],'1',"$goodssize");
		}

		return $Model;
	}

}