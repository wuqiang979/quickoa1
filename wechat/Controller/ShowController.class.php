<?php
class ShowController extends WeChatController
{
    // 绑定
    public function bindAction()
    {
        if ($code = arRequest('code')) :
            try {
                $accessInfo = arModule('wechat.Base')->wechat->getAuthAccessToken($code);
                $userInfo = arModule('wechat.Base')->wechat->getUserInfo($accessInfo['access_token'], $accessInfo['openid']);
                $uid = arComp('list.session')->get('u_id');
                // 绑定用户
                $bindResultUid = arModule('wechat.Base')->bindUser($uid, $userInfo);
                // 保存登录session
                $setSession = arModule('Lib.User')->setSession($bindResultUid);
                if ($bindResultUid && $setSession) :
                    $this->redirect('/main/Index/index');
                else :
                    $this->redirectError('/main/Index/index', '绑定错误');
                endif;

            } catch (Exception $e) {
                $this->redirectError('/main/Index/index', $e->getMessage(), '20');
            }
        else :
            $this->redirectError('/main/Index/index', '回调参数错误');
        endif;

    }

    // 取消绑定
    public function unBindAction()
    {


    }

}
