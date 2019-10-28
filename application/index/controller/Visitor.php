<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/25
 * Time: 11:00
 */

namespace app\index\controller;

use think\Db;
use app\common\controller\Adminbase;

class Visitor extends Adminbase
{
    public function index()
    {
        return $this->fetch();
    }
}