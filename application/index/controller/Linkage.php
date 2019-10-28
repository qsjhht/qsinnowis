<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/25
 * Time: 10:50
 */

namespace app\index\controller;

use think\Controller;
use think\Db;
use app\common\controller\Adminbase;
use app\index\model\Linkage as LinkageModel;

class Linkage extends Adminbase
{
    protected function initialize()
    {
        parent::initialize();
        $this->Linkage = new LinkageModel;
    }
    public function index()
    {
        $cates_data = json_encode($this->Linkage->getCates());

        $this->assign('Catesdata', $cates_data);

        return $this->fetch();
    }

//    新增联动
    public function linkage_add()
    {
        $cates_data = json_encode($this->Linkage->getCates());

        $this->assign('Catesdata', $cates_data);
        return $this->fetch();
    }
}