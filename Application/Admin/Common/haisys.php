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