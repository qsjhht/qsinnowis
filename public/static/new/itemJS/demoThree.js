
    // 数据
let date = new Date();
let data = {
    getYear:date.getFullYear(),//年份
    getMonth:date.getMonth()+1,//月份
    getDate:date.getDate(),//日
    getTime:date.getHours(),//当前时间
    weeHours:date.getMinutes(),//当前分钟
    timeLcale:function(){
        return this.getYear+'/'+this.getMonth+'/'+this.getDate  // 当前日期
    },
    // 遍历次数
    number:function(){
        return (this.getTime*60+this.weeHours)*4
    },
    arr:[],//水位
    // arr1:[],//环境
    water: function(aaa,bbb) {
        let hour = 0;
        let minu = 0;
        let second = 0;
        let num = 0;
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
    },
    environ:function(ccc,ddd){//环境
        let num = 0;// 随机数
        let arr1 = [];  // 返回数组
	/*
	for(var y = 0; y < 31 ;y++){
	    num = ((Math.random()-0.5)*ccc+ddd).toFixed(2);
	    if( [y + this.getDate] < 32){
		arr1.push([this.getYear+'/'+[this.getMonth-1] + '/'+ [y+this.getDate],num])
	    }else{
		
		arr1.push([this.getYear+'/'+ this.getMonth + '/'+ [y+this.getDate-30],num])
	    }

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
        splitLine: {
            show: false
        },
        min:0,
        max:100
    },
    dataZoom:[{
	start:95,
	end:100,
	backgroundColor:'rgb(ff,ff,ff)',
	height:'15',
	bottom:'3%'
    },{
        type:'slider',
	//borderColor:'rgb(30,255,05)',
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
                data:data.environ(3,67)
            },{
                name:'最低湿度',
                type:'line',
                smooth:true,
                data:data.environ(3,62)
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
        name:'硫化氢（ppm）',
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
            data:data.environ(1,4)
        },{
            name:'平均甲烷浓度',
            type:'line',
            data:data.environ(1,2)
        },{
            name:'最低甲烷浓度',
            type:'line',
            data:data.environ(0,0)
        }
    ]
};
borCont.setOption(optionTem);

// 实时更新
setInterval(function(){
    data.arr.shift();
    // 水仓
    contentFirm.setOption({
        series: [{
            data: data.arr.slice(0, data.number())
        }]
    });
},15000);
// 下拉框判断
let valueNum = 1;
function select(e){
    valueNum = e;
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
        //robotClass[i].style.color = '#32a5cf'
        robotClass[i].style.backgroundColor = '#32a5cf'
    }else if(robotClass[i].innerHTML == '进行中'){
        //robotClass[i].style.border = '1px solid #ca8622'
        robotClass[i].style.backgroundColor = '#ca8622'
    }else if(robotClass[i].innerHTML == '待执行'){
        //robotClass[i].style.border = '1px solid  #c23531'
        robotClass[i].style.backgroundColor = '#c23531'
    }
}


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



















