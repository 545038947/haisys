<?php
/**
 * OpensdkApi 公用API
 * @author 和蔼的木Q <545038947@qq.com>
 */

namespace Common\Api;
class OpensdkApi {

	/**
	 * 获取开放平台配置
	 * @param  string $shopname 开放平台名称
	 * @return array      配置数组
	 * @author 和蔼的木Q
	 */
	public static function get_open_shopset($shopname){

	    //清除缓存
	    //    S('OPENSHPOSET_CONFIG',null);
	    $openshopset = S('OPENSHPOSET_CONFIG');
	    if(is_array($openshopset)){
	        //有缓存，直接使用缓存数据
	        $res = $openshopset[$shopname];
	    }
	    else{
	        //无缓存，设置缓存
	        $Model = M('Shopset');
	        $condition['sname'] = $shopname;
	        $data = $Model->select();

	        foreach ($data as $key => $value) {
	            for ($i=0; $i <9 ; $i++) { 
	                if (!empty($value["vname$i"])) {
	                    $keys[$value["vname$i"]] = $value["vval$i"];
	                }
	            }
	            $keys["status"] = $value["status"];
	            if ($value["status"]=='0') {
	                $keys=NULL;
	            }

	            $openshopset[$value['sname']] = $keys;
	        }

	        S('OPENSHPOSET_CONFIG',$openshopset);
	        $res = $openshopset[$shopname];
	    }

	    return $res;
	}


	/**
	 * 发送post请求  
	 * @param string $url 请求地址  
	 * @param array $post_data post键值对数据  
	 * @return string  
	 * @author 和蔼的木Q
	 */  
	public static function send_post($url, $post_data) {   
	  $postdata = http_build_query($post_data);   
	  $options = array(
	    'http' => array(
	      'method' => 'POST',
	      'header' => 'Content-type:application/x-www-form-urlencoded',
	      'content' => $postdata,
	      'timeout' => 60 * 60 // 超时时间（单位:s）   
	    )   
	  );   
	  $context = stream_context_create($options);   
	  $result = file_get_contents($url, false, $context);   
	  
	  return $result;   
	} 

	/**
	 * 拍拍开放平台API调用
	 * @param  array $post_data API结构  classname 调用的api类 q 调用参数
	 * @return array      结构数组
	 * @author 和蔼的木Q
	 * 调用示例
	 *  $post_data["classname"] = "TuanSearchGetRequest";
	 *  $post_data["q"] = array(
	 *      'sellerUin' => '5555555', 
	 *      'zhongwen' => 'cn',
	 *  );
	 *  openpaipai($post_data);
	 */
	public static function openpaipai($post_data){
	    $url = C("WEBSIT_DOMAIN").__ROOT__."/SDKpaipai/openget.php";
	    //$url = "http://www.jgjmall.com/SDKpaipai/src/openget.php";

	    $paipaiCfg = self::get_open_shopset("拍拍");

	    $post_data["uin"] = $paipaiCfg["uin"];
	    $post_data["userId"] = $paipaiCfg["userId"];
	    $post_data["appOAuthID"] = $paipaiCfg["appOAuthID"];
	    $post_data["appOAuthkey"] = $paipaiCfg["appOAuthkey"];
	    $post_data["accessToken"] = $paipaiCfg["accessToken"];


	    $res = self::send_post($url, $post_data);

	    if ($res == ""){
	        //$res = array();
	    }
	    else{
	        //$res = json_decode($res, true);
	    }

	    return $res;
	}

	/**
	 * 亿起发开放平台API调用
	 * @param  array $post_data API结构  classname 调用的api类 q 调用参数
	 * @return array      结构数组
	 * @author 和蔼的木Q
	 * 调用示例
	 *  $post_data["classname"] = "TuanSearchGetRequest";
	 *  $post_data["q"] = array(
	 *      'setFields' => 'tuan_pid,title,web_id,pdt_o_url,pic_url,ori_price,cur_price,begin_time,end_time,bought,tuan_catid,tuan_subcatid,city_id,city_name,discount,modified_time,total',
	 *      'setPage_no' => 1,
	 *      'setPage_size' => 2,
	 *      'setPrice_range' => "1,1000",
	 *      'setKeyword' => 1,
	 *  );
	 */
	public static function openyiqifa($post_data){
		$url = C("WEBSIT_DOMAIN").__ROOT__."/SDKyqf/openget.php";
	

		$yqfCfg = self::get_open_shopset("亿起发");


		$post_data["consumerKey"] = $yqfCfg["appkey"];
		$post_data["consumerSecret"] = $yqfCfg["appsecret"];
	
		$res = self::send_post($url, $post_data);
	
		if ($res == ""){
			$res = array();
		}
		else{
			$res = json_decode($res, true);
		}
		return $res;
	
	
	}
	
	/**
	 * 一起发获取商城类别
	 * @param  
	 * @param  
	 * @return array 商城类别数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function getshopcat(){
	    $websit_catlist = S('WEBSIT_CATLIST');
	    if(is_array($websit_catlist)){
	        //有缓存，直接使用缓存数据
	        $res = $websit_catlist;
	    }
	    else{
	        //无缓存，设置缓存
	        $websit_catlist = D("yqf_webcat");
	        $websit_catlist = M('yqf_webcat')->order('web_catid')->select();
	        S('WEBSIT_CATLIST',$websit_catlist);
	        $res = $websit_catlist;
	    }
	    return $res;
	}

	/**
	 * 一起发获取商品类别
	 * @param  
	 * @param  
	 * @return array 商城类别数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function getitemcat(){
	    $item_catlist = S('ITEM_CATLIST');
	    if(is_array($item_catlist)){
	        //有缓存，直接使用缓存数据
	        $res = $item_catlist;
	    }
	    else{
	        //无缓存，设置缓存
	        $item_catlist = D("yqf_itemcat");
	        $item_catlist = M('yqf_itemcat')->order('catid')->select();
	        S('ITEM_CATLIST',$item_catlist);
	        $res = $item_catlist;
	    }
	    return $res;
	}


	/**
	 * 一起发批量获取商品
	 * @param  string   itemcatid分类ID
	 * @param  string   pagesize 每页记录数 默认10
	 * @param  string   pageno 页码 默认1
	 * @param  string   webid 商城站点id 默认空
	 * @param  string   price_range 价格区间 默认空
	 * @return array 商品列表
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function getgoods($itemcatid='',$pagesize='10',$pageno='1',$webid='',$price_range=''){

	    $cachestr = "OPENGOODS-".$itemcatid."-".$pagesize."-".$pageno."-".$webid."-".$price_range;
	    $res = S($cachestr);
	    if(is_array($res)){
	        //有缓存，直接使用缓存数据
	    } else {
	        $post_data["classname"] = "ProductListGetRequest";
	        $post_data["q"] = array(
	           'setFields' => 'pid,p_name,web_id,web_name,ori_price,cur_price,pic_url,catid,cname,p_o_url,total', 
	           'setPage_no' => $pageno,
	           'setPage_size' => $pagesize,
	           'setPrice_range' => $price_range,
	           'setCatid' => $itemcatid,
	           'setWebid' => $webid,
	        );

	       $res = self::openyiqifa($post_data);
	       S($cachestr,$res);
	    }

	   return $res;
	}

















}



?>