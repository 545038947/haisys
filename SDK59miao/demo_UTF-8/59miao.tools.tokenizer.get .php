<?php
	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=UTF-8");
	require '../library/init.inc.php';
	$api59miao=new Api59miao($AppKeySecret);
	
	//分词列表列表(59miao.tools.tokenizer.get )
	//可传字段keyword
	
	//ListPromosListGet($fields=null,$sids = null, $cids = null, $page_no = 1, $page_size = 20, $outer_code = null)
	$fields = 'keyword';
	$Api59miaoData=$api59miao->ListTokenizer($fields,'衣香丽影 ol通勤波点拼接包臀 雪纺连衣裙9225503');
	print_r($Api59miaoData);
?>