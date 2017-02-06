<?php
namespace wechat\Module;
class BaseModule
{
    // 微信对象
    public $wechat;

    public function initModule()
    {
        \WechatConfigModel::model()->setConfig();
        $this->wechat = arComp('ext.weixin');

    }

    // 是否微信客户端 arModule('wechat.Base')->isWeixin();
    public function isWeixin()
    {
        return $this->wechat->isWeixin();

    }

    // 绑定用户 arModule('wechat.Base')->bindUser($uid = '', $userInfo);
    public function bindUser($uid = '', $userInfo)
    {
        $openid = $userInfo['openid'];
        $condition = array(
            'openid' => $openid
        );
        $weUser = \UserWechatModel::model()->getDb()
            ->where($condition)
            ->queryRow();

        $user = array(
            'nickname' => $userInfo['nickname'],
            'photo' => $userInfo['headimgurl'],
            'sex' => $userInfo['sex'],
        );
        if ($weUser) :
            if ($uid = $weUser['uid']) :
                \U_usersModel::model()->getDb()
                    ->where(array('id' => $uid))
                    ->update($user, true);
            endif;
            $userInfo['updatetime'] = time();
            // 更新用户微信表
            \UserWechatModel::model()->getDb()->where($condition)->update($userInfo, true);
        else :
            $uid = \U_usersModel::model()->getDb()->insert($user, true);
            $userInfo['uid'] = $uid;
            $userInfo['bindtime'] = $userInfo['updatetime'] = time();
            // 写入用户微信表
            \UserWechatModel::model()->getDb()->insert($userInfo, true);
        endif;
        return $uid;

    }

    // 微信登录地址 arModule('wechat.Base')->loginUrl();
    public function loginUrl()
    {
        return arU('/wechat/Linker/loginToWeixin', array(), 'FULL');

    }

}
