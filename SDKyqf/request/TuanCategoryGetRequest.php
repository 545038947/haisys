<?php
/**
 * API:open.tuan.category.get
 * 
 * @author lsj
 *
 */
class TuanCategoryGetRequest
{
	/**
	 * ��ѯ�ֶΣ�TuanCategory���ݽṹ�Ĺ�����Ϣ�ֶ��б������ֵ�԰�Ƕ���(,)�ָ�
	 */
	 
	private $parent_id;
	
	private $fields;

	
	private $apiParams = array();
	
	public function setParent_id($parent_id)
	{
		$this->Parent_id = $parent_id;
		$this->apiParams["parent_id"] = $parent_id;
	}
	public function getParent_id()
	{
		return $this->parent_id;
	}
	
	public function setFields($fields)
	{
		$this->fields = $fields;
		$this->apiParams["fields"] = $fields;
	}
	public function getFields()
	{
		return $this->fields;
	}

	public function getApiMethodName()
	{
		return "open.tuan.category.get";
	}
	public function getApiParams()
	{
		
		return $this->apiParams;
	}
	public function putOtherTextParam($key,$value)
	{
		$this->apiParams[$key] = $value;
		$this->$key = $value;
	}
	
}
?>