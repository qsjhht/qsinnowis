let date = new Date();
let time = {
    year : function(){
        return date.getFullYear()+'年'+(date.getMonth()+1)+'月'+ date.getDate()+'日'
    },
    day: function(){
        return date.getDay()
    },
    dayDate: function(){
        switch(this.day()){
            case 0:return '星期日'
            break;
            case 1:return '星期一'
            break;
            case 2:return '星期二'
            break;
            case 3:return '星期三'
            break;
            case 4:return '星期四'
            break;
            case 5: return '星期五'
            break;
            case 6:return '星期六'
            break;
        }
    },
    crew:function(){
        return '<img src="../../../static/new/image/user-fill.png" width:="20" height="18" style="position:relative;top:2px"/>在岗15人'
    }
};
let infoDate = document.getElementById('infoDate');
let content = time.year()+'&nbsp;&nbsp;'+time.dayDate()+'&nbsp;&nbsp;|&nbsp;&nbsp;'+time.crew();
infoDate.innerHTML = content;
/*// 值班人员设置
let duty = {
    crew:'李勇',
    strip:'<div class="progress">'+
        '<div class="progressFro"></div>'+
            '<div class="progressBack"></div>'+
            '</div>',
    sum:function(){
        return '值班：'+this.crew+'&nbsp;&nbsp;8:30'+this.strip+'18:30'
    }
}
let infoDty = document.getElementById('infoDty');
infoDty.innerHTML = duty.sum();*/

let data = {
    getYear:date.getFullYear(),//年
    getMonth:date.getMonth()+1,//月
    getDate:date.getDate(),//日
    // 当前日期
    timeLcale:function(){
        return this.getYear+'/'+this.getMonth+'/'+this.getDate
    },
    getTime: date.getHours(),//小时
    weeHours: date.getMinutes(),//分钟
    // 遍历次数
    number:function(){
        return (this.getTime*60+this.weeHours)*4
    },
    // 数组
    arr:[],// 水位
    arr10:[],//用电量
    water: function(aaa,bbb) {
        let hour = 0;
        let minu = 0;
        let second = 0;
        let num = 0;
        switch (aaa) {
            case 6 ://水位
                for (var i = 0; i < 5760; i++) {
                    num = parseInt((Math.random() - 0.5) * aaa)+ bbb;
                    hour = Math.floor(i / 240);
                    if (hour < 10) {
                        hour = '0' + hour
                    }
                    minu = Math.floor(i % 240 / 4)
                    if (minu < 10) {
                        minu = '0' + minu
                    }
                    second = i % 4 * 15;
                    if (second == 0) {
                        second = '00'
                    }
                    this.arr.push([this.timeLcale() + ' ' + hour + ':' + minu + ':' + second, num])
                }
                break;
            case 5://用电量
                for (var i = 0; i < 5760; i++) {
                    num += parseInt((Math.random() - 0.45) * aaa);
                    hour = Math.floor(i / 240);
                    if (hour < 10) {
                        hour = '0' + hour
                    }
                    minu = Math.floor(i % 240 / 4)
                    if (minu < 10) {
                        minu = '0' + minu
                    }
                    second = i % 4 * 15;
                    if (second == 0) {
                        second = '00'
                    }
                    this.arr10.push([this.timeLcale() + ' ' + hour + ':' + minu + ':' + second, num + bbb])
                }
                break;
        }
    },
    environ:function(ccc,ddd){
        let num = 0;
        let arr1 = [];
       /* for(var y = 0 ; y<this.getDate; y++){
            num = ((Math.random()-0.5)*ccc+ddd).toFixed(2);
            arr1.push([this.getYear+'/'+this.getMonth+'/'+(y+1),num])
        }*/
    for(var y = 0 ; y < 30 ;y++){
       num = ((Math.random()-0.5)*ccc+ddd).toFixed(2);
       if( [this.getDate - y] > 0 ){
        arr1.push( [this.getYear + '/' + this.getMonth + '/'+[this.getDate-y] ,num])
       }else{
        arr1.push([this.getYear + '/'+[this.getMonth-1] + '/' + [this.getDate- y + 30] , num])
       }
    }
        return arr1.reverse();
    }
};
data.water(6,60);//水位
data.water(5,30);//用电量

