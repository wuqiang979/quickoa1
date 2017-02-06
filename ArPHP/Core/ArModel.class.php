<?php
/**
 * ArPHP A Strong Performence PHP FrameWork ! You Should Have.
 *
 * PHP version 5
 *
 * @category PHP
 * @package  Core.base
 * @author   yc <ycassnr@gmail.com>
 * @license  http://www.arphp.org/licence MIT Licence
 * @version  GIT: 1: coding-standard-tutorial.xml,v 1.0 2014-5-01 18:16:25 cweiske Exp $
 * @link     http://www.arphp.org
 */

/**
 * model
 *
 * default hash comment :
 *
 * <code>
 *  # This is a hash comment, which is prohibited.
 *  $hello = 'hello';
 * </code>
 *
 * @category ArPHP
 * @package  Core.base
 * @author   yc <ycassnr@gmail.com>
 * @license  http://www.arphp.org/licence MIT Licence
 * @version  Release: @package_version@
 * @link     http://www.arphp.org
 */
class ArModel
{
    // current Model handle
    public $nowModel = '';

    // table of database
    public $tableName = '';

    // container of model
    private static $_models = array();

    /**
     * model prototype.
     *
     * @param string $class which model handle.
     *
     * @return Object
     */
    static public function model($class = __CLASS__)
    {
        $key = strtolower($class);

        if (!isset(self::$_models[$key])) :
            if (AR_DEBUG && !AR_AS_CMD) :
                arComp('ext.out')->deBug('|MODEL_INIT:' . $class . '|');
            endif;

            // not instance model
            if (strlen($class) <= 5 || substr($class, '-5') !== 'Model') :
                $obj = new self;
                $obj->tableName = strtolower($class);
            else :
                $obj = new $class;
            endif;

            $obj->nowModel = $class;

            if (AR_DEBUG && !AR_AS_CMD) :
                arComp('ext.out')->deBug('|MODEL_START:' . $class . '|');
            endif;

            self::$_models[$key] = $obj;
        else :
            if (AR_DEBUG && !AR_AS_CMD) :
                arComp('ext.out')->deBug('|MODEL_RESTART:' . $class . '|');
            endif;
        endif;

        return self::$_models[$key];

    }

    /**
     * upload for detail model.
     *
     * @param string $field description.
     * @param string $type  upload type.
     *
     * @return mixed
     */
    public function upload($field, $type = 'img')
    {
        $upFile = arComp('ext.upload')->upload($field, '', $type);

        if (!$upFile) :
            arComp('list.log')->set($this->nowModel, arComp('ext.upload')->errorMsg());
            return false;
        else :
            return $upFile;
        endif;

    }

    /**
     * db connection.
     *
     * @param string $dbType Db Driver Type
     *
     * @return Object
     */
    public function getDb($dbType = 'mysql', $dbString = 'default', $read = true)
    {
        if ($read) :
            return ArComp('db.' . $dbType)->table($this->tableName)->read($dbString)->setSource($this->nowModel);
        else :
            return ArComp('db.' . $dbType)->table($this->tableName)->write($dbString)->setSource($this->nowModel);
        endif;

    }

    /**
     * filter rules.
     *
     * @return array
     */
    public function rules()
    {
        return array();

    }

    /**
     * check value when update.
     *
     * @param array $data data.
     *
     * @return boolean
     */
    public function updateCheck(array $data = array())
    {
        $rules = $this->rules();

        foreach ($rules as $key => $rule) :
            if (empty($rules[2]) || $rules[2] != 'update' ) :
                unset($rules[$key]);
            endif;
        endforeach;

        return $this->insertCheck($data, $rules);

    }

    /**
     * insert check.
     *
     * @param array $data  insert data.
     * @param array $rules check rules.
     *
     * @return boolean
     */
    public function insertCheck(array $data = array(), array $rules = array())
    {
        $rules = empty($rules) ? $this->rules() : $rules;

        $r = arComp('validator.validator')->checkDataByRules($data, $rules);

        if (empty($r)) :
            return true;
        endif;

        $errorMsg = '';

        foreach ($r as $errorR) :
            $errorMsg .= $errorR[1] . "\n";
        endforeach;

        arComp('list.log')->set($this->nowModel, $errorMsg);

        return false;

    }

    /**
     * generate insert data.
     *
     * @param mixed $data data after format.
     *
     * @return array
     */
    public function formatData($data)
    {
        return $data;

    }

}

