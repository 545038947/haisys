<?php
define('IN_API59MIAO', true);
/* ��ʾ��
 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
 * */
header("Content-type:text/html; charset=GB2312");
require '../library/init.inc.php';

$api59miao=new Api59miao($AppKeySecret);

//�̼ҷ���(59miao.shopcats.get)
//�ɴ��ֶ�cid,name,count,status,sort_order

$fileds="sid,name,desc,shop_cat,logo,created,modified,click_url,cashback,payment,shipment,shipment_fee,cash_ondelivery,freeshipment,installment,has_invoice,status";
/*
 * $params��ѡ���� 
 * page_noҳ��
 * page_sizeÿҳ��ʾ������   
 * cid ��ѡ����  ��ʾ��ѯָ��������Ʒ�������̼���Ϣ   cid=15��ʾ�����ӱ��۾����̼ҵ���Ϣ
 * */
$params=Array('page_no' => 1, 'page_size' => 40,'cid'=>1);   
//$Api59miaoData=$api59miao->ShopListGet($fileds);  //$params�������� 
$Api59miaoData=$api59miao->ListShopListGet($fileds,$params,true);
print_r($Api59miaoData);


/*
 * 	 * ����	 			����	 		�Ƿ����	 	����	 		ʾ��ֵ		 Ĭ��ֵ
	 * Fields			Field List	 ����	 ��Ҫ���ص��ֶ�	 &#160;	 &#160;
	 * cid	 			Number		 ��ѡ	 ��Ʒ��������ID	 123	 &#160;
	 * sort	 			String	 	��ѡ	 	Ĭ������default
	 * 										created_desc
	 * 										created_asc	 	created_desc	 &#160;
	 * cash_ondelivery	Boolean	 	��ѡ	 	�Ƿ�֧�ֻ�������	 true	 &#160;
	 * freeshipment	 	Boolean	 	��ѡ	 	�Ƿ�����ͻ�	 true	 &#160;
	 * installment	 	Boolean	 	��ѡ	 	�Ƿ�֧�ַ��ڸ���	 true	 &#160;
	 * has_invoice	 	Boolean	 	��ѡ	 	�Ƿ��з�Ʊ	 &#160;	 &#160;
	 * page_no	 		Number	 	��ѡ	 	���ҳ��(1-99)	 1	 1
	 * page_size	 	Number	 	��ѡ	 	ÿҳ���ؽ���������ÿҳ40	 40	 40
	 * outer_code	 	String		 ��ѡ	 �Զ��������ַ�����Ӣ�ĺ������Գƣ����ܴ���12���ַ�	 abc
	 * 
	 * Fields �����ֶΣ�
	 * ����	 			����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * sid	 			Number	 ��	 2324	 �̼Ҷ�ӦID
	 * name	 			String	 ��	 &#160;	 �̼�����
	 * desc	 			String	 ��	 &#160;	 �̼ҽ���
	 * shop_cat	 		ShopCat[]	 ��	 &#160;	 �̼���������
	 * logo	 			String	 ��	 &#160;	 �̼�Logo
	 * created	 		Date	 ��	 &#160;	 �̼ҳ���ʱ��
	 * modified	 		Date	 ��	 &#160;	 �����޸�ʱ��
	 * click_url	 	String	 ��	 &#160;	 �̼���ҳ��ַ
	 * cashback			Cashback[]	 ��	 &#160;	 �������
	 * payment			Payment[]	 ��	 &#160;	 ֧����ʽ
	 * shipment			Shopment[]	 ��	 &#160;	 ���ͷ�ʽ
	 * shipment_fee	 	String	 ��	 &#160;	 �˷�˵��
	 * cash_ondelivery	Boolean	 ��	 &#160;	 �Ƿ�֧�ֻ�������
	 * freeshipment	 	Boolean	 ��	 &#160;	 �Ƿ�֧������ͻ�
	 * installment	 	Boolean	 ��	 &#160;	 �Ƿ�֧�ַ��ڸ���
	 * has_invoice	 	Boolean	 ��	 &#160;	 �Ƿ��з�Ʊ
	 * status	 		String	 ��	 &#160;	 �̼�״̬ normal(����),deleted(ɾ��)
	 *
*/

?>