<?php

define('IN_API59MIAO', true);
/* 提示：
 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
 * */
	header("Content-type:text/html; charset=UTF-8");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//获取画报列表API(59miao.pictorials.list.get)
	//可传字段pictorial_id,title,desc,pic_url,content
	
	$fields = 'pictorial_id,title,desc,pic_url,content';
	
	$Api59miaoData=$api59miao->PictorialsListGet($fields);
	print_r($Api59miaoData);
?>