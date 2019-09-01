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

class Visual extends Controller
{
    public function index()
    {
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

        // 指明给谁推送，为空表示向所有在线用户推送
        $to_uid = "";
        // 推送的url地址，使用自己的服务器地址
        $push_api_url = "http://127.0.0.1:2121/";
        $post_data = array(
            "type" => "publish",
            "content" => "这个是推送的测试数据",
            "to" => $to_uid,
        );
        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $push_api_url );
        curl_setopt ( $ch, CURLOPT_POST, 1 );
        curl_setopt ( $ch, CURLOPT_HEADER, 0 );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, $post_data );
        curl_setopt ($ch, CURLOPT_HTTPHEADER, array("Expect:"));
        $return = curl_exec ( $ch );
        curl_close ( $ch );
        var_export($return);

    }
}