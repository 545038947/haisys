<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 商品类别 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodscatModel extends Model {
    protected $_validate = array(
        array('name', 'require', '商品类别名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('pid', 'require', '父类别ID,为0标示根节点不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('desc', 'require', '商品类别描述不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('sortorder', 'require', '排序值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

    );

    protected $_auto = array(
        
    );

}