// 动力配电
    let contentEle = echarts.init(document.getElementById('contentEle'));
    let eleOption = {
        title:{
            text:'动力配电监测',
            textStyle:{
                color:'#00ffff',
                fontWeight:'normal',
                fontSize:16
            },
            padding:[15,10]
        },
        tooltip: {
            trigger: 'axis'
        },
        xAxis: {
            name:'时间',
            type: 'time',
            axisLine:{
                lineStyle:{
                    color:'#FFFFFF'
                }
            },
            splitLine: {
                show: false
            }
        },
        yAxis: {
            name:'用电量（kw/h）',
            type: 'value',
            boundaryGap: ['20%', '100%'],
            axisLine:{
                lineStyle:{
                    color:'#FFFFFF'
                }
            },
            splitLine: {
                show: false
            },
            inverse:false,
            min:0
        },
        dataZoom:[{
            start:95,
        end:100,
        backgroundColor:'rgb(ff,ff,ff)',
        height:'15',
        bottom:'3%'
        },{
            type:'slider',
        height:'15',
        bottom:'3%'
        }],
        series: [{
            name: '用电量(kw/h)',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data:data.arr10.slice(0,data.number())
        }]
    }
contentEle.setOption(eleOption);

// 报警类型
let callIcon = echarts.init(document.getElementById('callIcon'));
let callOption = {
    title:{
        text:'报警数据',
        textStyle:{
            color:'#00ffff',
            fontWeight:'normal',
            fontSize:16
        },
        padding:[15,10]
    },
    tooltip: {
        trigger: 'axis'
    },
    xAxis:{
        name:'类型',
        type:'category',
        data:['严重','紧急','普通','设备'],
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        }
    },
    yAxis:{
        name:'数量',
        type:'value',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        min:0,
        splitLine: {
            show: false
        }
    },
    series:{
        type:'bar',
        name:'报警数量',
        barWidth:'60%',
        itemStyle:{
            color:'#00FFFF'
        },
        data:[0,0,4,1]
    }
}
callIcon.setOption(callOption);
// 水位监测
let contentFirm = echarts.init(document.getElementById('contentFirm'));
let firmOption = {
    title:{
        text:'水位监测',
        textStyle:{
            color:'#00ffff',
            fontWeight:'normal',
            fontSize:16
        },
        padding:[15,10]
    },
    length:{
        data:['1','2','3']
    },
    xAxis:{
        name:'时间',
        type:'time',
        boundarGap:false,
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        splitLine: {
            show: false
        }
    },
    yAxis:{
        name:'水位（cm）',
        type:'value',
        boundarGap:[0,'100%'],
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        min:0,
        max:100,
        splitLine: {
            show: false
        }

    },
    dataZoom:[{
        start:95,
    end:100,
    backgroundColor:'rgb(ff,ff,ff)',
    height:'15',
    bottom:'3%'
    },{
        type:'slider',
    height:'15',
    bottom:'3%'
    }],
    series:[{
        name:'水位高度',
        type:'line',
        smooth:true,
        itemStyle:{
            color:'#0e628e'
        },
        areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0,
                color: '#1396bc'
            }, {
                offset: 1,
                color: '#0e628e'
            }])
        },
        data:data.arr.slice(0,data.number()),
        markLine:{
            silent:true,
            lineStyle:{
                color:'red',
                width:2
            },
            data:[{
                yAxis:80
            },{
                yAxis:50
            }]
        }
    }]
};
contentFirm.setOption(firmOption);

