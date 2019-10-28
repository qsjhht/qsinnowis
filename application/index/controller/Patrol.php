<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/29
 * Time: 9:43
 */
namespace app\index\controller;

use think\Controller;
use think\Db;
use Config;
use app\index\model\Patrol as PatrolModel;
use app\common\controller\Adminbase;

class Patrol extends Adminbase
{

    protected function initialize()
    {
        parent::initialize();
        $this->Patrol = new PatrolModel;
    }
    public function index()
    {
        //根据当前控制器名 ->auth_id  ->子类
        $auth_id = Db('auth')->where('auth_c',$this->request->controller())->where('auth_pid','0')->field('auth_id')->find();
        $sub = Db('auth')->where('auth_pid',$auth_id['auth_id'])->order('auth_id','esc')->select();
        $defaultUrl = ($sub['0']['auth_isLink']) ? $sub['0']['auth_url'] : $sub['0']['auth_c'].'/'.$sub['0']['auth_a'];
        $is_http = ($sub['0']['auth_isLink']) ? 1 : 0;
        $this->assign('Sub',$sub);
        $this->assign('defaultUrl',$defaultUrl);
        $this->assign('is_http',$is_http);
        return $this->fetch();
    }
    public function live()
    {
        return $this->fetch();
    }
    public function bim()
    {
        return $this->fetch();
    }
    public function realtime()
    {
        $sites_data = json_encode($this->Patrol->getSites());
        //dump($sites_data);

        $config['realtime_IP'] = Config::get('config.realtime_IP');
        $this->assign('Sitesdata', $sites_data);
        $this->assign('Config', $config);
        return $this->fetch();
    }
    public function sitesdata()
    {
        header('Content-Type:application/json');
        $data =  json_encode($this->Patrol->getSites());


        $user_data[] = '{"id":1,"pid":0,"title":"1-1"},{"id":2,"pid":0,"title":"1-2"},{"id":3,"pid":0,"title":"1-3"},{"id":4,"pid":1,"title":"1-1-1"},{"id":5,"pid":1,"title":"1-1-2"},{"id":6,"pid":2,"title":"1-2-1"},{"id":7,"pid":2,"title":"1-2-3"},{"id":8,"pid":3,"title":"1-3-1"},{"id":9,"pid":3,"title":"1-3-2"},{"id":10,"pid":4,"title":"1-1-1-1"},{"id":11,"pid":4,"title":"1-1-1-2"}';
        $user_data = json_encode($user_data);
        return $user_data;
    }
    public function json()
    {
        $json = array('name'=>array("iso","english","china","ufo","seo"),'data'=>array(400,200,300,100,11));
        $json = json_encode($json);
        return $json;
    }
}