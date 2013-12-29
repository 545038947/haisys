<?php

define('IN_API59MIAO', true);
/* 提示：
 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//广告api(59miao.ads.get)
	//可传字段click_url,pic_size,pic_url,ad_id,sid,sids,pic_size,title
	
	$fields = 'click_url,pic_size,pic_url,ad_id,sid,sids,pic_size,title';
	
	
	/*
	* AdsGet($sids,pic_size $fields = null)
	 * sids:商家编号，多个用","分开
	   pic_size:图片规则，可选值有200x200,250x250,300x250,336x280,160x600,120x600,234x60,468x60,726x90
	 * $fields 可传入的参数	 
	 * */
	$Api59miaoData=$api59miao->AdsGet('','250x250',$fields);
	print_r($Api59miaoData);
?>