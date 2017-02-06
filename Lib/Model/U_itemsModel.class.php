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
class U_itemsModel extends ArModel
{

    static public function model($class = __CLASS__)
    {
        return parent::model($class);

    }

    // 表名
    public $tableName = 'u_items';

    // 项目审核状态
    static $TYPE = array(
        0 => '未审核',
        1 => '已审核',
    );

    // 展示项目列表
    public function showList()
    {
        $items = U_itemsModel::model()->getDb()
        // ->where(array('u_id ' => $uid))
            ->queryAll();
        return $items;

    }

    // 查询项目详情
    public function getInfo($itemid)
    {
        $result = U_itemsModel::model()->getDb()
            ->select('id,i_name,img,audit,publisher,money,contractDate,money,releaseDate,requirement,days')
            ->where(array('id' => $itemid))
            ->queryRow();

        // 查询项目发布人
        $result['publisher'] = U_usersModel::model()->getPublisher($result['publisher']);

        //项目二维码图片
        if ($result['img']) {
            $result['img'] = arCfg('UPLOAD_FILE_SERVER_PATH') . $result['img'];
        } else {
            $result['img'] = arCfg('DEFAULT_USER_LOG');
        }

        // 项目审核状态
        $result['audit'] = self::$TYPE[$result['audit']];

        return $result;

    }

    //查看所有项目
    public function getItem()
    {
        //数据分页
        $count = U_itemsModel::model()->getDb()
            ->count();
        $page = new Page($count, 10);

        $results = U_itemsModel::model()->getDb()
            ->select('id,i_name,users,img,audit')
            ->limit($page->limit())
            ->queryAll();

        foreach ($results as $key => $value) {
            $result[$key]['id']     = $value['id'];
            $result[$key]['i_name'] = $value['i_name'];
            $result[$key]['users']  = $value['users'];
            $result[$key]['img']    = $value['img'];
            $result[$key]['audit']  = $value['audit'];

            // 参与项目人数
            if ($result[$key]['users']) {
                $users                    = explode(',', $result[$key]['users']);
                $result[$key]['usersNum'] = count($users);
            } else {
                $result[$key]['usersNum'] = 0;
            }

            // 二维码图片
            if ($result[$key]['img']) {
                $result[$key]['img'] = arCfg('UPLOAD_FILE_SERVER_PATH') . $result[$key]['img'];
            } else {
                $result[$key]['img'] = arCfg('DEFAULT_USER_LOG');
            }

            // 项目审核状态
            $result[$key]['audit'] = self::$TYPE[$result[$key]['audit']];
        }
        $totalcount = ceil($count / 10);
        $data       = array('result' => $result, 'count' => $totalcount);
        return $data;

    }

    //根据项目id查询项目成员
    public function getUsers($post)
    {
        $users = U_itemsModel::model()->getDb()
            ->select('users')
            ->where(array('id' => $post['id']))
            ->queryRow();

        $usersId  = explode(',', $users['users']);
        $userInfo = U_usersModel::model()->getUserInfo($usersId);

        return $userInfo;

    }

    //判断项目是否有仓库
    public function checkGit($post)
    {
        $result = U_itemsModel::model()->getDb()
            ->select('git')
            ->where(array('id' => $post['i_id']))
            ->queryRow();

        return $result;
    }

    //
    // public function info($post)
    // {
    //     $result = U_itemsModel::model()->getDb()
    //         ->select('id,i_name,money,releaseDate')
    //         ->where(array('id' => $post['id']))
    //         ->queryRow();
    //     return $result;
    // }

}
