<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//��ѯ��Ʒ�б�(59miao.items.search)
	//�ɴ��ֶ�iid,click_url,seller_url,title,sid,seller_name,cid,desc,pic_url,price,cash_ondelivery,freeshipment,installment,has_invoice,modified,price_reduction,price_decreases,original_price
	
	$fileds="iid,click_url";
	
	
	/*
	 *ListItemsSearch($fields,$keyword,$has_taobao=null,$cid = null, $sid = null, $page_no = 1, $page_size = 40,$star_price=null,$end_price=null,$sort=null)
	 * $fileds Ҫ�������ֶ�
	 * $keyword ��ʾ�����Ĺؼ���
	 * $has_taobao  �Ƿ���ʾ�Ա�����
	 * 
	 * */
	$Api59miaoData=$api59miao->ListItemsSearch($fileds,'Ůװ','', '0', '0', '1', '40');
	print_r($Api59miaoData);
	
	/*
	 * ����	 ����	 �Ƿ����	 ����	 ʾ��ֵ	 Ĭ��ֵ
	 * Fields	 Field List	 ����	 ��Ҫ���ص��ֶ�	 &#160;	 &#160;
	 * keyword	 String	 �����ѡ	 ������Ʒ�Ĺؼ��� keyword,cid,sid,seller_cids����ѡ������һ������	 N73	 &#160;
	 * cid	 Number	 �����ѡ	 ��Ʒ��������ID	 123	 &#160;
	 * sid	 Number	 �����ѡ	 ��Ʒ�����̼�ID	 1002	 &#160;
	 * seller_cids	 String	 �����ѡ	 �̼��Զ�����Ʒ����	 211,2232	 &#160;
	 * start_price	 Number	 ��ѡ	 ��ʼ���ۣ���ʼ���ۺ���߼۸����һ���룬���� start_price<=end_price	 10	 &#160;
	 * end_price	 Number	 ��ѡ	 ��߱���	 200	 &#160;
	 * sort	 String	 ��ѡ	 Ĭ������default
	 * price_desc
	 * price_asc
	 * modified_desc
	 * modified_asc	 price_desc	 &#160;
	 * cash_ondelivery	 Boolean	 ��ѡ	 �Ƿ�֧�ֻ�������	 true	 &#160;
	 * freeshipment	 Boolean	 ��ѡ	 �Ƿ�����ͻ�	 true	 &#160;
	 * installment	 Boolean	 ��ѡ	 �Ƿ�֧�ַ��ڸ���	 true	 &#160;
	 * has_invoice	 Boolean	 ��ѡ	 �Ƿ��з�Ʊ	 true	 &#160;
	 * price_reduction	 Boolean	 ��ѡ	 һ��֮���Ƿ��н���	 true	 &#160;
	 * page_no	 Number	 ��ѡ	 ���ҳ��(1-99)	 1	 1
	 * page_size	 Number	 ��ѡ	 ÿҳ���ؽ���������ÿҳ40	 40	 40
	 * outer_code	 String	 ��ѡ	 �Զ��������ַ�����Ӣ�ĺ������Գƣ��̶Ȳ��ܴ���12���ַ���	 abc	 &#160;
	 * 
	 * Fields�ֶ�
	 * ����	 ����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * iid	 Number	 ��	 129321	 ��Ʒ���
	 * click_url	 String	 ��	 &#160;	 ��Ʒ�ƹ���ַ
	 * seller_url	 String	 ��	 &#160;	 �̼��ƹ���ַ
	 * title	 String	 ��	 &#160;	 ��Ʒ����
	 * sid	 Number	 ��	 33243	 �̼ұ��
	 * seller_name	 String	 ��	 �����̳�	 �̼�����
	 * cid	 Number	 ��	 234	 ��Ʒ����ID
	 * desc	 String	 ��	 ����Ʒ	 ��Ʒ����
	 * pic_url	 String	 ��	 &#160;	 ��ƷͼƬ
	 * OrginalPicUrl	 String	 ��	 &#160;	 ��ƷԭʼͼƬ
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