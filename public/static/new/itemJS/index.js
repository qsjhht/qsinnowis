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
    crew(){
        return '<img src="../../../static/new/image/user-fill.png" width:="20" height="18" style="position:relative;top:2px"/>在岗36人'
    }
};
let infoDate = document.getElementById('infoDate');
let content = `${time.year()}&nbsp;&nbsp;${time.dayDate()}&nbsp;&nbsp;|&nbsp;&nbsp;${time.crew()}`;
infoDate.innerHTML = content;

// 值班人员设置
let duty = {
    crew:'李勇',
    strip:`
        <div class="progress">
            <div class='progressFro'></div>
            <div class='progressBack'></div>
        </div>
    `,
    sum:function(){
        return '值班：'+this.crew+'&nbsp;&nbsp;8:30'+this.strip+'18:30'
    }
}
let infoDty = document.getElementById('infoDty');
infoDty.innerHTML = duty.sum();

// ----------------------------------------------------------------------数据模拟
// let data = {
//     date: date.toLocaleDateString(),
//     timeHours: date.getHours(),
//     timeMin: date.getMinutes(),
//     timeNode:function(){
//         return (this.timeHours*60+this.timeMin)*2;
//     },
//     water: function(diploid,number){
//         let arr = [];
//         let hour = 0;
//         let minu = 0;
//         let num = 0;
//         for(var i = 0 ;i <= this.timeNode();i++){
//             num = parseInt(Math.random().toFixed(2)*diploid)+number;
//             hour = Math.floor(i/120);
//             if(hour <10){
//                 hour = '0' +hour
//             }
//             minu = Math.ceil(i%120/2);
//             if(minu < 10){
//                 minu = '0'+ minu
//             }
//             arr.push([this.date+' '+hour+':'+minu,num])
//         }
//         return arr;
//     },
//     ele:function(diploid){
//         let arr = [];
//         let hour = 0;
//         let minu = 0;
//         let num = 500;
//         for(var i = 0 ;i <= this.timeNode();i++){
//             num += parseInt(Math.random().toFixed(2)*diploid);
//             hour = Math.floor(i/120);
//             if(hour <10){
//                 hour = '0' +hour
//             }
//             minu = Math.ceil(i%120/2);
//             if(minu < 10){
//                 minu = '0'+ minu
//             }
//             arr.push([this.date+' '+hour+':'+minu,num])
//         }
//         return arr;
//     }
// };
let data = {
    // 当前日期
    timeLcale:new Date().toLocaleDateString(),
    // 当前时间戳
    getTime: new Date().getTime()/1000,
    // 凌晨时间戳
    weeHours: new Date(new Date().toLocaleDateString()).getTime()/1000,
    // 遍历次数
    number:function(){
        return Math.round((this.getTime-this.weeHours)/15)
    },
    // 数组
    arr:[],// 水位
    arr1:[],//温度
    arr2:[],//湿度
    arr3:[],//氧气
    arr4:[],//硫化氢
    arr5:[],//甲烷
    water: function(aaa,bbb) {
        let hour = 0;
        let minu = 0;
        let second = 0;
        let num = 0;
        switch (aaa) {
            case 2.7 ://水位
                for (var i = 0; i < 5760; i++) {
                    num += parseInt((Math.random() - 0.5) * aaa);
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
                    this.arr.push([this.timeLcale + ' ' + hour + ':' + minu + ':' + second, num + bbb])
                }
                break;
            case 3://温度
                console.log('3')
                for (var i = 0; i < 5760; i++) {
                    num += parseInt((Math.random() - 0.5) * aaa);
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
                    this.arr1.push([this.timeLcale + ' ' + hour + ':' + minu + ':' + second, num + bbb])
                }
                break;
            case 4://湿度
                console.log('4')
                for (var i = 0; i < 5760; i++) {
                    num += parseInt((Math.random() - 0.5) * aaa);
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
                    this.arr2.push([this.timeLcale + ' ' + hour + ':' + minu + ':' + second, num + bbb])
                }
                break;
            case 1.2://氧气
                console.log('1.2')
                for (var i = 0; i < 5760; i++) {
                    num += parseInt((Math.random() - 0.5) * aaa);
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
                    this.arr3.push([this.timeLcale + ' ' + hour + ':' + minu + ':' + second, num + bbb])
                }
                break;
            case 3.5://硫化氢
                console.log('3.5')
                for (var i = 0; i < 5760; i++) {
                    num += parseInt((Math.random() - 0.5) * aaa);
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
                    this.arr4.push([this.timeLcale + ' ' + hour + ':' + minu + ':' + second, num + bbb])
                }
                break;
            case 30://用电量
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
                    this.arr5.push([this.timeLcale + ' ' + hour + ':' + minu + ':' + second, num + bbb])
                }
                break;
        }
    }
};
data.water(3,50);//温度
data.water(4,50);//湿度
data.water(1.2,21);//氧气
data.water(3.5,20);//硫化氢
data.water(30,30);//用电量
data.water(2.7,50);//水位
// 动力配电
    let contentEle = echarts.init(document.getElementById('contentEle'));
    let eleOption = {
        title:{
            text:'动力配电设置',
            textStyle:{
                color:'#00ffff',
                fontWeight:'normal'
            },
            padding:[10,10]
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
            name:'用电量（kv/h）',
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
            startValue:new Date((data.getTime-3600)*1000)
        },{
            type:'inside'
        }],
        series: [{
            name: '用电量(kv/h)',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data:data.arr5.slice(0,data.number())
        }]
    }
contentEle.setOption(eleOption);

