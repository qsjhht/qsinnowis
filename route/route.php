<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 用户注册
Route::post('patrol/data', 'api/patrol/data')->allowCrossDomain();

Route::get('patrol/eqpt_data', 'api/patrol/eqpt_data')->allowCrossDomain();

Route::get('patrol/get_type', 'api/patrol/get_type')->allowCrossDomain();

Route::get('patrol/get_patrol', 'api/patrol/get_patrol')->allowCrossDomain();

Route::get('patrol/get_patrol_json', 'api/patrol/get_patrol_json')->allowCrossDomain();

Route::get('patrol/get_user_position', 'api/patrol/get_user_position')->allowCrossDomain();



Route::get('real/real_time', 'api/real/real_time')->allowCrossDomain();
Route::get('real/real_times', 'api/real/real_times')->allowCrossDomain();
Route::get('real/get_last_real', 'api/real/get_last_real')->allowCrossDomain();