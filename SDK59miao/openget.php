<?php
/**
 * 
 * @author 和蔼的木Q
 * QQ:545038947
 */

//START 设置基础配置

if(!$_POST){
	echo "";
	die();
}
//设置获取数据的编码. 支持UTF-8 GBK GB2312 
//需要 iconv或mb_convert_encoding 函数支持
//UTF-8 不可写成UTF8
define('CHARSET', 'UTF-8');



// define('APPKEY','1003987'); //设置59秒appkey
// define('APPSECRET','37a0c61e696dcc195a54ac6fef3b79e2');  //设置59秒appSecret
define('APPKEY',$_POST["APPKEY"]); //设置59秒appkey
define('APPSECRET',$_POST["APPSECRET"]);  //设置59秒appSecret

define('APIURL', 'http://api.59miao.com/Router/Rest?'); //设置与59秒通信的地址
//define('APIURL', 'http://192.168.1.100:8004/Router/Rest?'); //设置与59秒通信的地址
//define('APICACHE_TIME','3600*24');   //1小时   设置缓存时间，单位为秒
define('API_CACHEPATH','Apicache');  //设置api缓存目录
define('API_CACHETIME','3600*24');  //设置api缓存时间   单位为秒   0表示不缓存
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

define('API_CLEARCACHE', '1 23 * *');   //注意：只有在23点 1分执行文件才自动执行清除缓存

//END 设置基础配置


	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=UTF-8");
	require './library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);	

	$fileds="coupon_id,title,sid,seller_name,seller_logo,seller_url,click_url,start_time,end_time,desc,item_count,limit,reduce";
	$sids='';      //传入商家id
	$Api59miaoData=$api59miao->ListCouponList($fileds,$sids,'1', '40','hot_asc');
	print_r($Api59miaoData);
?>