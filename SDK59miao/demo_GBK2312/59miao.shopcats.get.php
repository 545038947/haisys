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

$fileds="cid,name,count,status,sort_order";
$Api59miaoData=$api59miao->ListShopCatsGet($fileds);
print_r($Api59miaoData);

/*
 * 	 * ����	 ����	 �Ƿ����	 ����	 ʾ��ֵ	 Ĭ��ֵ
	 * Fields	 Field List	 ����	 ��Ҫ���ص��ֶ�cid,name,count,status,sort_order	 cid,name,count	 cid,name,count
	 * cid	 Number	 ��ѡ	 �̼���������ĿID�б��ð�Ƕ���(,)�ָ�	
	 * 
	 * Fields �ֶΣ�
	 * ����	 ����	 �Ƿ���˽	 ʾ��ֵ	 ����
	 * cid	 Number	 ��	 10	 �̼�������ĿID
	 * name	 String	 ��	 ͼ������	 ��Ŀ����
	 * count	 Number	 ��	 123	 ����Ŀӵ���̼ҵĸ���
	 * status	 String	 ��	 normal	 ״̬����ѡֵ:normal(����),deleted(ɾ��)
	 * sort_order	 Number	 ��	 1	 ������ţ���ʾͬ����Ŀ��չ�ִ�������ֵ��������ƴ������С�ȡֵ��Χ:�����������
	 * 
 * */
?>