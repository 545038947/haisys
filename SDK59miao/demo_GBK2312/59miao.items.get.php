<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	
	//��ѯ��Ʒ��ϸ(59miao.items.get)
	//��ѡ����	iid,click_url,seller_url,title,sid,seller_name,cid,desc,pic_url,price,cash_ondelivery,freeshipment,installment,has_invoice,modified,price_reduction,price_decreases,original_price
	
	$fields = 'iid,urls,click_url,seller_url,title,sid,seller_name,cid,desc,pic_url,price,cash_ondelivery,freeshipment,installment,has_invoice,modified,price_reduction,price_decreases,original_price';
	$Api59miaoData=$api59miao->ListItemsDetail('','http://www.360buy.com/product/1015638642.html',$fields);
	print_r($Api59miaoData);
//	echo '<div>';	
//	echo $Api59miaoData['items']['item'];
//	echo '</div>';
	
	//http://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.67&id=16908832271&is_b=1&cat_id=50025135&q=%C0%F1%B7%FE
	/*
	 * 
	 * Fields �ֶ�
	 * ����	 ����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * iid	 Number	 ��	 129321	 ��Ʒ���
	 * urls  url    �������Ʒurl��ַ
	 * click_url	 String	 ��	 &#160;	 ��Ʒ�ƹ���ַ
	 * seller_url	 String	 ��	 &#160;	 �̼��ƹ���ַ
	 * title	 String	 ��	 &#160;	 ��Ʒ����
	 * sid	 Number	 ��	 33243	 �̼ұ��
	 * seller_name	 String	 ��	 �����̳�	 �̼�����
	 * cid	 Number	 ��	 234	 ��Ʒ����ID
	 * desc	 String	 ��	 ����Ʒ	 ��Ʒ����
	 * pic_url	 String	 ��	 &#160;	 ��ƷͼƬ
	 * price	 String	 ��	 12.00	 ��Ʒ�۸�
	 * cash_ondelivery	 Boolean	 ��	 True	 ��������
	 * freeshipment	 Boolean	 ��	 True	 ���˷�
	 * installment	 Boolean	 ��	 True	 ���ڸ���
	 * has_invoice	 Boolean	 ��	 True	 �з�Ʊ
	 * modified	 Date	 ��	 2010-10-12 16:37	 ��Ʒ������ʱ��
	 * price_reduction	 Boolean	 ��	 False	 ����Ʒ��һ��֮���Ƿ��н���
	 * price_decreases	 String	 ��	 1.50%	 ���۷���
	 * original_price	 String	 ��	 14.00	 ���һ�ν���ǰ�ļ۸�
	 * */
	
?>