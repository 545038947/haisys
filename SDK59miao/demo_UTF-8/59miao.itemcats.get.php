<?php
define('IN_API59MIAO', true);
/* 提示：
 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
 * */
header("Content-type:text/html; charset=UTF-8");
require '../library/init.inc.php';
$api59miao=new Api59miao($AppKeySecret);

//商品分类 (59miao.itemcats.get)
//可传字段cid,parent_cid,name,is_parent,status

$fileds="cid,name,count,status,sort_order";
$Api59miaoData=$api59miao->ListItemCatsGet($fileds);
//print_r($Api59miaoData);

//获取指定 cids=19 下面的子分类
$params = Array('cids' => 19);
$ChildrenData=$api59miao->ListItemCatsGet($fileds,$params);
print_r($ChildrenData);

/**
	 * 商品分类 (59miao.itemcats.get)
	 * 名称	 类型	 是否必须	 描述	 示例值	 默认值
	 * Fields	 Field List	 必须	 需要返回的字段	 cid,parent_cid,
	 * 												is_parent,name	 cid,parent_cid,
	 * 												is_parent,name
	 * parent_cid	 Number	 特殊可选	 父商品类目 id，0表示根节点, 传输该参数返回所有子类目。 (cids、parent_cid至少传一个)	  	  
	 * cids	 Number	 特殊可选	 商品所属类目ID列表，用半角逗号(,)分隔 例如:(18957,19562,)(cids、parent_cid至少传一个)
	 * 
	 * Fields 字段
	 * 名称	 类型	 是否隐私	 示例值	 描述
	 * cid	 Number	 否	 10	 商品所属类目ID
	 * parent_cid	 Number	 否	 0	 父类目ID=0时，代表的是一级的类目
	 * name	 String	 否	 手机	 类目名称
	 * is_parent	 Boolean	 否	 true	 该类目是否为父类目(即：该类目是否还有子类目)
	 * status	 String	 否	 normal	 状态。可选值:normal(正常),deleted(删除)
	 * 
	 * @param Array $params
	 */
?>