<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//��ѯ�̼Ҵ�������(59miao.promocats.get)
	//�ɴ��ֶ�cid,parent_cid,name
	
	$fields = 'cid,parent_cid,name';

	$Api59miaoData=$api59miao->ListPromoCats($fields,'');
	print_r($Api59miaoData);





/*
 * * ����	 ����	 �Ƿ����	 ����	 ʾ��ֵ	 Ĭ��ֵ
	 * Fields	 Field List	 ����	 ��Ҫ���ص��ֶ�	 cid,parent_cid,
	 * 								is_parent,name	 cid,parent_cid,
	 * 										is_parent,name
	 * parent_cid	 Number	 �����ѡ	 �������ุ�� id��0��ʾ���ڵ�, ����ò���������������Ŀ�� (cids��parent_cid���ٴ�һ��)	  	  
	 * cids	 Number	 �����ѡ	 �����������ĿID�б��ð�Ƕ���(,)�ָ� ����:(18957,19562,)(cids��parent_cid���ٴ�һ��)	
	 * 
	 * Fields �ֶ�
	 * ����	 ����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * cid	 Number	 ��	 10	 ����������ķ���ID
	 * parent_cid	 Number	 ��	 0	 ����ĿID=0ʱ���������һ������Ŀ
	 * name	 String	 ��	 �ֻ�	 ��Ŀ����
 * */
?>