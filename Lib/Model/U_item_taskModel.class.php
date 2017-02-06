<?php
/**
 * Powerd by ArPHP.
 *
 * Model.
 *
 * @author ycassnr <ycassnr@gmail.com>
 */

/**
 * Default Model of webapp.
 */
class U_item_taskModel extends ArModel
{

    static public function model($class = __CLASS__)
    {
        return parent::model($class);

    }

    // 表名
    public $tableName = 'u_item_task';

    // 项目审核状态转换
    static $TYPE = array(
        0 => '未审核',
        1 => '已审核',
    );

    // 查询当前登录用户的所有项目
    function listItem($uid)
    {
        $items = U_item_taskModel::model()->getDb()
            ->select('i_id')
            ->where(array('u_id' => $uid))
            ->queryAll();

        foreach ($items as $key => $value) {
            $iteminfo[$key] = U_itemsModel::model()->getDb()
                ->select('id,i_name,online,img,users,audit')
                ->where(array('id' => $value['i_id']))
                ->queryRow();

            // 参与项目的人数
            if ($iteminfo[$key]['users']) {
                $users                      = explode(',', $iteminfo[$key]['users']);
                $iteminfo[$key]['usersNum'] = count($users);
            } else {
                $iteminfo[$key]['usersNum'] = 0;
            }

            // 二维码图片
            if ($iteminfo[$key]['img']) {
                $iteminfo[$key]['img'] = arCfg('UPLOAD_FILE_SERVER_PATH') . $iteminfo[$key]['img'];
            } else {
                $iteminfo[$key]['img'] = arCfg('DEFAULT_USER_LOG');
            }


            // 项目审核状态
            $iteminfo[$key]['audit'] = self::$TYPE[$iteminfo[$key]['audit']];
        }

        return $iteminfo;

    }

    // 添加项目成员
    function addUser($post)
    {
        $data = array(
            'i_id' => $post['i_id'],
            'u_id' => $post['u_id'],

        );
        $add = U_item_taskModel::model()->getDb()
            ->insert($data);

        //查询项目名称
        $itemInfo = U_itemsModel::model()->getInfo($post['i_id']);
        $itemName = $itemInfo['i_name'];

        arModule('Lib.Msg')->sendSystemMsg($post['u_id'], '你已经加入项目'.$itemName);
        return $add;

    }

    // 删除项目成员
    function delUser($post)
    {
        $data = array(
            'i_id' => $post['i_id'],
            'u_id' => $post['u_id'],
        );

        $del = U_item_taskModel::model()->getDb()
            ->where($data)
            ->update(array('stay' => 0));

        //查询项目名称
        $itemInfo = U_itemsModel::model()->getInfo($post['i_id']);
        $itemName = $itemInfo['i_name'];

        arModule('Lib.Msg')->sendSystemMsg($post['u_id'], '你已经退出项目'.$itemName);

        return $del;
    }

    // 项目成员主动退出项目
    function quit($post)
    {
        $data = array(
            'i_id' => $post['i_id'],
            'u_id' => $post['u_id'],
        );

        $quit = U_item_taskModel::model()->getDb()
            ->where($data)
            ->update(array('stay' => -1));

        //查询项目名称
        $itemInfo = U_itemsModel::model()->getInfo($post['i_id']);
        $itemName = $itemInfo['i_name'];

        arModule('Lib.Msg')->sendSystemMsg($post['u_id'], '你已经退出项目'.$itemName);

        return $quit;

    }

    //判断用户是否是项目成员
    public function judge($post)
    {
        $where = array(
            'i_id' =>$post['i_id'],
            'u_id' =>$post['u_id']
            );

        $judgeResult = U_item_taskModel::model()->getDb()
            ->where($where)
            ->count();

        return $judgeResult;
    }

}
