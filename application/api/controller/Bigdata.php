<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/21
 * Time: 15:03
 */

namespace app\api\controller;
use think\Controller;
use think\Db;

class Bigdata extends Common
{
    protected function initialize()
    {
        parent::initialize();
    }
    public function date()
    {


     $this->start_date = Db('st_d_time')->limit(1)->field('start_time')->find();
    //         $start_time = strtotime();
     //$this->date_start = new \DateTime($this->start_date['start_time']);
     //$days = $this->start_date['start_time']->diff($this->new_date)->days;
     $days = floor(abs((time() - $this->start_date['start_time']) / 86400));
     $num=str_pad($days,4,"0",STR_PAD_LEFT);

    $range = db('work_plan')->field('time_range')->select();
    foreach ($range as $ra) {
        $j = date("H:i:s");

        $h = strtotime($j);

        $time = explode(' - ', $ra['time_range']);


        $z = strtotime($time['0']);//获得指定分钟时间戳，00:00
        if($time['1'] == '00:00:00'){
            $time['1'] = '24:00:00';
        }
        $x = strtotime($time['1']);//获得指定分钟时间戳，00:29

        if ($h > $z && $h < $x) {
            $arr['per'] = round((time() - $z)/($x - $z)*100,2)."%";
            $arr['stime'] = date('H:i',$z);
            $arr['etime'] = date('H:i',$x);
        }
    }


     $arr['units'] = substr($num,0,1);
     $arr['tens'] = substr($num,1,1);
     $arr['hundreds'] = substr($num,2,1);
     $arr['thousands'] = substr($num,3,1);
     $txt =  json_encode($arr,JSON_UNESCAPED_UNICODE);
     echo $txt;
    }

}