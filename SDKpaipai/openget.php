<?php
/**
 * Created by 和蔼的木Q
 * 说明：post 和 get方法都可以使用
 * sdk 入口文件
 * User: 和蔼的木Q
 * Date: 13-12-10
 * Time: 下午1:02
 */

header("Content-type: text/html; charset=utf-8");
if(!$_POST){
	echo "";
	die();
}
//获取参数
$uin = $_POST["uin"];
$appOAuthID = $_POST["appOAuthID"];
$appOAuthkey = $_POST["appOAuthkey"];
$accessToken = $_POST["accessToken"];
$userId = $_POST["userId"];

include('./paipaisdk.class.php');
$paipai_set['qq'] = $uin;
$paipai_set['appOAuthID'] = $appOAuthID;
$paipai_set['secretOAuthKey'] = $appOAuthkey;
$paipai_set['accessToken'] = $accessToken;
$paipai_set['userId']=$userId;
$paipai_set['cache_time']=0;//缓存时间 单位小时，0为不缓存
$paipai_set['errorlog']=0; //宠物日志，0关闭 1开启

    //设置调用参数
    
$q = $_POST["q"];

$appuser = array();
$appuser['id'] = 1;

$apiname = $_POST["api"];

$paipai=new paipai($appuser,$paipai_set);

$thegoods=$paipai->$apiname($q);
echo $thegoods;


?>