<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 供货商管理 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class SupplierModel extends Model {
    protected $_validate = array(
        array('name', 'require', '供货商名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('cashbacks', 'require', '返点比例不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('sortorder', 'require', '排序值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

    );

    protected $_auto = array(
        
    );

}
