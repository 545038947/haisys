<?php

define('IN_API59MIAO', true);
/* ��ʾ��
 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//��ѯ�̼���ϸ(59miao.shops.get)
	//�ɴ��ֶ�sid,name,desc,shop_cat,logo,created,modified,click_url,cashback,payment,shipment,shipment_fee,cash_ondelivery,freeshipment,installment,has_invoice,status
	
	$fields = 'sid,name,desc,shop_cat,logo,created,modified,click_url,cashback,payment,shipment,shipment_fee,cash_ondelivery,freeshipment,installment,has_invoice,status';
	
	
	/*
	* ListShopsDetail($sids, $fields = null)
	 * $sids �̼�id  14929
	 * $fields �ɴ���Ĳ���
	 * */
	$Api59miaoData=$api59miao->ListShopsDetail(14929,$fields);
	print_r($Api59miaoData);
	
	/*	 
	 * Fields �ֶ�
	 * ����	 ����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * sid	 Number	 ��	 2324	 �̼Ҷ�ӦID
	 * name	 String	 ��	 &#160;	 �̼�����
	 * desc	 String	 ��	 &#160;	 �̼ҽ���
	 * shop_cat	 ShopCat[]	 ��	 &#160;	 �̼���������
	 * logo	 String	 ��	 &#160;	 �̼�Logo
	 * created	 Date	 ��	 &#160;	 �̼ҳ���ʱ��
	 * modified	 Date	 ��	 &#160;	 �����޸�ʱ��
	 * click_url	 String	 ��	 &#160;	 �̼���ҳ��ַ
	 * cashback	Cashback[]	 ��	 &#160;	 �������
	 * payment	Payment[]	 ��	 &#160;	 ֧����ʽ
	 * shipment	Shopment[]	 ��	 &#160;	 ���ͷ�ʽ
	 * shipment_fee	 String	 ��	 &#160;	 �˷�˵��
	 * cash_ondelivery	 Boolean	 ��	 &#160;	 �Ƿ�֧�ֻ�������
	 * freeshipment	 Boolean	 ��	 &#160;	 �Ƿ�֧������ͻ�
	 * installment	 Boolean	 ��	 &#160;	 �Ƿ�֧�ַ��ڸ���
	 * has_invoice	 Boolean	 ��	 &#160;	 �Ƿ��з�Ʊ
	 * status	 String	 ��	 &#160;	 �̼�״̬ normal(����),deleted(ɾ��)
	 * */

?>