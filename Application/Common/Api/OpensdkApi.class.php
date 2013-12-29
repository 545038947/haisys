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
	        S('OPENSHPOSET_CONFIG',null);
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
	        	$keys = array();
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
	 * 一起发获取够划算类别
	 * @param  
	 * @param  
	 * @return array 够划算类别数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function getghscat(){
        $post_data["classname"] = "GhsCatGetRequest";
        $post_data["q"] = array(
           'setFields' => 'ghs_catid,ghs_cname,sort_order', 
        );
		$res = self::openyiqifa($post_data);
		return $res["response"]["ghs_cats"]["ghs_cat"];

	}

	/**
	 * 一起发获取特卖网站
	 * @param  
	 * @param  
	 * @return array 特卖网站数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function gethotweb(){
        $post_data["classname"] = "HotactivityWebsiteGetRequest";
        $post_data["q"] = array(
           'setFields' => 'web_id,web_name,web_o_url', 
        );
		$res = self::openyiqifa($post_data);
		return $res["response"]["hot_webs"]["hot_web"];

	}

	/**
	 * 一起发获取特卖活动列表
	 * @param  $webid 特卖网站id
	 * @param  $page_no 页码
	 * @param  $page_size 每页记录数
	 * @return array 特卖活动数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function gethotactivitylist($webid='',$page_no='1',$page_size='10'){
		$cachestr = "OPENHOTACTIVITY-".$webid."-".$page_no."-".$page_size;
	    $res = S($cachestr);
	    if(is_array($res)){
	        return $res;
	    }
	    else
	    {
	        $post_data["classname"] = "HotactivityListGetRequest";

	        if ($webid == '') {
	        	return array();
	        }
	        else{
	        	$post_data["q"] = array(
		           'setFields' => 'hot_id,web_id,web_name,hot_name,pic_url,hot_o_url,discount,brand_name,hot_catid,begin_date,end_date,modified_time,total', 
		           'setPage_no' => "$page_no",
		           'setPage_size' => "$page_size",
		           'setWebid' => "$webid",
		        );
		    }
	        
			$res = self::openyiqifa($post_data);

			$res = $res["response"]["hot_list"]["hot"];
			S($cachestr,$res);
	    }

		return $res;

	}




	/**
	 * 一起发获取够划算商品
	 * @param  $catid 商品类型id
	 * @param  $page_no 页码
	 * @param  $page_size 每页记录数
	 * @return array 够划算商品数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function getghsitemlist($catid='',$page_no='1',$page_size='10'){
		$cachestr = "OPENGHSGOODS-".$catid."-".$page_no."-".$page_size;
	    $res = S($cachestr);
	    if(is_array($res)){
	        return $res;
	    }
	    else
	    {
	        $post_data["classname"] = "GhsProductListGetRequest";

	        if ($catid == '') {
	        	$post_data["q"] = array(
		           'setFields' => 'pid,web_name,p_name,ghs_o_url,ghs_catid,ghs_cname,weight,ori_price,ghs_price,discount,bought,pic_url,post,begin_time,end_time,total', 
		           'setPage_no' => "$page_no",
		           'setPage_size' => "$page_size",
		        );
	        }
	        else{
	        	$post_data["q"] = array(
		           'setFields' => 'pid,web_name,p_name,ghs_o_url,ghs_catid,ghs_cname,weight,ori_price,ghs_price,discount,bought,pic_url,post,begin_time,end_time,total', 
		           'setPage_no' => "$page_no",
		           'setPage_size' => "$page_size",
		           'setCategory' => "$catid",
		        );
		    }
	        
			$res = self::openyiqifa($post_data);
			$res = $res["response"]["ghs_list"]["ghs"];
			S($cachestr,$res);
	    }

		return $res;

	}



	/**
	 * 一起发够划算商品搜索
	 * @param  
	 * @param  
	 * @return array 够划算类别数组
	 * @author 和蔼的木Q <545038947@qq.com>
	 */
	public static function getghsitemsearch($keyword='手机',$page_no='1',$page_size='10'){

		//TODO : 官方无数据返回 待查
        $post_data["classname"] = "GhsSearchGetRequest";


    	$post_data["q"] = array(
           'setFields' => 'pid,web_name,p_name,ghs_o_url,ghs_catid,ghs_cname,weight,ori_price,ghs_price,discount,bought,pic_url,post,begin_time,end_time,total', 
           'setPage_no' => "$page_no",
           'setPage_size' => "$page_size",
           'setKeyword' => "$keyword",
        );

        
		$res = self::openyiqifa($post_data);

		return $res["response"]["ghs_list"]["ghs"];

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

	/**
	 * 实例化59秒开放平台
	 * @param  string  开放平台名称
	 * @return array      59秒开放平台实例
	 * @author 和蔼的木Q
	 */
	public static function get59miao()
	{
		$cfg59m = self::get_open_shopset("59秒");


		define('IN_API59MIAO', true);
		//设置时区
		date_default_timezone_set('Asia/Shanghai');
		define('ROOT_PATH',substr(dirname(__FILE__),0,-7));

		//设置获取数据的编码. 支持UTF-8 GBK GB2312 
		//需要 iconv或mb_convert_encoding 函数支持
		//UTF-8 不可写成UTF8
		define('CHARSET', 'UTF-8');

		// define('APPKEY','1003987'); //设置59秒appkey
		// define('APPSECRET','37a0c61e696dcc195a54ac6fef3b79e2');  //设置59秒appSecret
		define('APPKEY',$cfg59m["APPKEY"]); //设置59秒appkey
		define('APPSECRET',$cfg59m["APPSECRET"]);  //设置59秒appSecret

		define('APIURL', 'http://api.59miao.com/Router/Rest?'); //设置与59秒通信的地址
		//define('APIURL', 'http://192.168.1.100:8004/Router/Rest?'); //设置与59秒通信的地址
		//define('APICACHE_TIME','3600*24');   //1小时   设置缓存时间，单位为秒

		// define('API_CACHEPATH','Apicache');  //设置api缓存目录
		// define('API_CACHETIME','3600*24');  //设置api缓存时间   单位为秒   0表示不缓存

		define('API_CACHEPATH',$cfg59m["API_CACHEPATH"]);  //设置api缓存目录
		define('API_CACHETIME',$cfg59m["API_CACHETIME"]);  //设置api缓存时间   单位为秒   0表示不缓存



		//是否自动清除缓存
		//自动清除过期缓存的时间间隔，
		//格式是：* * * *
		//其中第一个数表示分钟，第二个数表示小时，第三个数表示日期，第四个数表示月份
		//多个之间可以用半角分号隔开
		//示例：
		//要求每天早上的8点1分清除缓存，格式是：1 8 * *
		//要求每个月的1号晚上12点5分清除缓存，格式是：5 12 1 *
		//要求每隔5天就在上午10点3分清除缓存，格式是：3 10 1,5,10,15,20,25 *
		//如果设为0或格式不对将不开启此功能
		//缓存清除操作每天只会执行一次
		//$apiConfig['ClearCache'] = "* 9 1,5,10,15,20,25 *"; //默认为每隔5天在上午9点-10点之间进行自动缓存清除  

		//define('API_CLEARCACHE', '1 23 * *');   //注意：只有在23点 1分执行文件才自动执行清除缓存
		define('API_CLEARCACHE', $cfg59m["API_CLEARCACHE"]);   //注意：只有在23点 1分执行文件才自动执行清除缓存

		// use Vendor\Api59miao;
		// use Vendor\Api59miao_cache;
		// use Vendor\Api59miao_Toos;
		// Vendor('Api59miao');
		// Vendor('Api59miao_cache');
		// Vendor('Api59miao_Toos');
		//获取appkey  appsecret 信息
		$AppKeySecret = Api59miao_Toos::GetAppkeySecret();

		return new Api59miao($AppKeySecret);
	}

	/**
	 * 59秒开放平台商品类别
	 * @param  string  开放平台名称
	 * @return array      59秒开放平台实例
	 * @author 和蔼的木Q
	 */
	public static function get59miaoitemcat($cids)
	{
		//获取59秒商品类别
        $api59miao = self::get59miao();
        //$datalist = 
        $fileds="cid,name,is_parent,status";
        $params = Array('cids' => $cids);
        $Api59miaoData=$api59miao->ListItemCatsGet($fileds,$params);

        return $Api59miaoData['itemcats']['itemcat'];

	}

	/**
	 * 59秒开放平台获取促销列表
	 * @param  string  开放平台名称
	 * @return array      59秒开放平台实例
	 * @author 和蔼的木Q
	 */
	public static function get59miaopromoslist($cids)
	{
		//获取59秒商品类别
        $api59miao = self::get59miao();

	
	//查询商家促销列表(59miao.promos.list.get )
	//可传字段pid,title,click_url,seller_logo,start_time,end_time,sid,seller_name,seller_url,pic_url_1,pic_url_2,pic_url_3
	
	//ListPromosListGet($fields=null,$sids = null, $cids = null, $page_no = 1, $page_size = 20, $outer_code = null)
	$fields = 'pid,title,click_url,seller_logo,start_time,end_time,sid,seller_name,seller_url,pic_url_1,pic_url_2,pic_url_3';
	$params = Array(
		'cids' => $cids,
		'out_code' => 'test111',
	);
	$Api59miaoData=$api59miao->ListPromosListGet($fields,'','','1','40','test111');




        return $Api59miaoData;

	}





















}



?>