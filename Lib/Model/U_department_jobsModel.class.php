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
class U_department_jobsModel extends ArModel
{

    static public function model($class = __CLASS__)
    {
        return parent::model($class);

    }

    // 表名
    public $tableName = 'u_department_jobs';

    // 获取详细信息
    public function getDetailInfo(array $bundles)
    {
        // 递归遍历所有产品信息
        if (arComp('validator.validator')->checkMutiArray($bundles)) :
            foreach ($bundles as &$bundle) :
                $bundle = $this->getDetailInfo($bundle);
            endforeach;
        else :
            $bundle = $bundles;
            /**
             * to do
             */

            // 查询权限
            $bundle['lids'] = JobAuthorityModel::model()
                ->getDb()
                ->where(array('jid' => $bundle['jid']))
                ->queryColumn('lids');

             // 权限id
            if ($bundle['lids']) :
                $lids = explode(',', $bundle['lids']);
                // 返回键值为action二维数组
                $auths = AuthListModel::model()->getDb()->where(array('lid' => $lids))->queryAll('action');
            else :
                $auths = array();
            endif;
            $bundle['auths'] = $auths;
            return $bundle;
        endif;

        return $bundles;

    }


}