// 报警类型
let callIcon = echarts.init(document.getElementById('callIcon'));
let callOption = {
    title:{
        text:'报警设置',
        textStyle:{
            color:'#00ffff',
            fontWeight:'normal'
        },
        padding:[10,10]
    },
    tooltip: {
        trigger: 'axis'
    },
    xAxis:{
        name:'类型',
        type:'category',
        data:['严重','紧急','突发','普通'],
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
        data:[20,35,45,31]
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
            fontWeight:'normal'
        },
        padding:[10,10]
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
        name:'水位（mm）',
        type:'value',
        boundarGap:[0,'100%'],
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
    dataZoom:[{
        startValue:new Date((data.getTime-3600)*1000)
    },{
        type:'inside'
    }],
    series:[{
        name:'水位高度',
        type:'line',
        smooth:true,
        itemStyle:{
            color:'rgb(255,70,131)'
        },
        areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0,
                color: 'rgb(255, 158, 68)'
            }, {
                offset: 1,
                color: 'rgb(255, 70, 131)'
            }])
        },
        data:data.arr.slice(0,data.number()),
        markLine:{
            silent:true,
            lineStyle:{
                color:'blue',
                width:2
            },
            data:[{
                yAxis:80
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
    dataZoom:[{
        startValue:new Date((data.getTime-3600)*1000)
    },{
        type:'inside'
    }],
    series: [
        {
            name:'最高温度',
            type:'line',
            data:data.arr.slice(0,data.number())

        },
        {
            name:'平均温度',
            type:'line',
            data:data.arr1.slice(0,data.number())
        },
        {
            name:'最低温度',
            type:'line',
            data:data.arr2.slice(0,data.number())
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
    dataZoom:[{
        startValue:new Date((data.getTime-3600)*1000)
    },{
        type:'inside'
    }],
    series: [
        {
            name:'最高湿度',
            type:'line',
            data:data.arr.slice(0,data.number())
        },{
            name:'平均湿度',
            type:'line',
            data:data.arr1.slice(0,data.number())
        },{
            name:'最低湿度',
            type:'line',
            data:data.arr2.slice(0,data.number())
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
        name:'氧气（%）',
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
    dataZoom:[{
        startValue:new Date((data.getTime-3600)*1000)
    },{
        type:'inside'
    }],
    series: [
        {
            name:'最高氧气浓度',
            type:'line',
            data:data.arr.slice(0,data.number())
        },{
            name:'平均氧气浓度',
            type:'line',
            data:data.arr1.slice(0,data.number())
        },{
            name:'最低氧气浓度',
            type:'line',
            data:data.arr2.slice(0,data.number())
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
        name:'硫化氢',
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
    dataZoom:[{
        startValue:new Date((data.getTime-3600)*1000)
    },{
        type:'inside'
    }],
    series: [
        {
            name:'最高硫化氢浓度',
            type:'line',
            data:data.arr.slice(0,data.number())
        },{
            name:'平均硫化氢浓度',
            type:'line',
            data:data.arr1.slice(0,data.number())
        },{
            name:'最低硫化氢浓度',
            type:'line',
            data:data.arr2.slice(0,data.number())
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
        name:'甲烷（ppm）',
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
    dataZoom:[{
        startValue:new Date((data.getTime-3600)*1000)
    },{
        type:'inside'
    }],
    series: [
        {
            name:'最高甲烷浓度',
            type:'line',
            data:data.arr.slice(0,data.number())
        },{
            name:'平均甲烷浓度',
            type:'line',
            data:data.arr1.slice(0,data.number())
        },{
            name:'最低甲烷浓度',
            type:'line',
            data:data.arr2.slice(0,data.number())
        }
    ]
};
borCont.setOption(optionTem);
// 下拉框判断
function select(e){
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
        text:'设备使用',
        textStyle:{
            color:'#00ffff',
            fontWeight:'normal'
        },
        padding:[10,10]
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
        radius: '70%',
        indicator: [
            { name: '顺平大街', max: 100},
            { name: '园博园大街', max: 100},
            { name: '安济路', max: 100},
            { name: '隆兴路', max: 100},
            { name: '华阳路', max: 100},
            { name: '尉佗路', max: 100},
            { name: '迎旭路', max: 100},
            { name: '奥体街', max: 100},
            { name: '太行大街', max: 100},
            { name: '新城大道', max: 100}
        ]
    },
    series: [{
        name: '设备使用量',
        type: 'radar',
        data : [
            {
                value : [40, 45, 47, 51, 39, 48, 52, 46, 45, 49],
                name : '使用风机（%）',
                itemStyle:{
                    color:'#ca8622'
                }
            },
            {
                value :[67, 62, 69, 61, 71, 73, 77,64,78,60],
                name : '使用防火门（%）',
                itemStyle:{
                    color:'#92eaf3'
                }
            },{
                value:[21,25,31,38,35,28,40,27,36,27],
                name:'使用水泵（%）',
                itemStyle:{
                    color:'#e98f6f'
                }
            }
        ]
    }]
};
botUse.setOption(useOption);

// 定时更新
setInterval(function(){
    data.arr.shift();
    data.arr1.shift();
    data.arr2.shift();
    data.arr5.shift();

    // 动力配电
    contentEle.setOption({
        series:[{
            data:data.arr5.slice(0,data.number())
        }]
    });

    // 水位监测
    contentFirm.setOption({
        series: [{
            data: data.arr.slice(0, data.number())
        }]
    });
    // 环境监测
    borCont.setOption({
        series:[{
            data:data.arr.slice(0,data.number())
        },{
            data:data.arr1.slice(0,data.number())
        },{
            data:data.arr2.slice(0,data.number())
        }]
    })
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




















