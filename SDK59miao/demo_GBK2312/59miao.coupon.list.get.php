<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);	
	//��ȡ�Ż�ȯ�б�API(59miao.coupon.list.get)	
	$fileds="coupon_id,title,sid,seller_name,seller_logo,seller_url,click_url,start_time,end_time,desc,item_count,limit,reduce";
	$sids='';      //�����̼�id
	$Api59miaoData=$api59miao->ListCouponList($fileds,$sids,'1', '40','hot_asc');
	print_r($Api59miaoData);
?>