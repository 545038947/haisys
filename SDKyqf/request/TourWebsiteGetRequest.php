<?php 
/**
 * API:open.tour.website.get
 * 
 * @author lsj
 *
 */
class TourWebsiteGetRequest
{
	/**
	 * ��ѯ�ֶΣ�TourWebsite���ݽṹ�Ĺ�����Ϣ�ֶ��б��������ֵ�԰�Ƕ���(,)�ָ�
	 */
	private $fields;

	private $apiParams = array();
	
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
		return "open.tour.website.get";
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