<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//��ȡ�Ż�ȯ��API(59miao.coupon.item.get)
	//�ɴ��ֶ�coupon_key,coupon_value
	
	$fields="coupon_key,coupon_value";
	$coupon_id='30';
	$Api59miaoData=$api59miao->ListCouponItem($fields,$coupon_id);
	print_r($Api59miaoData);	

?>