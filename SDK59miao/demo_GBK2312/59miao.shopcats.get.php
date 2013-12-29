<?php
define('IN_API59MIAO', true);
/* 提示：
 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
 * */
header("Content-type:text/html; charset=GB2312");
require '../library/init.inc.php';

$api59miao=new Api59miao($AppKeySecret);

//商家分类(59miao.shopcats.get)
//可传字段cid,name,count,status,sort_order

$fileds="cid,name,count,status,sort_order";
$Api59miaoData=$api59miao->ListShopCatsGet($fileds);
print_r($Api59miaoData);

/*
 * 	 * 名称	 类型	 是否必须	 描述	 示例值	 默认值
	 * Fields	 Field List	 必须	 需要返回的字段cid,name,count,status,sort_order	 cid,name,count	 cid,name,count
	 * cid	 Number	 可选	 商家是所属类目ID列表，用半角逗号(,)分割	
	 * 
	 * Fields 字段：
	 * 名称	 类型	 是否隐私	 示例值	 描述
	 * cid	 Number	 否	 10	 商家所属类目ID
	 * name	 String	 否	 图书音像	 类目名称
	 * count	 Number	 否	 123	 该类目拥有商家的个数
	 * status	 String	 否	 normal	 状态。可选值:normal(正常),deleted(删除)
	 * sort_order	 Number	 否	 1	 排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数
	 * 
 * */
?>