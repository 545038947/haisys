<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//�Ż�ȯAPI(59miao.coupon.get)
	//�ɴ��ֶ�coupon_id,title,sid,seller_name,seller_logo,seller_url,click_url,start_time,end_time,desc,item_count,limit,reduce
	
	
	$fields="coupon_id,title,sid,seller_name,seller_logo,seller_url,click_url,start_time,end_time,desc,item_count,limit,reduce";
	
	$coupon_id='30';
	$Api59miaoData=$api59miao->ListCoupon($fields,$coupon_id);
	print_r($Api59miaoData);	
	
	/*
	 * 
	 * coupon_id 	String 	�� 	10 	�Ż�ȯid
		title 	String 	�� 	ͼ������ 	�Ż�ȯ����
		sid 	String 	�� 	1111 	�̼ҵ�id
		seller_name 	String 	�� 	�����̳� 	�̼�����
		seller_logo 	String 	�� 	/img/123.gif 	�̼�logo
		seller_url 	String 	�� 	www.360buy.com 	�̼������ַ
		click_url 	String 	�� 	www.baidu.com 	�Ż�ȯ��ת����
		start_time 	String 	�� 	1362844800000 	�Ż�ȯ��ʼʱ��
		end_time 	String 	�� 	1362844800000 	�Ż�ȯ����ʱ��
		desc 	String 	�� 	11 	����
		item_count 	String 	�� 	11 	���ؽ���ļ�¼������
		limit 	String 	�� 	11 	��100��50�е���
		reduce 
	 * 
	 * 
	 * */

?>