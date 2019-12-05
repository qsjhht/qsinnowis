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
use app\index\model\Visuals as Visual_Model;
use app\common\controller\Adminbase;

class Visual extends Adminbase
{
    public function index()
    {
        $res   = db('patrol_log')->order('log_date', 'desc')->field('log_date,p_time,user_ids,str_name')->limit('10')->select();
        if($res){
            foreach ($res as &$re) {
                $re['user_names'] = '';
                $userstr = trim($re['user_ids'],',');
                $userarr = explode(',',$userstr);
                $users = db('admin')->field('nickname')->where('userid','in',$userarr)->select();
                foreach ($users as $vo) {
                    $re['user_names'] .= $vo['nickname'].',';
                }
                $re['user_names'] = trim($re['user_names'],',');
                $re['date_time'] = $re['log_date'] .' '. $re['p_time'];
            }
            $this->assign('Patrols', $res);
        }else{
            $this->assign('Patrols', '');
        }
        $this->assign('Onpatrol', '');

        $alarms = db('alarmrecs')
            ->alias('a')
            ->join('alarmlvl l','a.alarmlevel = l.level','LEFT')
            ->join('categorys c','a.cate_code = c.id','LEFT')
            ->field('a.id,a.alarm_time,c.cate_name,a.zone,l.lvlcontent')
            ->limit(10)
            ->order('alarm_time desc,id desc')
            ->select();
        $this->assign('Alarms', $alarms);
            $this->assign('Uname', $this->_userinfo['nickname']);
            return $this->fetch();
    }

    public function map()
    {
        return $this->fetch();
    }
    public function bim()
    {
        return $this->fetch();
    }
    public function demo()
    {
        return $this->fetch();
    }
    public function demoOne()
    {
        $this->assign('Uname', $this->_userinfo['nickname']);
        $alarms = db('alarmrecs')
            ->alias('a')
            ->join('alarmlvl l','a.alarmlevel = l.level','LEFT')
            ->join('categorys c','a.cate_code = c.id','LEFT')
            ->field('a.id,a.alarm_time,c.cate_name,a.eqpt_site,l.lvlcontent')
            ->limit(10)
            ->order('alarm_time desc,id desc')
            ->select();
        $this->assign('Alarms', $alarms);
        return $this->fetch();
    }
    public function demoTwo()
    {
        return $this->fetch();
    }
    public function demoThree()
    {
        $res   = db('patrol_log')->order('log_date', 'desc')->field('log_date,p_time,user_ids,str_name')->limit('10')->select();
        if($res){
            foreach ($res as &$re) {
                $re['user_names'] = '';
                $userstr = trim($re['user_ids'],',');
                $userarr = explode(',',$userstr);
                $users = db('admin')->field('nickname')->where('userid','in',$userarr)->select();
                foreach ($users as $vo) {
                    $re['user_names'] .= $vo['nickname'].',';
                }
                $re['user_names'] = trim($re['user_names'],',');
                $re['date_time'] = $re['log_date'] .' '. $re['p_time'];
            }
            $this->assign('Patrols', $res);
        }else{
            $this->assign('Patrols', '');
        }
        $this->assign('Onpatrol', '');
        return $this->fetch();
    }
}