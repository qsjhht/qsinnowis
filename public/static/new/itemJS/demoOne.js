// 管廊信息
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
        return '<img src="../image/user-fill.png" width:="20" height="18" style="position:relative;top:2px"/>在岗36人'
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
    legend: {
        data: ['使用风机（%）', '使用防火门（%）','使用水泵（%）'],
        textStyle:{
            color:'#ffffff'
        }
    },
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
        radius: '90%',
        indicator: [
            { name: '顺平大街', max:100},
            { name: '园博园大街', max:100},
            { name: '安济路', max:100},
            { name: '隆兴路', max:100},
            { name: '华阳路', max:100},
            { name: '尉佗路', max:100},
            { name: '迎旭路', max:100},
            { name: '奥体街', max:100},
            { name: '太行大街', max:100},
            { name: '新城大道', max:100}
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
                value : [67, 62, 69, 61, 71, 73, 77,64,78,60],
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

// 动力配电
let contentEle = echarts.init(document.getElementById('contentEle'));
let arr = [];
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
    // 水位
    water: function(){
        let hour = 0;
        let minu = 0;
        let second = 0;
        let num = 0;
        for(var i = 0; i < 5760; i++){
            num += parseInt((Math.random()-0.45)*30);
            hour = Math.floor(i/240);
            if(hour <10){
                hour = '0' +hour
            }
            minu = Math.floor(i%240/4)
            if(minu < 10){
                minu = '0'+ minu
            }
            second = i%4*15;
            if(second == 0){
                second = '00'
            }
            arr.push([this.timeLcale+' '+hour+':'+minu+':'+second,num+30])
        }
    }

};

data.water();
console.log(arr.slice(0,data.number()))
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
        data: arr.slice(0,data.number())
    }]
};

contentEle.setOption(eleOption);
setInterval(function(){
    arr.shift();
    contentEle.setOption({
        series: [{
            data:arr.slice(0,data.number())
        }]
    })
},15000);

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
        },
    },
    yAxis:{
        name:'数量',
        type:'value',
        axisLine:{
            lineStyle:{
                color:'#FFFFFF'
            }
        },
        splitLine: {
            show: false
        },
        min:0
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








