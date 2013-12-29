<?php

	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=UTF-8");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//查询商家促销列表(59miao.promos.list.get )
	//可传字段pid,title,click_url,seller_logo,start_time,end_time,sid,seller_name,seller_url,pic_url_1,pic_url_2,pic_url_3
	
	//ListPromosListGet($fields=null,$sids = null, $cids = null, $page_no = 1, $page_size = 20, $outer_code = null)
	$fields = 'pid,title,click_url,seller_logo,start_time,end_time,sid,seller_name,seller_url,pic_url_1,pic_url_2,pic_url_3';
	$Api59miaoData=$api59miao->ListPromosListGet($fields,'','','1','40');
	print_r($Api59miaoData);
	
	
	/*
	 * 	 * 名称	 类型	 是否必须	 描述	 示例值	 默认值
	 * Fields	 Field List	 必须	 需要返回的字段	  	  
	 * sids	 String	 可选	 商家id串.最大输入10个.如:"value1,value2,value3" 用" , "号分隔id	  	  
	 * cids	 String	 可选	 促销分类id串.	  	  
	 * page_no	 Number	 可选	 结果页数(1-99)	 1	 1
	 * page_size	 Number	 可选	 每页返回结果数，最大每页40	 40	 40
	 * outer_code	 String	 可选	 自定义输入字符串：英文和数字自称，程度不能大于12个字符	 abc	
	 * 
	 * Fields
	 * 名称	 类型	 是否隐私	 示例值	 描述
	 * pid	 Number	 否	  	 促销ID
	 * title	 String	 否	  	 促销标题
	 * click_url	 String	 否	  	 促销地址
	 * seller_logo	 String	 否	  	 促销商家Logo
	 * start_time	 Date	 否	  	 促销开始时间
	 * end_time	 Date	 否	  	 促销结束时间
	 * sid	 Number	 否	  	 商家编号
	 * seller_name	 String	 否	  	 商家名称
	 * seller_url	 String	 否	  	 商家推广地址
	 * pic_url_1	 String	 否	  	 促销图片1
	 * pic_url_2	 String	 否	  	 促销图片2
	 * pic_url_3	 String	 否	  	 促销图片3
	 * */
	
?>