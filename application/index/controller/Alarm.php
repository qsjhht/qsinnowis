<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/24
 * Time: 18:54
 */

namespace app\index\controller;

use think\Controller;
use think\Db;
use app\common\controller\Adminbase;


class Alarm extends Adminbase
{
    protected function initialize()
    {
        parent::initialize();
    }
    //设备管理首页 模版继承 注入左侧导航
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

//    报警日志
    public function log()
    {
        /*$datas = Db('alarmlog')->order(array( 'id' => 'ESC'))->select();
            //dump($resultcate);
        return $this->fetch();*/
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 1);
            $datas = Db('alarmlog')->order(array( 'id' => 'ESC'))->page($page, $limit)->select();

            $total = Db('alarmlog')->order(array( 'id' => 'ESC'))->count();
            $result = array("code" => 0,"msg" => '', "count" => $total, "data" => $datas);
            return json($result);
        }
        return $this->fetch();
    }

//    报警处置
    public function manage()
    {
        $details = \db('alarmrec')
            ->alias('r')
            ->join('alarmcode c','r.alarmcode = c.code')
            ->join('alarmtype t','r.alarmtype = t.type')
            ->join('alarmlvl l','r.alarmlevel = l.level')
            ->join('alarmmanage m','r.managetype = m.manage_id')
            ->join('eqpts e','r.equipment_code = e.eqpt_id')
            ->field('r.id,r.alarmtime,t.typecontent,r.eqpt_sys,e.eqpt_type,r.alarmcode,c.codecontent,l.lvlcontent,m.manage_type,r.is_manage,e.eqpt_site_detail,r.rec_details')
            ->order('r.id', 'esc')
            ->where('is_manage','0')
            ->select();
        foreach ($details as &$detail) {
            $detail['alarmtime'] = date('Y-m-d H:i:s',$detail['alarmtime']);
            if ($detail['is_manage']){
                $detail['is_manage'] = '已处置';
            }else{
                $detail['is_manage'] = '未处置';
            }
        }
        $this->assign('details',$details);
        return $this->fetch();
    }

//    日志详情
    public function details()
    {
        $log_id = $this->request->param('log_id');
        $rec_ids = \db('alarmlog')->alias('l')->find($log_id);
        $details = \db('alarmrec')
            ->alias('r')
            ->join('alarmcode c','r.alarmcode = c.code')
            ->join('alarmtype t','r.alarmtype = t.type')
            ->join('alarmlvl l','r.alarmlevel = l.level')
            ->join('alarmmanage m','r.managetype = m.manage_id')
            ->join('eqpts e','r.equipment_code = e.eqpt_id')
            ->field('r.alarmtime,t.typecontent,r.eqpt_sys,e.eqpt_type,r.alarmcode,c.codecontent,l.lvlcontent,m.manage_type,r.is_manage,e.eqpt_site_detail,r.rec_details')
            ->order('r.id', 'desc')
            ->where('r.id','in',$rec_ids['alarmrecs'])
            ->select();

        //['alarmtime'] = date('Y-m-d H:i:s',$details['alarmtime']);
        foreach ($details as &$detail) {
            $detail['alarmtime'] = date('Y-m-d H:i:s',$detail['alarmtime']);
            if ($detail['is_manage']){
                $detail['is_manage'] = '已处置';
            }else{
                $detail['is_manage'] = '未处置';
            }
        }
        $this->assign('details',$details);
        return $this->fetch();
    }

//    处理报警类型
    public function alarm_manage(){
        $rec_id = $this->request->param('rec_id');
        $type = $this->request->param('type');
        $details = $this->request->param('details');
        if(!$details){
            $details = '无';
        }
        $res = Db('alarmrec')
            ->where('id', $rec_id)
            ->update([
                'alarmtype' =>  $type,
                'rec_details' =>  $details,
                'is_manage'	=> '1'
            ]);
        if($res){
            $result = array("code" => 1,"msg" => '处理成功！');
        }else{
            $result = array("code" => 0,"msg" => '处理失败！');
        }
        return json($result);
    }
}