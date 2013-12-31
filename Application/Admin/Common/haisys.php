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
 * 循环删除目录和文件函数
 * @param  目录名称
 * @return 删除信息
 * @author 和蔼的木Q <545038947@qq.com>
 */
function delDirAndFile($dirName)
{
	$resstr = "";
	if ( $handle = opendir( "$dirName" ) ) {
		while ( false !== ( $item = readdir( $handle ) ) ) {
			if ( $item != "." && $item != ".." ) {
				if ( is_dir( "$dirName/$item" ) ) {
					$resstr = $resstr . delDirAndFile( "$dirName/$item" );
				} else {
					if( unlink( "$dirName/$item" ) )
						//echo "成功删除文件： $dirName/$item<br />\n";
						$resstr = $resstr . "成功删除文件： $dirName/$item<br />\n";
				}
			}
		}
		closedir( $handle );
		if( rmdir( $dirName ) )
			//echo "成功删除目录： $dirName<br />\n";
			$resstr = $resstr . "成功删除目录： $dirName<br />\n";
	}
	return $resstr;
}

/**
* 保存文件
* 
* @param string $fileName 文件名（含相对路径）
* @param string $text 文件内容
* @return boolean 
*/
function saveFile($fileName, $text) {
	if (!$fileName || !$text)
	 return false;

	if (makeDir(dirname($fileName))) {
	 if ($fp = fopen($fileName, "w")) {
	     if (@fwrite($fp, $text)) {
	         fclose($fp);
	         return true;
	     } else {
	         fclose($fp);
	         return false;
	     } 
	 } 
	} 
	return false;
} 

/**
* 连续创建目录
* 
* @param string $dir 目录字符串
* @param int $mode 权限数字
* @return boolean 
*/
function makeDir($dir, $mode = "0777") {
	 

	 if (!dir) return false;

	 if(!file_exists($dir)) {
	     return mkdir($dir,$mode,true);
	 } else {
	     return true;
	 } 
}

/**
 * 清除缓存
 * @param  无
 * @return 删除信息
 * @author 和蔼的木Q <545038947@qq.com>
 */
function clearallcache()
{
	return delDirAndFile(RUNTIME_PATH);
}



?>