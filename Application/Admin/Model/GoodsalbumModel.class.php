<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 商品画册 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodsalbumModel extends Model {
    protected $_validate = array(
        array('goodsid', 'require', '对应商品ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('picid', 'require', '对应图片ID不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
array('sortorder', 'require', '排序值不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),

    );

    protected $_auto = array(
        
    );

}
