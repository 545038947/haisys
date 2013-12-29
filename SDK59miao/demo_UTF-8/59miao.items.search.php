<?php
	define('IN_API59MIAO', true);
	/* 提示：
	 * 现乱码请检查library/config.php 文件编码和此编码是否相同，
	 * 如果网站编码为UTF-8则修改library/config.php 编码为UFT-8
	 * */
	header("Content-type:text/html; charset=UTF-8");
	require '../library/init.inc.php';
	
	$api59miao=new Api59miao($AppKeySecret);
	
	//查询商品列表(59miao.items.search)
	//可传字段iid,click_url,seller_url,title,sid,seller_name,cid,desc,pic_url,price,cash_ondelivery,freeshipment,installment,has_invoice,modified,price_reduction,price_decreases,original_price
	
	$fileds="iid,click_url";
	
	
	/*
	 *ListItemsSearch($fields,$keyword,$has_taobao=null,$cid = null, $sid = null, $page_no = 1, $page_size = 40,$star_price=null,$end_price=null,$sort=null)
	 * $fileds 要搜索的字段
	 * $keyword 表示搜索的关键字
	 * $has_taobao  是否显示淘宝数据
	 * 
	 * */
	$Api59miaoData=$api59miao->ListItemsSearch($fileds,'女装','', '0', '0', '1', '40');
	print_r($Api59miaoData);
	
	/*
	 * 名称	 类型	 是否必须	 描述	 示例值	 默认值
	 * Fields	 Field List	 必须	 需要返回的字段	  	  
	 * keyword	 String	 特殊可选	 检索商品的关键词 keyword,cid,sid,seller_cids至少选择其中一个参数	 N73	  
	 * cid	 Number	 特殊可选	 商品所属分类ID	 123	  
	 * sid	 Number	 特殊可选	 商品所属商家ID	 1002	  
	 * seller_cids	 String	 特殊可选	 商家自定义商品分类	 211,2232	  
	 * start_price	 Number	 可选	 起始报价，起始报价和最高价格必须一起传入，并且 start_price<=end_price	 10	  
	 * end_price	 Number	 可选	 最高报价	 200	  
	 * sort	 String	 可选	 默认排序：default
	 * price_desc
	 * price_asc
	 * modified_desc
	 * modified_asc	 price_desc	  
	 * cash_ondelivery	 Boolean	 可选	 是否支持货到付款	 true	  
	 * freeshipment	 Boolean	 可选	 是否免费送货	 true	  
	 * installment	 Boolean	 可选	 是否支持分期付款	 true	  
	 * has_invoice	 Boolean	 可选	 是否有发票	 true	  
	 * price_reduction	 Boolean	 可选	 一周之内是否有降价	 true	  
	 * page_no	 Number	 可选	 结果页数(1-99)	 1	 1
	 * page_size	 Number	 可选	 每页返回结果数，最大每页40	 40	 40
	 * outer_code	 String	 可选	 自定义输入字符串：英文和数字自称，程度不能大于12个字符。	 abc	  
	 * 
	 * Fields字段
	 * 名称	 类型	 是否隐私	 示例值	 描述
	 * iid	 Number	 否	 129321	 商品编号
	 * click_url	 String	 否	  	 商品推广网址
	 * seller_url	 String	 否	  	 商家推广网址
	 * title	 String	 否	  	 商品名称
	 * sid	 Number	 否	 33243	 商家编号
	 * seller_name	 String	 否	 京东商城	 商家名称
	 * cid	 Number	 否	 234	 商品分类ID
	 * desc	 String	 否	 好商品	 商品介绍
	 * pic_url	 String	 否	  	 商品图片
	 * OrginalPicUrl	 String	 否	  	 商品原始图片
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