<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	
	//��ȡ����(59miao.orders.report.get)
	//��ѡ����	order_id,seller_id,seller_name,app_key,created,order_amount,commission,status,outer_code
	
	$fields = 'order_id,seller_id,seller_name,app_key,created,order_amount,commission,status,outer_code';
	$Api59miaoData=$api59miao->ListOrderReport($fields,'20120521');
	print_r($Api59miaoData);
	
	/*
	 *  seller_name 	String 	�� 		�̼�����
		seller_id 	Number 	�� 	2342 	�̼ұ��
		order_id 	Number 	�� 		�������
		app_key 	Number 	�� 		Ӧ�ñ��
		created 	String 	�� 		
		order_amount 	String 	�� 		
		commission 	String 	�� 
	 * 
	 * */

?>