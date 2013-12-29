<?php
define('IN_API59MIAO', true);
/* 提示：
 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
 * */
header("Content-type:text/html; charset=UTF-8");
require '../library/init.inc.php';

$api59miao=new Api59miao($AppKeySecret);

//商家分类(59miao.shopcats.get)
//可传字段cid,name,count,status,sort_order

$fileds="sid,name,desc,shop_cat,logo,created,modified,click_url,cashback,payment,shipment,shipment_fee,cash_ondelivery,freeshipment,installment,has_invoice,status";
/*
 * $params可选参数 
 * page_no页数
 * page_size每页显示的数量   
 * cid 可选参数  表示查询指定类别的商品的所有商家信息   cid=15表示出售钟表眼镜的商家的信息
 * */
$params=Array('page_no' => 1, 'page_size' => 40,'cid'=>1);   
//$Api59miaoData=$api59miao->ShopListGet($fileds);  //$params不传参数 
$Api59miaoData=$api59miao->ListShopListGet($fileds,$params,true);
print_r($Api59miaoData);


/*
 * 	 * 名称	 			类型	 		是否必须	 	描述	 		示例值		 默认值
	 * Fields			Field List	 必须	 需要返回的字段	  	  
	 * cid	 			Number		 可选	 商品所属分类ID	 123	  
	 * sort	 			String	 	可选	 	默认排序：default
	 * 										created_desc
	 * 										created_asc	 	created_desc	  
	 * cash_ondelivery	Boolean	 	可选	 	是否支持货到付款	 true	  
	 * freeshipment	 	Boolean	 	可选	 	是否免费送货	 true	  
	 * installment	 	Boolean	 	可选	 	是否支持分期付款	 true	  
	 * has_invoice	 	Boolean	 	可选	 	是否有发票	  	  
	 * page_no	 		Number	 	可选	 	结果页数(1-99)	 1	 1
	 * page_size	 	Number	 	可选	 	每页返回结果数，最大每页40	 40	 40
	 * outer_code	 	String		 可选	 自定义输入字符串：英文和数字自称，不能大于12个字符	 abc
	 * 
	 * Fields 返回字段：
	 * 名称	 			类型	 是否隐私	 示例值	 描述
	 * sid	 			Number	 否	 2324	 商家对应ID
	 * name	 			String	 否	  	 商家名称
	 * desc	 			String	 否	  	 商家介绍
	 * shop_cat	 		ShopCat[]	 否	  	 商家所属分类
	 * logo	 			String	 否	  	 商家Logo
	 * created	 		Date	 否	  	 商家成立时间
	 * modified	 		Date	 否	  	 资料修改时间
	 * click_url	 	String	 否	  	 商家主页地址
	 * cashback			Cashback[]	 否	  	 返点介绍
	 * payment			Payment[]	 否	  	 支付方式
	 * shipment			Shopment[]	 否	  	 配送方式
	 * shipment_fee	 	String	 否	  	 运费说明
	 * cash_ondelivery	Boolean	 否	  	 是否支持货到付款
	 * freeshipment	 	Boolean	 否	  	 是否支持免费送货
	 * installment	 	Boolean	 否	  	 是否支持分期付款
	 * has_invoice	 	Boolean	 否	  	 是否有发票
	 * status	 		String	 否	  	 商家状态 normal(正常),deleted(删除)
	 *
*/

?>