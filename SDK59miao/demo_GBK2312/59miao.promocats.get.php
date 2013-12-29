<?php
	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//查询商家促销分类(59miao.promocats.get)
	//可传字段cid,parent_cid,name
	
	$fields = 'cid,parent_cid,name';

	$Api59miaoData=$api59miao->ListPromoCats($fields,'');
	print_r($Api59miaoData);





/*
 * * 名称	 类型	 是否必须	 描述	 示例值	 默认值
	 * Fields	 Field List	 必须	 需要返回的字段	 cid,parent_cid,
	 * 								is_parent,name	 cid,parent_cid,
	 * 										is_parent,name
	 * parent_cid	 Number	 特殊可选	 促销分类父类 id，0表示根节点, 传输该参数返回所有子类目。 (cids、parent_cid至少传一个)	  	  
	 * cids	 Number	 特殊可选	 促销活动所属类目ID列表，用半角逗号(,)分隔 例如:(18957,19562,)(cids、parent_cid至少传一个)	
	 * 
	 * Fields 字段
	 * 名称	 类型	 是否隐私	 示例值	 描述
	 * cid	 Number	 否	 10	 促销活动所属的分类ID
	 * parent_cid	 Number	 否	 0	 父类目ID=0时，代表的是一级的类目
	 * name	 String	 否	 手机	 类目名称
 * */
?>