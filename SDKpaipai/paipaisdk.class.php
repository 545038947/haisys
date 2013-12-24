<?php
/**
 * ============================================================================
 * 版权所有 2008-2012 多多网络，并保留所有权利。
 * 网站地址: http://soft.duoduo123.com；
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
*/

define('APPROOT', '/onethink');

class paipai{
	public $appuser;
	public $cache_time=0;
	public $errorlog=0;
	public $userId;
	public $qq;
	public $appOAuthID;
	public $secretOAuthKey;
	public $accessToken;
	public $paipaicpsurl='http://api.paipai.com';
	public $charset='utf-8';
	public $format='json';
	public $pureData=1;
	public $nowords;
	
	public function __construct($appuser,$paipai_set){
		$this->appuser=$appuser;
		$this->userId=$paipai_set['userId'];
		$this->qq=$paipai_set['qq'];
		$this->appOAuthID=$paipai_set['appOAuthID'];
		$this->secretOAuthKey=$paipai_set['secretOAuthKey'];
		$this->accessToken=$paipai_set['accessToken'];
		$this->fxbl=$paipai_set['fxbl'];	//返现比例
		$this->cache_time=(int)$paipai_set['cache_time'];
		$this->errorlog=(int)$paipai_set['errorlog'];
		if(REPLACE<3){
			$noword_tag='';
		}
		else{
			$noword_tag='3';
		}
		$this->nowords="白酒";//dd_get_cache('no_words'.$noword_tag);
	}
	
	public function build_query($parame){
		$parame['charset']=$this->charset;
		$parame['format']=$this->format;
		$parame['pureData']=$this->pureData;
		return http_build_query($parame);
	}
	
	function cache_dir($parame){
		unset($parame['userId']); //去掉userid参数，使不同的访问者使用相同的缓存
		$cacheid=md5($this->build_query($parame));
		return $cache_dir=APPROOT.'/Runtime/Temp/paipai/'.substr($cacheid,0,2).'/'.$cacheid.'.json';
	}
	
	function get_cache($parame,$api_name){
		$cache_dir=$this->cache_dir($parame);
		if(file_exists($cache_dir) && TIME-filectime($cache_dir)<=$this->cache_time*3600 && $api_name!='/cps/etgReportCheck.xhtml'){
			return $row=json_decode(file_get_contents($cache_dir),1); 
		}
		else{
			return $cache_dir;
		}
	}
	
	/**
	 *执行api获取结果
	 */
	function get($api_name,$parame){
		$val=$this->get_cache($parame,$api_name);
		if(is_array($val)){
			return $val;
		}
		$cache_dir=$val;
		$url=$this->paipaicpsurl.$api_name.'?'.$this->build_query($parame);
		//$b=dd_get_json($url);
		$b = file_get_contents($url);

		return $b;
	}


	/**
	 *通过关键字搜索商品信息
	 */
	public function cpsCommSearch($parame){
		$api_name='/cps/cpsCommSearch.xhtml';
		$parame['userId']=$this->userId;
		$parame['outInfo']=$this->appuser['id'];
		$parame['pageIndex']=$parame['pageSize']*($parame['pageIndex']-1)+1;
		if(is_numeric($parame['begPrice'])){
			$parame['begPrice']*=100;
		}
		if(is_numeric($parame['endPrice'])){
			$parame['endPrice']*=100;
		}


		
		$res=$this->get($api_name,$parame);

		return $res;
	}
	
	/**
	 *通过商品COMMID获取单个商品信息
	 */
	function cpsCommQueryAction($parame){
		$api_name='/cps/cpsCommQueryAction.xhtml';
		$parame['userId']=$this->userId;
		$parame['outInfo']=$this->appuser['id'];
		$parame['commId']=$parame['commId'];
		$res=$this->get($api_name,$parame);
		return $res;
	}

	/**
	 *通过商品链接获取单个商品信息
	 */
	function cpsCommQueryByKey($parame){
		$api_name='/cps/cpsCommQueryAction.xhtml';
		$qurl = $parame['url'];//"http://item.wanggou.com/911B195F00000000040100003089F778";
		$commId=$this->url2commId($qurl);
		$parame['userId']=$this->userId;
		$parame['outInfo']=$this->appuser['id'];
		$parame['commId']=$commId;
		$res=$this->get($api_name,$parame);
		return $res;
	}
	
	function etgReportCheck($parame=array()){
		$api_name='/cps/etgReportCheck.xhtml';
		$sys_parame = array ('timeStamp' => time(), 'randomValue' => 123456, 'uin' => $this->qq, 'accessToken' => $this->accessToken, 'appOAuthID' => $this->appOAuthID);
		$request_parame = array (
			'charset' => $this->charset,
			'format' => $this->format,
			'pureData' => 1,
			'beginTime' => $parame['beginTime']?$parame['beginTime']:date('Y-m-d'),
			'endTime'=>$parame['beginTime']?$parame['beginTime'].' 23:59:59':date('Y-m-d').' 23:59:59',
			'reportType'=>1,
			'pageIndex'=>$parame['pageIndex']?$parame['pageIndex']:1,
			'pageSize'=>$parame['pageSize']?$parame['pageSize']:40,
			'userId'=>$this->qq
		);
		
		$parame=$sys_parame+$request_parame;
		ksort($parame);
		$str='';
		
		foreach($parame as $k=>$v){
			$str.=$k.'='.$v.'&';
		}
		$str=preg_replace('/&$/','',$str);
		$str='GET&'.rawurlencode($api_name).'&'.rawurlencode($str);
		$sign=base64_encode(hash_hmac('sha1',$str,$this->secretOAuthKey.'&',true));
		$parame['sign']=$sign;
		$row=$this->get($api_name,$parame);

		//$total=$row['EtgReportResult']['totalNum'];
		//$row=$row['EtgReportResult']['etgReportDatas'];
		//$row['total']=$total;
		return $row;
	}
	
	function url2commId($url){
		preg_match('#[0-9A-Z]{32}#',$url,$a);
		return $a[0];
	}
}
?>