<?php

define('IN_API59MIAO', true);
/* ��ʾ��
 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//��ȡ������Ϣ(59miao.pictorials.get)
	//�ɴ��ֶ�pictorial_id,title,desc,pic_url,content

	
	$fields = 'pictorial_id,title,desc,pic_url,content';
		
	$Api59miaoData=$api59miao->PictorialsGet($fields,'18');
	print_r($Api59miaoData);
?>