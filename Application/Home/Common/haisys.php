<?php


/**
 * 打印变量信息
 * @param  变量
 * @return void
 * @author 和蔼的木Q <545038947@qq.com>
 */
function P($v){
	echo "<pre>";
	print_r($v);
	echo "</pre>";
}


/**
 * 主导航栏
 * @param  
 * @return array 导航数据数组
 * @author 和蔼的木Q <545038947@qq.com>
 */
function mainnav(){
	$Model = M('Channel')->field('title,url,target')->where("status=1")->order("sort")->select();

	foreach ($Model as $key => $value) {
		if (stristr($value['url'],'http://')) {
			
		}
		else{

			$Model[$key]['url'] = U($value['url']);
			
			if ($Model[$key]['url'] == __SELF__) {
				$Model[$key]['cssclass'] = "active";
			}
			else{
				$Model[$key]['cssclass'] = "";
			}
			if (($value['url'] == 'Index/index') && __SELF__ == __ROOT__.'/' ) {
				$Model[$key]['cssclass'] = "active";
			}
		}
		
	}
	return $Model;
}





?>