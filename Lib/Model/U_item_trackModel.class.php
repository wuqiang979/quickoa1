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
class U_item_trackModel extends ArModel
{

    static public function model($class = __CLASS__)
    {
        return parent::model($class);

    }

    // 表名
    public $tableName = 'u_item_track';

    //任务状态
    static $TYPE = array(
    	0 => '指派中',
    	1 => '已分配，等待开发',
    	2 => '开发中',
    	3 => '开发完待测试',
    	4 => '测试中',
    	5 => '测试未通过已返回',
    	6 => '测试通过待审核',
    	7 => '审核未通过已返回',
    	8 => '审核通过开发完成 待发布',
    	9 => '已发布完成'
    	);

    //发布任务
    public function releaseTask($post)
    {
    	$data = array(
    		'tname' => $post['tname'],
    		'iid' => $post['taskId'],
    		'content' => $post['content']
    		);

    	$result = U_item_trackModel::model()->getDb()
    		->insert($data);

    	return $result;
    }

    //任务列表
    public function listTask($condition=array())
    {
        // 数据总的条数
        $totalCount = U_item_trackModel::model()->getDb()
            ->count();
        // 查询数据并分页
        $page = new Page($totalCount, 2);

        $task = U_item_trackModel::model()->getDb()
            ->limit($page->limit())
            ->where($condition)
            ->queryAll();
        $pageHtml = $page->show();
            // 根据用户id查询用户名称
            // foreach ($task as $key => $value) {
            //     $task[$key]['uid'] = $value['uid'];
            //     $task[$key]['publisher'] = U_usersModel::model()->getPublisher($task[$key]['uid']);
            // }
        return array('task'=>$task, 'totalCount' => $totalCount, 'pageHtml' => $pageHtml);
    
    }

    //任务详情
    public function taskInfo($post)
    {
    	$result = U_item_trackModel::model()->getDb()
    		->where(array('tid' => $post['tid']))
    		->queryRow();
    	$result['status'] = self::$TYPE[$result['status']];

    	return $result;
    }

    //审核任务
    public function checkTask($post)
    {
        $result = U_item_trackModel::model()->getDb()
            ->where(array('tid' => $post['tid']))
            ->update(array('status' => $post['status']));

        return $result;
    }

    //删除任务
    public function delTask($tid)
    {
        $result = U_item_trackModel::model()->getDb()
            ->where(array('tid' => $tid))
            ->delete();

        return $result;
    }

    //修改任务信息
    public function updateTask($post)
    {
        $data = array(
            'tname' => $post['tname'],
            'content' => $post['content']
            );

        $result = U_item_trackModel::model()->getDb()
            ->where(array('tid' => $post['taskId']))
            ->update($data);

        return $result;
    }

}