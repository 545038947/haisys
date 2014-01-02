<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 商品类型管理 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodstypeModel extends Model {
    protected $_validate = array(
        array('name', 'require', '商品类型名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

    );

    protected $_auto = array(
        
    );

}