// -----------------------------环境监测-----------------------------------
// 环境监测
let borCont = echarts.init(document.getElementById('borCont'));
// 温度
let optionTem = {
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        textStyle:{
            color:'#00ffff'
        },
        data:['最高温度','平均温度','最低温度']
    },
    xAxis: {
        name:'时间',
        type: 'time',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        splitLine: {
            show: false
        }
    },
    yAxis: {
        name:'温度（°C）',
        type: 'value',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        min:0,
        splitLine: {
            show: false
        }
    },
    series: [
        {
            name:'最高温度',
            type:'line',
            smooth:true,
            data:data.environ(1,21)

        },
        {
            name:'平均温度',
            type:'line',
            smooth:true,
            data:data.environ(1,19)
        },
        {
            name:'最低温度',
            type:'line',
            smooth:true,
            data:data.environ(1,17)
        }
    ]
};
//湿度
let optionHum = {
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        textStyle:{
            color:'#00ffff'
        },
        data:['最高湿度','平均湿度','最低湿度']
    },
    xAxis: {
        name:'时间',
        type: 'time',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        splitLine: {
            show: false
        }
    },
    yAxis: {
        name:'湿度（%）',
        type: 'value',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        min:0,
        splitLine: {
            show: false
        }
    },
    series: [
        {
            name:'最高湿度',
            type:'line',
            smooth:true,
            data:data.environ(3,73)
        },{
            name:'平均湿度',
            type:'line',
            smooth:true,
            data:data.environ(1,67)
        },{
            name:'最低湿度',
            type:'line',
            smooth:true,
            data:data.environ(1,62)
        }
    ]
};
// 氧气
let optionOxygen = {
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        textStyle:{
            color:'#00ffff'
        },
        data:['最高氧气浓度','平均氧气浓度','最低氧气浓度']
    },
    xAxis: {
        name:'时间',
        type: 'time',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        splitLine: {
            show: false
        }
    },
    yAxis: {
        name:'氧气（%VOL）',
        type: 'value',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        min:0,
        splitLine: {
            show: false
        }
    },
    series: [
        {
            name:'最高氧气浓度',
            type:'line',
            smooth:true,
            data:data.environ(1,23)
        },{
            name:'平均氧气浓度',
            type:'line',
            smooth:true,
            data:data.environ(1,21)
        },{
            name:'最低氧气浓度',
            type:'line',
            smooth:true,
            data:data.environ(1,19)
        }
    ]
};
// 硫化氢
let optionHyd = {
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        textStyle:{
            color:'#00ffff'
        },
        data:['最高硫化氢浓度','平均硫化氢浓度','最低硫化氢浓度']
    },
    xAxis: {
        name:'时间',
        type: 'time',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        splitLine: {
            show: false
        }
    },
    yAxis: {
        name:'硫化氢(ppm)',
        type: 'value',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        min:0,
        splitLine: {
            show: false
        }
    },
    series: [
        {
            name:'最高硫化氢浓度',
            type:'line',
            smooth:true,
            data:data.environ(0,0)
        },{
            name:'平均硫化氢浓度',
            type:'line',
            smooth:true,
            data:data.environ(0,0)
        },{
            name:'最低硫化氢浓度',
            type:'line',
            smooth:true,
            data:data.environ(0,0)
        }
    ]
};
// 甲烷
let optionMethane = {
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        textStyle:{
            color:'#00ffff'
        },
        data:['最高甲烷浓度','平均甲烷浓度','最低甲烷浓度']
    },
    xAxis: {
        name:'时间',
        type: 'time',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        splitLine: {
            show: false
        }
    },
    yAxis: {
        name:'甲烷（%LEL）',
        type: 'value',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        min:0,
        splitLine: {
            show: false
        }
    },
    series: [
        {
            name:'最高甲烷浓度',
            type:'line',
            smooth:true,
            data:data.environ(1,4)
        },{
            name:'平均甲烷浓度',
            type:'line',
            smooth:true,
            data:data.environ(1,2)
        },{
            name:'最低甲烷浓度',
            type:'line',
            smooth:true,
            data:data.environ(0,0)
        }
    ]
};
borCont.setOption(optionTem);
// 下拉框判断
let valueNum = 1;
function select(e){
    valueNum = e
    if(e == 1){
        borCont.setOption(optionTem);
    }else if(e == 2){
        borCont.setOption(optionHum);
    }else if(e == 3){
        borCont.setOption(optionOxygen);
    }else if(e == 4){
        borCont.setOption(optionHyd);
    }else if(e == 5){
        borCont.setOption(optionMethane);
    }
}
// ------------------------------------设备使用率---------------------------
// 设备使用率
let botUse = echarts.init(document.getElementById('botUse'));
let useOption = {
    title:{
        text:'设备使用率',
        textStyle:{
            color:'#00ffff',
            fontWeight:'normal',
            fontSize:16
        },
        padding:[15,10]
    },
    tooltip: {},
    // legend: {
    //     data: ['使用风机（数量）', '使用防火门（数量）','使用水泵（数量）'],
    //     textStyle:{
    //         color:'#ffffff'
    //     }
    // },
    radar: {
        name: {
            textStyle: {
                color: '#72acd1',
                backgroundColor: ''
            }
        },
        splitArea:{
            areaStyle:{
                color:['rgba(114, 172, 209, 0.2)',
                    'rgba(114, 172, 209, 0.4)', 'rgba(114, 172, 209, 0.6)',
                    'rgba(114, 172, 209, 0.8)', 'rgba(114, 172, 209, 1)']
            }
        },
        radius: '65%',
        indicator: [
            { name: '顺平大街', max: 50},
            { name: '园博园大街', max: 50},
            { name: '安济路', max: 50},
            { name: '隆兴路', max: 50},
            { name: '华阳路', max:50},
            { name: '尉佗路', max: 50},
            { name: '迎旭路', max: 50},
            { name: '奥体街', max: 50},
            { name: '太行大街', max:50},
            { name: '新城大道', max: 50}
        ]
    },
    series: [{
        name: '设备使用量',
        type: 'radar',
        data : [{
                value :[11.5, 13, 8, 0, 14.3, 7.8, 10.7,13,16, 14],
                name : '使用智能照明（%）',
                itemStyle:{
                    color:'yellow'
                }
            }
        ]
    }]
};
botUse.setOption(useOption);

