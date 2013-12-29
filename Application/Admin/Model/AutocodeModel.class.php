<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 代码生成配置模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class AutocodeModel extends Model {
    protected $_validate = array(
        array('name', 'require', '配置名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
    );

    protected $_auto = array(
        array('status', '1', self::MODEL_BOTH),
    );

}
