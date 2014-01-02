<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 商品类型属性 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodstypearrtModel extends Model {
    protected $_validate = array(
        array('name', 'require', '商品属性名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('typeid', 'require', '商品属性对应类型ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('desc', 'require', '商品属性值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('arrttype', 'require', '属性类型：1主属性、2次要属性、3销售属性不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('sortorder', 'require', '排序值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

    );

    protected $_auto = array(
        
    );

}
