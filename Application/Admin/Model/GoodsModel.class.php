<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 商品 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodsModel extends Model {
    protected $_validate = array(
        array('name', 'require', '商品名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('supplierid', 'require', '供货商ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('goodscatid', 'require', '商品类别ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('goodstypeid', 'require', '商品类型ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('title', 'require', '商品标题不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('code', 'require', '商品编码不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('goodspic', 'require', '商品缩略图不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('price_1', 'require', '商品市场价格不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('price_2', 'require', '商品本店价格不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('starttime', 'require', '有效开始时间不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('endtime', 'require', '有效结束时间不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('desc', 'require', '商品详细描述不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('sortorder', 'require', '排序值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('sellstatus', 'require', '销售状态：上架，下架不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

    );

    protected $_auto = array(
        
    );

}
