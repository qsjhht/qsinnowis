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

class Attendance extends Adminbase
{
    public function index()
    {
        //根据当前控制器名 ->auth_id  ->子类
        $auth_id = Db('auth')->where('auth_c',$this->request->controller())->where('auth_pid','0')->field('auth_id')->find();
        $sub = Db('auth')->where('auth_pid',$auth_id['auth_id'])->select();
        $defaultUrl = ($sub['0']['auth_isLink']) ? $sub['0']['auth_url'] : $sub['0']['auth_c'].'/'.$sub['0']['auth_a'];
        $is_http = ($sub['0']['auth_isLink']) ? 1 : 0;
        $this->assign('Sub',$sub);
        $this->assign('defaultUrl',$defaultUrl);
        $this->assign('is_http',$is_http);
        return $this->fetch('index',[],['__PUBLIC__'=>'/public/']);
    }

//    排班管理
    public function set()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 1);
            $field = "p.p_id,p.p_name,p.date_range,p.time_range,d.d_name,p.producer";
            $join  = [['duty_room d', 'p.duty_id = d.d_id', 'LEFT']];
            $res   = db('work_plan')->alias('p')->field($field)->order('p.p_id', 'desc')->join($join)->page($page, $limit)->select();
            $total = db('visitor')->count();
            $result = array("code" => 0,"msg" => '', "count" => $total, "data" => $res);
            return json($result);
        }
        /*$depts = $this->UserModel->get_Tree($depts);
        //dump($depts);die;
        $this->assign('depts',$depts);*/
        return $this->fetch();
    }

//    新增排班
    public function set_add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();

            $data['user_ids'] = '';
            $data['producer'] = $this->_userinfo['username'];
            foreach ($data['user'] as $id=>$d) {
                $data['user_ids'] .= $id .',';
            }
            $res = Db('work_plan')
                ->strict(false)
                ->insert($data);
            if ($res){
                $this->success('新增排班计划成功！');
            }$this->error('新增排班计划失败！');
        }else{
            $user = Db('user')->field('user_id,user_name')->select();
            $this->assign('User',$user);
            $duty = Db('duty_room')->field('d_id,d_name')->select();
            $this->assign('Duty',$duty);
            return $this->fetch();
        }
    }

//    排版详情
    public function set_details()
    {
        $p_id = $this->request->param('p_id');
        $join  = [['duty_room d', 'p.duty_id = d.d_id', 'LEFT']];
        $res   = db('work_plan')->alias('p')->join($join)->where('p_id',$p_id)->find();
        $users = trim($res['user_ids'],',');
        $userarr = explode(',',$users);

        foreach ($userarr as $item) {
            $user =  db('user')->where('user_id',$item)->field('user_name')->find();
            $res['user'][] = $user['user_name'];
        }

        $this->assign('Info',$res);

        $duty = Db('duty_room')->field('d_id,d_name')->select();
        $this->assign('Duty',$duty);
        return $this->fetch();
    }

    public function set_edit()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();

            $data['user_ids'] = '';
            $data['producer'] = $this->_userinfo['username'];
            foreach ($data['user'] as $id=>$d) {
                $data['user_ids'] .= $id .',';
            }
            $res = Db('work_plan')
                ->where('p_id',$data['p_id'])
                ->strict(false)
                ->update($data);
            if ($res){
                $this->success('修改排班信息成功！');
            }$this->error('修改排班信息失败！');
        }else{
            $p_id = $this->request->param('p_id');
            $join  = [['duty_room d', 'p.duty_id = d.d_id', 'LEFT']];
            $res   = db('work_plan')->alias('p')->join($join)->where('p_id',$p_id)->find();
            $users = trim($res['user_ids'],',');
            $userarr = explode(',',$users);

            foreach ($userarr as $item) {
                $user =  db('user')->where('user_id',$item)->field('user_name')->find();
                $res['user'][] = $user['user_name'];
            }

            $this->assign('Info',$res);
            $user = Db('user')->field('user_id,user_name')->select();

            $this->assign('User',$user);
            $duty = Db('duty_room')->field('d_id,d_name')->select();

            $this->assign('Duty',$duty);
            return $this->fetch();
        }
    }

//排班计划删除
    public function set_del()
    {
        $p_id = $this->request->param('p_id');
        if (empty($p_id)) {
            $this->error('ID错误');
        }
        if(Db('work_plan')->delete($p_id)){
            $this->success('删除排班信息成功！');
        }$this->error('删除排班信息失败！');
    }


