<?php
header("Content-type: text/html; charset=utf-8");

if(!$_POST){
	echo "";
	die();
}

/////////////SDK的入口/////////////////
include "utils/YiqifaUtils.php";
include "utils/YiqifaOpen.php";

// 检测根目录,并定义成常量
define('ROOT',str_replace('/openget.php','',str_replace('\\','/',__FILE__)));


//获取参数
$consumerKey = $_POST["consumerKey"];
$consumerSecret = $_POST["consumerSecret"];
$classname = $_POST["classname"];//"TuanSearchGetRequest";
$q = $_POST["q"];

//实例化YiqifaOpen类
$c = new YiqifaOpen;
$c->consumerKey = $consumerKey;//"138655627865015183";
$c->consumerSecret = $consumerSecret;//"6652180706dd0f96559d4204970392b6";

$c->format="json";


$req = loadClass($classname);

foreach ($q as $key => $param) {
	$req->$key($param);
}


//执行API请求并打印结果
$resp = $c->execute($req);


if(strpos($resp,'yiqifaopen_problem')===false){
	echo $resp;
}else{
	echo '{"errors":{"error":[{"request":"'.$classname.'","error_code":"CA001","msg":"appkey is error!"}]}}';
}



//自动加载类
function loadClass($tgt){
	//带路径情况
	//$class = substr($tgt, strrpos($tgt, '.')+1);
	//require_once(ROOT.str_replace('.','/',$tgt).'.php');
	//不带路径情况

	$class = $tgt;
	require_once(ROOT . '/request/' .str_replace('.','/',$tgt).'.php');
	//echo ROOT . '/request/' .str_replace('.','/',$tgt).'.php';
	return new $class();	
}

?>