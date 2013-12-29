<?php
	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);	
	//获取优惠券列表API(59miao.coupon.list.get)	
	$fileds="coupon_id,title,sid,seller_name,seller_logo,seller_url,click_url,start_time,end_time,desc,item_count,limit,reduce";
	$sids='';      //传入商家id
	$Api59miaoData=$api59miao->ListCouponList($fileds,$sids,'1', '40','hot_asc');
	print_r($Api59miaoData);
?>