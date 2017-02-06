<?php
/**
 * Powerd by ArPHP.
 *
 * Controller.
 *
 * @author ycassnr <ycassnr@gmail.com>
 */

/**
 * Default Controller of webapp.
 */
class LinkerController extends WeChatController {
    /**
     * 微信登录
     * @return void
     */
    public function loginToWeixinAction()
    {
        // 跳转绑定页面
        $authUrl = arComp('ext.weixin')->authToUrl(arU('Show/bind', array(), 'FULL'), 'snsapi_userinfo');

        $this->redirect($authUrl);

    }

}
