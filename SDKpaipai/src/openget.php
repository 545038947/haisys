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


require_once './PaiPaiOpenApiOauth.php';
// Begin使用者信息：
// 以下四项鉴权参数 ，需要使用人员自行填写自己申请到的的相关信息
//获取参数

    $uin = $_POST["uin"];//"545038947";
    $appOAuthID = $_POST["appOAuthID"];//"700155269";
    $appOAuthkey = $_POST["appOAuthkey"];//"OEUa2b2kHGogp94Z";
    $accessToken = $_POST["accessToken"];//"c4b9f95298ee19e2f36d93086a3b1751";


	$q = $_POST["q"];





// End使用者信息

	$sdk = new PaiPaiOpenApiOauth($appOAuthID, $appOAuthkey, $accessToken, $uin);

// 设置开启调试模式。
// true为开启，开启后，在显示页面会打印相关信息；false为关闭，使用者可以将其关闭，关闭不影响结果
	$sdk->setDebugOn(false);

// Begin参数设置:

    // 注意 示例中可能的url为 http://api.paipai.com/deal/sellerSearchDealList.xhtml?a=1&b=2&c=3
    // 设置 用户需要调用的腾讯开放平台提供的接口。此处，按照上一行中的url，则用户要输入/deal/sellerSearchDealList.xhtml，前面不加hostname。

	//设置api接口路径
    $apipath = "/".$_POST["api"].".xhtml";
    $sdk->setApiPath($apipath);//这个是用户需要调用的 接口函数
	// 用户使用的提交数据的方法。post 和 get均可；以及字符集
    $sdk->setMethod("get");//post
    $sdk->setCharset("utf-8");//gbk


    // 以下部分用于设置用户在调用相关接口时url中"?"之后的各个参数，如上述描述中的a=1&b=2&c=3
    $params = &$sdk->getParams();//注意，这里使用的是引用，故可以直接使用
    // 设置返回格式  json/xml
    $params["format"] = "json";

    //设置调用参数
    

    foreach ($q as $key => $param) {
		$params[$key] = $param;
	}

	print_r($params);

    //设置http请求接受的主机名，默认是 api.buy.qq.com。此处用户可不用修改
    //$sdk->setHostName("apitest.buy.qq.com");
// End参数设置

//run
try {
    $response = $sdk->invoke();
    //print_r("<br/>-----------response---------<br/>");
    //print_r($response);
    echo $response;
} catch(Exception $e) {
    printf("Request Failed!. code:%d, msg:%s\n",$e->getCode(), $e->getMessage());
}

?>