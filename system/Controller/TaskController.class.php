<?php

/**
 * Created by PhpStorm.
 * User: LW
 * Date: 2017/1/5
 */
class TaskController extends ArController
{
    // 初始化方法
    public function init()
    {
        // 调用layer msg cart插件
        arSeg(array(
            'loader' => array(
                'plugin' => '',
                'this'   => $this,
            ),
        )
        );

    }

    //后台任务列表
    public function showListAction()
    {
        // 关键字搜索任务
        $keyword = arGet('keyword');

        // 搜索条件
        $condition = array('tname like ' => '%' . $keyword . '%');

        $result = U_item_trackModel::model()->listTask($condition);
        $this->assign(array('title' => '仓库列表'));
        $this->assign(array('keyword' => $keyword));
        $this->assign(array('tasks' => $result['task']));
        $this->assign(array('totalCount' => $result['totalCount']));
        $this->assign(array('pageHtml' => $result['pageHtml']));       
        $this->display();

    }

    // 发布任务
    public function releaseTaskAction()
    {
        $post = arRequest();
         
        if (!isset($post['taskId'])) {
            // $result = U_item_trackModel::model()->taskInfo($post);
            $this->assign(array('taskId' => $post['iid']));
            $this->assign(array('title' => '修改任务信息'));

            $this->display();
        } else {
            $result = U_item_trackModel::model()->releaseTask($post);

            if ($result) {
                $this->showJson(array('ret_msg' => '操作成功！', 'ret_code' => '1000', 'success' => "1", 'url' => arU('Product/showList', array('type' => 1))));
            }
        }                    

    }

    // 审核任务(修改任务状态)
    public function checkTaskAction()
    {
        $post = arRequest();
        $result = U_item_trackModel::model()->checkTask($post);
        if ($result) {
             $this->showJson(array('ret_msg' => '操作成功！', 'ret_code' => '1000', 'success' => "1", 'url' => arU('Task/showList', array('type' => 1))));
         } 

    }

    // 修改任务信息
    public function updateTaskAction()
    {
        $post = arRequest();

        if (!isset($post['taskId'])) {
            $result = U_item_trackModel::model()->taskInfo($post);
            $this->assign(array('taskInfo' => $result));
            $this->assign(array('title' => '修改任务信息'));

            $this->display();
        } else {
            $result = U_item_trackModel::model()->updateTask($post);

            if ($result) {
                $this->showJson(array('ret_msg' => '操作成功！', 'ret_code' => '1000', 'success' => "1", 'url' => arU('Task/showList', array('type' => 1))));
            }
        }
    }

    // 删除任务
    public function delTaskAction()
    {
        $tid = arRequest('id');

        // 判断是否批量删除
        if (is_array($tid)) {
            foreach ($tid as $value) {
                $result = U_item_trackModel::model()->delTask($value);
            } 
        } else {
                $result = U_item_trackModel::model()->delTask($tid);
        }
        
        if ($result) {
             $this->showJson(array('ret_msg' => '删除成功！', 'ret_code' => '1000', 'success' => "1", 'url' => arU('Task/showList', array('type' => 1))));
         } 
    }



}