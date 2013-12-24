<?php
// +----------------------------------------------------------------------
// | Author: 和蔼的木Q <545038947@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台系统类功能控制器
 * @author 和蔼的木Q <545038947@qq.com>
 */
class SystemController extends AdminController {

    //static protected $allow = array( 'verify');

    /**
     * 默认首页
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function index(){

    	if(UID){
            $this->display();
        } else {
            $this->redirect('Public/login');
        }
    }

    /**
     * 清空缓存
     * @author 和蔼的木Q <545038947@qq.com>
     */
    public function clearcache(){

        if(UID){
            clearallcache();
            $this->success('缓存清理完成！');

        } else {
            $this->error('无效的引用！');

        }
    }


}
