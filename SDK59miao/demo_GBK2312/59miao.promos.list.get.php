<?php

	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//��ѯ�̼Ҵ����б�(59miao.promos.list.get )
	//�ɴ��ֶ�pid,title,click_url,seller_logo,start_time,end_time,sid,seller_name,seller_url,pic_url_1,pic_url_2,pic_url_3
	
	//ListPromosListGet($fields=null,$sids = null, $cids = null, $page_no = 1, $page_size = 20, $outer_code = null)
	$fields = 'pid,title,click_url,seller_logo,start_time,end_time,sid,seller_name,seller_url,pic_url_1,pic_url_2,pic_url_3';
	$Api59miaoData=$api59miao->ListPromosListGet($fields,'','','1','40');
	print_r($Api59miaoData);
	
	
	/*
	 * 	 * ����	 ����	 �Ƿ����	 ����	 ʾ��ֵ	 Ĭ��ֵ
	 * Fields	 Field List	 ����	 ��Ҫ���ص��ֶ�	  	  
	 * sids	 String	 ��ѡ	 �̼�id��.�������10��.��:"value1,value2,value3" ��" , "�ŷָ�id	  	  
	 * cids	 String	 ��ѡ	 ��������id��.	  	  
	 * page_no	 Number	 ��ѡ	 ���ҳ��(1-99)	 1	 1
	 * page_size	 Number	 ��ѡ	 ÿҳ���ؽ���������ÿҳ40	 40	 40
	 * outer_code	 String	 ��ѡ	 �Զ��������ַ�����Ӣ�ĺ������Գƣ��̶Ȳ��ܴ���12���ַ�	 abc	
	 * 
	 * Fields
	 * ����	 ����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * pid	 Number	 ��	 &#160;	 ����ID
	 * title	 String	 ��	 &#160;	 ��������
	 * click_url	 String	 ��	 &#160;	 ������ַ
	 * seller_logo	 String	 ��	 &#160;	 �����̼�Logo
	 * start_time	 Date	 ��	 &#160;	 ������ʼʱ��
	 * end_time	 Date	 ��	 &#160;	 ��������ʱ��
	 * sid	 Number	 ��	 &#160;	 �̼ұ��
	 * seller_name	 String	 ��	 &#160;	 �̼�����
	 * seller_url	 String	 ��	 &#160;	 �̼��ƹ��ַ
	 * pic_url_1	 String	 ��	 &#160;	 ����ͼƬ1
	 * pic_url_2	 String	 ��	 &#160;	 ����ͼƬ2
	 * pic_url_3	 String	 ��	 &#160;	 ����ͼƬ3
	 * */
	
?>