// 定时更新
setInterval(function(){
    data.arr.shift();
    data.arr10.shift();
    // 动力配电
    contentEle.setOption({
        series:[{
            data:data.arr10.slice(0,data.number())
        }]
    });
    // 水位监测
    contentFirm.setOption({
        series: [{
            data: data.arr.slice(0, data.number())
        }]
    });
},15000);

// --------------------------------------机器人----------------------
let robotClass = document.getElementsByClassName('robotClass');
for(var i =0 ;i<robotClass.length ; i++ ){
    if(robotClass[i].innerHTML == '已完成'){
        robotClass[i].style.color = '#32a5cf'
        robotClass[i].style.border = '1px solid #32a5cf'
    }else if(robotClass[i].innerHTML == '进行中'){
        robotClass[i].style.border = '1px solid #ca8622'
        robotClass[i].style.color = '#ca8622'
    }else if(robotClass[i].innerHTML == '待执行'){
        robotClass[i].style.border = '1px solid  #c23531'
        robotClass[i].style.color = '#c23531'
    }
}

// --------------------------巡查巡检--------------------------
// 巡查巡检
let borPatrol = document.getElementsByClassName('borPatrol');
for(let t = 0 ; t<borPatrol.length ; t++){
    borPatrol[t].index = t;
    borPatrol[t].onclick = function(){
        for(var s = 0; s<3;s++){
            this.parentNode.children[s].classList.remove('borUlClass');
        }
        this.classList.add('borUlClass');
    }
}


