<?php
/////////////SDK�����/////////////////
include "utils/YiqifaUtils.php";
include "utils/YiqifaOpen.php";
// ����Ŀ¼,������ɳ���
define('ROOT',str_replace('/initSdk.php','',str_replace('\\','/',__FILE__)));
function __autoload($classname) {
    require(ROOT . '/request/' . $classname . '.php');
	
}