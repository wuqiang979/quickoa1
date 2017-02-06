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
class U_item_track_logModel extends ArModel
{

    static public function model($class = __CLASS__)
    {
        return parent::model($class);

    }

    // 表名
    public $tableName = 'u_item_track_log';

    //分配任务日志
    public function releaseTaskLog($post)
    {
    	$data = array(
    		'tid' => $post['tid'],
    		'content' => $post['content'],
    		'opuid' => $post['opuid']
    		);

    	$result = U_item_track_logModel::model()->getDb()
    		->insert($data);

    	return $result;
    }

}