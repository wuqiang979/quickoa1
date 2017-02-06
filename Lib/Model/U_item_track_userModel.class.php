<?php
/**
 * Powerd by ArPHP.
 *
 * Model.
 *
 * @author LW
 */

/**
 * Default Model of webapp.
 */
class U_item_track_userModel extends ArModel
{

    static public function model($class = __CLASS__)
    {
        return parent::model($class);

    }

    // 表名
    public $tableName = 'u_item_track_user';

    //分配任务
    public function assignTask($post)
    {
    	$data = array(
    		'uid' => $post['uid'],
    		'tid' => $post['tid'],
    		'touid' => $post['touid'],
    		'fromuid' => $post['uid']
    		);

    	$result = U_item_track_userModel::model()->getDb()
    		->insert($data);

    	return $result;
    }

}