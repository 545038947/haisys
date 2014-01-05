<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 商品属性 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodsarrtModel extends Model {
    protected $_validate = array(
        array('name', 'require', '商品属性名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('goodsid', 'require', '商品属性对应商品ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('typeid', 'require', '商品属性对应类型ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('isgroup', 'require', '是否属性组不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('gid', 'require', '商品属性对应属性组ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('desc', 'require', '商品属性值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('arrttype', 'require', '属性类型：1主属性、2次要属性、3价格属性不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('displaytype', 'require', '显示类型：0字符串;1选择列表;2复选框;3单选框不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('sortorder', 'require', '排序值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

    );

    protected $_auto = array(
        
    );

}
