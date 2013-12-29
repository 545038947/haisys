<?php
	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=UTF-8");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	
	//查询商品详细(59miao.items.get)
	//可选参数	iid,click_url,seller_url,title,sid,seller_name,cid,desc,pic_url,price,cash_ondelivery,freeshipment,installment,has_invoice,modified,price_reduction,price_decreases,original_price
	
	$fields = 'iid,urls,click_url,seller_url,title,sid,seller_name,cid,desc,pic_url,price,cash_ondelivery,freeshipment,installment,has_invoice,modified,price_reduction,price_decreases,original_price';
	$Api59miaoData=$api59miao->ListItemsDetail('','http://www.360buy.com/product/1015638642.html',$fields);
	print_r($Api59miaoData);
//	echo '<div>';	
//	echo $Api59miaoData['items']['item'];
//	echo '</div>';
	
	//http://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.67&id=16908832271&is_b=1&cat_id=50025135&q=%C0%F1%B7%FE
	/*
	 * 
	 * Fields 字段
	 * 名称	 类型	 是否隐私	 示例值	 描述
	 * iid	 Number	 否	 129321	 商品编号
	 * urls  url    传入的商品url地址
	 * click_url	 String	 否	  	 商品推广网址
	 * seller_url	 String	 否	  	 商家推广网址
	 * title	 String	 否	  	 商品名称
	 * sid	 Number	 否	 33243	 商家编号
	 * seller_name	 String	 否	 京东商城	 商家名称
	 * cid	 Number	 否	 234	 商品分类ID
	 * desc	 String	 否	 好商品	 商品介绍
	 * pic_url	 String	 否	  	 商品图片
	 * price	 String	 否	 12.00	 商品价格
	 * cash_ondelivery	 Boolean	 否	 True	 货到付款
	 * freeshipment	 Boolean	 否	 True	 免运费
	 * installment	 Boolean	 否	 True	 分期付款
	 * has_invoice	 Boolean	 否	 True	 有发票
	 * modified	 Date	 否	 2010-10-12 16:37	 商品最后更新时间
	 * price_reduction	 Boolean	 否	 False	 该商品在一周之内是否有降价
	 * price_decreases	 String	 否	 1.50%	 降价幅度
	 * original_price	 String	 否	 14.00	 最近一次降价前的价格
	 * */
	
?>