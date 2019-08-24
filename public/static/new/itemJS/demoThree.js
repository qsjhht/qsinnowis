
    // 数据
let date = new Date();
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
                case 5://甲烷
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
    data.water(5,40);//甲烷
    data.water(2.7,50);//水位




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
        splitLine: {
            show: false
        },
        min:0,
        max:100
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

// 实时更新
setInterval(function(){
    data.arr.shift();
    data.arr1.shift();
    data.arr2.shift();
    // data.arr3.shift();
    contentFirm.setOption({
        series: [{
            data: data.arr.slice(0, data.number())
        }]
    });
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

// -----------------------------------------------------------
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
// 机器人显示视频页面
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
// 巡查巡检
    let borPatrol = document.getElementsByClassName('borPatrol');
    for(let t = 0 ; t<borPatrol.length ; t++){
        borPatrol[t].index = t;
        borPatrol[t].onclick = function(){
            // let child =
            for(var s = 0; s<3;s++){
                this.parentNode.children[s].classList.remove('borUlClass');
            }
            this.classList.add('borUlClass');
        }
    }


