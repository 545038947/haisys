<?php
	define('IN_API59MIAO', true);
	/* ��ʾ��
	 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
	 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
	 * */
	header("Content-type:text/html; charset=GB2312");
	require '../library/init.inc.php';
	$api59miao=new Api59miao($AppKeySecret);
	
	//�ִ��б��б�(59miao.tools.tokenizer.get )
	//�ɴ��ֶ�keyword
	
	//ListPromosListGet($fields=null,$sids = null, $cids = null, $page_no = 1, $page_size = 20, $outer_code = null)
	$fields = 'keyword';
	$Api59miaoData=$api59miao->ListTokenizer($fields,'������Ӱ olͨ�ڲ���ƴ�Ӱ��� ѩ������ȹ9225503');
	print_r($Api59miaoData);
?>