//    值班考勤
    public function check()
    {
        //$this->_userinfo['username'];$this->_userinfo['userid']
        $d = date('Y-m-d',time());
        $d2 = date('Y-m-d',strtotime('+1 day'));

        $this->assign('Uid',$this->_userinfo['userid']);
        $m_d_l = strtotime($d. '09:00:00');

        $n_s_l = strtotime($d. '17:00:00');
        $check = db('attendance')
            ->whereOr('m_time', '> time', $d)
            ->whereOr('n_time', '> time', $d)
            ->where('u_id',$this->_userinfo['userid'])
            ->find();
        if($check){
            if($check['m_time']){
                $check['m_time'] = date('Y-m-d H:i:s',$check['m_time']);
                $check['m_c'] = false;
            }else{
                $check['m_time'] = '未登记';
                if(time() > $m_d_l){
                    $check['m_c'] = false;
                }else{
                    $check['m_c'] = true;
                }
            }
            if($check['n_time']){
                $check['n_time'] = date('Y-m-d H:i:s',$check['n_time']);
                $check['n_c'] = false;
            }else{
                $check['n_time'] = '未登记';
                if(time() > $n_s_l){
                    $check['n_c'] = true;
                }else{
                    $check['n_c'] = false;
                }
            }
        }else{
            $check['m_time'] = '未登记';
            $check['n_time'] = '未登记';
            if(time() < $m_d_l){
                $check['m_c'] = true;
            }else{
                $check['m_c'] = false;
            }

            if(time() > $n_s_l){
                $check['n_c'] = true;
            }else{
                $check['n_c'] = false;
            }

        }
        $this->assign('Info',$check);
        return $this->fetch();
    }

    //签到
    public function sign()
    {
        $d = date('Y-m-d',time());
        $data['u_id'] = $this->_userinfo['userid'];
        $att = db('attendance')
            ->whereOr('m_time', '> time', $d)
            ->whereOr('n_time', '> time', $d)
            ->where('u_id',$this->_userinfo['userid'])
            ->find();
        $checks = $this->request->param('check');
        if (empty($checks)) {
            $this->error('数据错误！');
        }
        if($checks == 'm_check'){
            $data['m_time'] = time();
            $res = db('attendance')
                ->strict(false)
                ->insert($data);
            if ($res){
                $this->success('上班登记成功！');
            }$this->error('上班登记失败！');
        }elseif ($checks == 'n_check'){
            $data['n_time'] = time();
            if($att){
                $res = Db('attendance')
                    ->where('a_id',$att['a_id'])
                    ->strict(false)
                    ->update($data);
            }else{
                $res = db('attendance')
                    ->strict(false)
                    ->insert($data);
            }
            if ($res){
                $this->success('下班签退成功！');
            }$this->error('下班签退失败！');
        }
    }

    //    值班异常记录
    public function abnorma()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 1);
            $field = "a.ab_time,ab_remark,u.user_name,a.registrant";
            $join  = [['user u', 'a.user_id = u.user_id', 'LEFT']];
            $res   = db('abnorma')->alias('a')->field($field)->order('a.ab_id', 'desc')->join($join)->page($page, $limit)->select();
            foreach ($res as &$re) {
                $re['ab_time'] = date('Y-m-d H:i:s',$re['ab_time']);
            }
            $total = db('abnorma')->count();
            $result = array("code" => 0,"msg" => '', "count" => $total, "data" => $res);
            return json($result);
        }
        /*$depts = $this->UserModel->get_Tree($depts);
        //dump($depts);die;
        $this->assign('depts',$depts);*/
        return $this->fetch();
    }

    public function abnorma_add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['registrant'] = $this->_userinfo['username'];
            $data['ab_time'] = strtotime($data['ab_time']);
            $res = Db('abnorma')
                ->strict(false)
                ->insert($data);
            if ($res){
                $this->success('新增异常记录成功！');
            }$this->error('新增异常记录失败！');
        }else{
            $user = Db('user')->field('user_id,user_name')->select();
            $this->assign('User',$user);
            return $this->fetch();
        }
    }

//    值班日志
    public function log()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 1);

            $res   = db('log')->order('l_id', 'desc')->page($page, $limit)->select();
            foreach ($res as &$re) {
                $re['ab_time'] = date('Y-m-d H:i:s',$re['ab_time']);

                $users = trim($re['user_ids'],',');
                $userarr = explode(',',$users);

                $startone = db('user')->where('user_id',$startarr['1'])->field('site_name')->find();

            }
            $total = db('abnorma')->count();
            $result = array("code" => 0,"msg" => '', "count" => $total, "data" => $res);
            return json($result);
        }
        /*$depts = $this->UserModel->get_Tree($depts);
        //dump($depts);die;
        $this->assign('depts',$depts);*/
        return $this->fetch();
    }

//    新增日志
    public function log_add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['registrant'] = $this->_userinfo['username'];
            $data['ab_time'] = strtotime($data['ab_time']);
            $res = Db('abnorma')
                ->strict(false)
                ->insert($data);
            if ($res){
                $this->success('新增异常记录成功！');
            }$this->error('新增异常记录失败！');
        }else{
            $user = Db('user')->field('user_id,user_name')->select();
            $this->assign('User',$user);
            $duty = Db('duty_room')->field('d_id,d_name')->select();
            $this->assign('Duty',$duty);
            return $this->fetch();
        }
    }

}