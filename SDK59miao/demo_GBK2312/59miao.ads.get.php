<?php

define('IN_API59MIAO', true);
/* ��ʾ��
 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//���api(59miao.ads.get)
	//�ɴ��ֶ�click_url,pic_size,pic_url,ad_id,sid,sids,pic_size,title
	
	$fields = 'click_url,pic_size,pic_url,ad_id,sid,sids,pic_size,title';
	
	
	/*
	* AdsGet($sids,pic_size $fields = null)
	 * sids:�̼ұ�ţ������","�ֿ�
	   pic_size:ͼƬ���򣬿�ѡֵ��200x200,250x250,300x250,336x280,160x600,120x600,234x60,468x60,726x90
	 * $fields �ɴ���Ĳ���	 
	 * */
	$Api59miaoData=$api59miao->AdsGet('','250x250',$fields);
	print_r($Api59miaoData);
?>