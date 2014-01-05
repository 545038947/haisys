<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 商品类型默认属性 模型
 * @author 和蔼的木Q <545038947@qq.com>
 */

class GoodstypearrtModel extends Model {
    protected $_validate = array(
        array('name', 'require', '商品属性名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
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


    /**
     * 获取分类树，指定属性则返回指定属性极其子属性，不指定则返回所有属性树
     * @param  integer $id    分类ID
     * @param  boolean $field 查询字段
     * @return array          分类树
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function getTree($id = 0, $field = true){
        /* 获取当前分类信息 */
        if($id){
            $info = $this->info($id);
            $id   = $info['id'];
        }

        /* 获取所有分类 */
        $map  = array('status' => array('gt', -1));
        $list = $this->field($field)->where($map)->order('sortorder')->select();
        $list = list_to_tree($list, $pk = 'id', $pid = 'gid', $child = '_', $root = $id);

        /* 获取返回数据 */
        if(isset($info)){ //指定分类则返回当前分类极其子分类
            $info['_'] = $list;
        } else { //否则返回所有分类
            $info = $list;
        }

        return $info;
    }

}
