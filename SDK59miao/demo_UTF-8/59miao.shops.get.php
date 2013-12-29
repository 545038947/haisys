<?php

define('IN_API59MIAO', true);
/* 提示：
 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
 * */
	header("Content-type:text/html; charset=UTF-8");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//查询商家详细(59miao.shops.get)
	//可传字段sid,name,desc,shop_cat,logo,created,modified,click_url,cashback,payment,shipment,shipment_fee,cash_ondelivery,freeshipment,installment,has_invoice,status
	
	$fields = 'sid,name,desc,shop_cat,logo,created,modified,click_url,cashback,payment,shipment,shipment_fee,cash_ondelivery,freeshipment,installment,has_invoice,status';
	
	
	/*
	* ListShopsDetail($sids, $fields = null)
	 * $sids 商家id  14929
	 * $fields 可传入的参数
	 * */
	$Api59miaoData=$api59miao->ListShopsDetail(14929,$fields);
	print_r($Api59miaoData);
	
	/*	 
	 * Fields 字段
	 * 名称	 类型	 是否隐私	 示例值	 描述
	 * sid	 Number	 否	 2324	 商家对应ID
	 * name	 String	 否	  	 商家名称
	 * desc	 String	 否	  	 商家介绍
	 * shop_cat	 ShopCat[]	 否	  	 商家所属分类
	 * logo	 String	 否	  	 商家Logo
	 * created	 Date	 否	  	 商家成立时间
	 * modified	 Date	 否	  	 资料修改时间
	 * click_url	 String	 否	  	 商家主页地址
	 * cashback	Cashback[]	 否	  	 返点介绍
	 * payment	Payment[]	 否	  	 支付方式
	 * shipment	Shopment[]	 否	  	 配送方式
	 * shipment_fee	 String	 否	  	 运费说明
	 * cash_ondelivery	 Boolean	 否	  	 是否支持货到付款
	 * freeshipment	 Boolean	 否	  	 是否支持免费送货
	 * installment	 Boolean	 否	  	 是否支持分期付款
	 * has_invoice	 Boolean	 否	  	 是否有发票
	 * status	 String	 否	  	 商家状态 normal(正常),deleted(删除)
	 * */

?>