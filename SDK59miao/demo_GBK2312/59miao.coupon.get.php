<?php
	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//优惠券API(59miao.coupon.get)
	//可传字段coupon_id,title,sid,seller_name,seller_logo,seller_url,click_url,start_time,end_time,desc,item_count,limit,reduce
	
	
	$fields="coupon_id,title,sid,seller_name,seller_logo,seller_url,click_url,start_time,end_time,desc,item_count,limit,reduce";
	
	$coupon_id='30';
	$Api59miaoData=$api59miao->ListCoupon($fields,$coupon_id);
	print_r($Api59miaoData);	
	
	/*
	 * 
	 * coupon_id 	String 	否 	10 	优惠券id
		title 	String 	否 	图书音响 	优惠券标题
		sid 	String 	否 	1111 	商家的id
		seller_name 	String 	否 	京东商城 	商家名字
		seller_logo 	String 	否 	/img/123.gif 	商家logo
		seller_url 	String 	否 	www.360buy.com 	商家网络地址
		click_url 	String 	否 	www.baidu.com 	优惠券跳转链接
		start_time 	String 	否 	1362844800000 	优惠券开始时间
		end_time 	String 	否 	1362844800000 	优惠券结束时间
		desc 	String 	否 	11 	排序
		item_count 	String 	否 	11 	返回结果的记录总条数
		limit 	String 	否 	11 	满100返50中的满
		reduce 
	 * 
	 * 
	 * */

?>