<?php

//header("Content-type: text/html; charset=GBK");
header("Content-type: text/html; charset=utf-8");

include("initSdk.php");




//ʵ����YiqifaOpen��
$c = new YiqifaOpen;
//$c->consumerKey = "1331544511075406";
//$c->consumerSecret = "1d4abbec4489880adaf9154d948d9be8";
// $c->consumerKey = "1326528120671";
// $c->consumerSecret = "4090a94e6c98c2a3c3cf1634cdf29730";
$c->consumerKey = "138655627865015183";
$c->consumerSecret = "6652180706dd0f96559d4204970392b6";
$c->format="json";


//ʵ��������API��Ӧ��Request��
//$req = new  WebsiteListGetRequest;$req->setFields("web_id,web_name,web_catid,logo_url,web_o_url,commission,total");$req->setWtype(1);$req->setCatid("2");
//$req = new  ProductCategoryGetRequest;$req->setFields("catid,cname,parent_id,alias,is_parent,modified_time");$req->setParent_id(101000000);
//$req = new  BrandListGetRequest;$req->setFields("brand_id,brand_name,brand_catid,logopic_url,brand_o_url,total");$req->setCatid("1004");
//$req = new  CommentsGetRequest;$req->setFields("com_id,pid,com_title,content,star,good,bad,com_type,com_url,time,user,user_pic,user_url,modified_time");$req->setPdt_id(42666370, 45505907, 45505913);$req->setWtype("good,normal,less");$req->setWebid(2618);
//$req = new  YiqifaAdListGetRequest;$req->setFields("ad_id,ad_name,ad_catid,ad_cname,logo_url,ad_o_url,adver_name,adver_id,charge_type,audit_mode,ad_type,begin_date,end_date,create_time,modified_time,commission,introduction,confirm_time,total");$req->setCharge_type("cps");$req->setAd_catid("13");$req->setAudit_mode("");$req->setAd_type("web");
//$req = new ProductSearchGetRequest;$req->setFields("pid,p_name,web_id,web_name,ori_price,cur_price,pic_url,catid,cname,p_o_url,total");$req->setKeyword('�ʼǱ�');$req->setPage_no(1);$req->setPage_size(2);$req->setWebid("");$req->setCatid("");$req->setPrice_range("");$req->setOrderby(1);

//$req = new TuanCategoryGetRequest;$req->setFields("catid,cat_name,alias,is_parent,parent_id,create_time");$req->setParent_id(1);

 //$req = new  TuanProductListGetRequest;$req->setFields("tuan_pid,title,web_id,pdt_o_url,pic_url,ori_price,cur_price,begin_time,end_time,bought,tuan_catid,tuan_subcatid,city_id,city_name,discount,modified_time,total"); $req->setSubcatid(9999);
 $req = new  TuanSearchGetRequest;
 $req->setFields("tuan_pid,title,web_id,pdt_o_url,pic_url,ori_price,cur_price,begin_time,end_time,bought,tuan_catid,tuan_subcatid,city_id,city_name,discount,modified_time,total");
 $req->setSubcatid("");
 $req->setWeb_id("");
 $req->setCatid("");
 $req->setCity_id("");
 $req->setPage_no(1);
 $req->setPage_size(40);
 $req->setPrice_range("1,1000");
 $req->setKeyword(1);


//ִ��API���󲢴�ӡ���


$resp = $c->execute($req);

//$resp=iconv("UTF-8","GBK",$resp);

echo "<pre>";

//print_r(mb_convert_encoding( $resp, 'gbk','utf-8'));

print_r($resp);
//echo "<br>";


?>
