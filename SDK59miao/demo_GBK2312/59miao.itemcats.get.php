<?php
define('IN_API59MIAO', true);
/* ��ʾ��
 * ����������library/config.php �ļ�����ʹ˱����Ƿ���ͬ��
 * �����վ����ΪUTF-8���޸�library/config.php ����ΪUFT-8
 * */
header("Content-type:text/html; charset=GB2312");
require '../library/init.inc.php';
$api59miao=new Api59miao($AppKeySecret);

//��Ʒ���� (59miao.itemcats.get)
//�ɴ��ֶ�cid,parent_cid,name,is_parent,status

$fileds="cid,name,count,status,sort_order";
$Api59miaoData=$api59miao->ListItemCatsGet($fileds);
//print_r($Api59miaoData);

//��ȡָ�� cids=19 ������ӷ���
$params = Array('cids' => 19);
$ChildrenData=$api59miao->ListItemCatsGet($fileds,$params);
print_r($ChildrenData);

/**
	 * ��Ʒ���� (59miao.itemcats.get)
	 * ����	 ����	 �Ƿ����	 ����	 ʾ��ֵ	 Ĭ��ֵ
	 * Fields	 Field List	 ����	 ��Ҫ���ص��ֶ�	 cid,parent_cid,
	 * 												is_parent,name	 cid,parent_cid,
	 * 												is_parent,name
	 * parent_cid	 Number	 �����ѡ	 ����Ʒ��Ŀ id��0��ʾ���ڵ�, ����ò���������������Ŀ�� (cids��parent_cid���ٴ�һ��)	  	  
	 * cids	 Number	 �����ѡ	 ��Ʒ������ĿID�б��ð�Ƕ���(,)�ָ� ����:(18957,19562,)(cids��parent_cid���ٴ�һ��)
	 * 
	 * Fields �ֶ�
	 * ����	 ����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * cid	 Number	 ��	 10	 ��Ʒ������ĿID
	 * parent_cid	 Number	 ��	 0	 ����ĿID=0ʱ���������һ������Ŀ
	 * name	 String	 ��	 �ֻ�	 ��Ŀ����
	 * is_parent	 Boolean	 ��	 true	 ����Ŀ�Ƿ�Ϊ����Ŀ(��������Ŀ�Ƿ�������Ŀ)
	 * status	 String	 ��	 normal	 ״̬����ѡֵ:normal(����),deleted(ɾ��)
	 * 
	 * @param Array $params
	 */
?>