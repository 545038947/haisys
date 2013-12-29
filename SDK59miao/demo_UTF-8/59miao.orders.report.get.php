<?php
	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=UTF-8");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	
	//获取订单(59miao.orders.report.get)
	//可选参数	order_id,seller_id,seller_name,app_key,created,order_amount,commission,status,outer_code
	
	$fields = 'order_id,seller_id,seller_name,app_key,created,order_amount,commission,status,outer_code';
	$Api59miaoData=$api59miao->ListOrderReport($fields,'20120521');
	print_r($Api59miaoData);
	
	/*
	 *  seller_name 	String 	否 		商家名称
		seller_id 	Number 	否 	2342 	商家编号
		order_id 	Number 	是 		订单编号
		app_key 	Number 	否 		应用编号
		created 	String 	否 		
		order_amount 	String 	否 		
		commission 	String 	否 
	 * 
	 * */

?>