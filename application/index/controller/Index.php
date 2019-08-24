<?php
namespace app\index\controller;
use think\Controller;
use think\Db;

class Index extends Controller
{
    public function index()
    {
        $navi = Db('auth')->where('auth_pid',0)->order('auth_id', 'esc')->select();
        //dump( $navi);die;
        $this->assign('Navi',$navi);
        return $this->fetch();
    }

    public function hello($name = 'ThinkPHP5')
    {
        return 'hello,' . $name;
    }
}