// --------------------------机器人显示视频页面----------------------
let bb = true;
function aaa(){
    let robotHide = document.getElementsByClassName('robotHide')[0];
    if(bb == true){
        robotHide.style.display = '';
        bb = false;
    }else if(bb == false){
        robotHide.style.display = 'none';
        bb = true
    }
}

// -----------------------列表样式--------------------------
// 时间
let callTime = document.getElementsByClassName('callTime');
let callGrade = document.getElementsByClassName('callGrade');
for(var a = 0 ;a<callGrade.length;a++){
    // callTime[a].innerHTML = time.year()+' '+(a+2)+':'+(a+5);
    if(callGrade[a].innerHTML == '严重'){
        callGrade[a].style.color = '#c23531'
    }else if(callGrade[a].innerHTML == '紧急'){
        callGrade[a].style.color = '#ca8622'
    }else if(callGrade[a].innerHTML == '普通'){
        callGrade[a].style.color = 'yellow'
    }else if(callGrade[a].innerHTML == '设备'){
        callGrade[a].style.color = '#32a5cf'
    }
}
let getYear = date.getFullYear()+'年'+(date.getMonth()+1)+'月'+ (date.getDate()-1)+'日'
callTime[0].innerHTML = getYear+' '+'5:30';
callTime[1].innerHTML = getYear+' '+'5:30';
callTime[2].innerHTML = getYear+' '+'5:33';
callTime[3].innerHTML = getYear+' '+'12:30';
callTime[4].innerHTML = getYear+' '+'12:30';
callTime[5].innerHTML = getYear+' '+'13:05';
callTime[6].innerHTML = getYear+' '+'13:32';
callTime[7].innerHTML = getYear+' '+'13:32';
callTime[8].innerHTML = getYear+' '+'14:14';
callTime[9].innerHTML = getYear+' '+'15:21';
callTime[10].innerHTML = getYear+' '+'15:21';
callTime[11].innerHTML = getYear+' '+'16:11';
callTime[12].innerHTML = getYear+' '+'19:37';

// 入廊企业
let firmConMain = document.getElementsByClassName('firmConMain');
let firmConTop = document.getElementById('firmConTop');
for(let h = 0; h<firmConMain.length; h++){
    firmConMain[h].index = h;
    firmConMain[h].onmousemove = function(e){
        switch(this.index){
            case 0:
                firmConTop.style.left = (e.clientX+10)+'px';
                firmConTop.style.top = (e.clientY+10)+'px';
                firmConTop.style.display = 'inline';
                firmConTop.innerHTML = '<div>通信光纤</div>'+
                    '<div>全长：5.3km</div>'
                break;
            case 1:
                firmConTop.style.left = (e.clientX+10)+'px';
                firmConTop.style.top = (e.clientY+10)+'px';
                firmConTop.style.display = 'inline';
                firmConTop.innerHTML = '<div>热力管</div>'+
                    '<div>全长：16km</div>'
                break;
            case 2:
                firmConTop.style.left = (e.clientX+10)+'px';
                firmConTop.style.top = (e.clientY+10)+'px';
                firmConTop.style.display = 'inline';
                firmConTop.innerHTML = '<div>供电线缆</div>'+
                    '<div>110KV:5.3km</div>'+
                    '<div>35KV:3.5km</div>'+
                    '<div>10KV:16km</div>'
                break;
            case 3:
                firmConTop.style.left = (e.clientX+10)+'px';
                firmConTop.style.top = (e.clientY+10)+'px';
                firmConTop.style.display = 'inline';
                firmConTop.innerHTML = '<div>供水管道</div>'+
                    '<div>中水：16km</div>'+
                    '<div>供水：16km</div>'
                break;
        }
    }
    firmConMain[h].onmouseout = function(){
        firmConTop.style.display = 'none'
    }

}






















