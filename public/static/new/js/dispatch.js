
let  dispatch,
     dispatch_detail = [],
     dispatchRed, 
     dispatchCon,
     a = 0 , 
     b = 0 , //右侧菜单选择 
     c
let  switchValue,  // 调度台显示
     showHide = true  // 电话能否显示

layui.use('layer',()=>{
     let layer = layui.layer
})

// 获取信息
function ajax(){
     // 获取content 数据
     let num,S,D   // 数 ， 获取的数据 ， 水仓数据 ，电仓数据  
     $.ajax({
          url:'http://192.168.5.100:1000/real/get_phone',
          type:'get',
          async:false,
          success:(data) => {
               dispatch = JSON.parse(data).data;  // 获取信息
              console.dir(dispatch);
              console.dir(dispatch);
              console.dir(dispatch);
              console.dir(dispatch);
               for(let i in dispatch){
                    num = dispatch[i][0]['分机名称'].indexOf('-');
                    if(num != -1){
                         S = dispatch[i].filter(data => {
                              if(data['分机名称'].charAt(num-1) == 'S'){
                                   return data
                              }
                         })
                         D = dispatch[i].filter(data => {
                              if(data['分机名称'].charAt(num-1) == 'D'){
                                   return data
                              }
                         })
                         dispatch_detail.push({"水仓":S,"电仓":D})
                    }else{
                         dispatch_detail.push(dispatch[i])
                    }
               }
               dispatchRight()
          },
          error:(err) => {
               console.log('请求数据失败！')
          }
     })
}
ajax();
// console.log(dispatch_detail);
// 写右侧数组
function dispatchRight(){
     // 右侧菜单
     for(let i in dispatch){
          dispatchRed = `<div class="rightMenu menu_blue">${i}</div>`
          $('#dispatchBottom_right').append(dispatchRed)
     }
     // 左侧话机
     for(let y in dispatch_detail){
          if(dispatch_detail[y] instanceof Array){
               dispatchCon = `<div class="dispatchShowHide"> 
                    <div class="scrollber dispatchContent"></div>
               <div>`
               $('#dispatchBottom_left').append(dispatchCon)
               dispatchItem(y)
          }else{
               dispatchCon = `<div class="dispatchShowHide">
                    <fieldset class="layui-elem-field layui-field-title border">
                         <legend><img src="../../../static/new/dispatch-img/dian.png" width="15" height="20" alt="/"> 水仓</legend>
                    </fieldset>
                    <div style="height:33.5vh;overflow-y:auto" class="scrollber dispatchContent">
                    </div>
                    <fieldset class="layui-elem-field layui-field-title border" >
                         <legend><img src="../../../static/new/dispatch-img/shui.png" width="15" height="20" alt="/"> 电仓</legend>
                    </fieldset>
                    <div style="height:33.5vh;overflow-y:auto" class="scrollber dispatchContent">
                    </div>
               </div>`
               $('#dispatchBottom_left').append(dispatchCon)
               dispatchItem(y)
          }
          $('.dispatchShowHide:eq(0)').css('display','block')

     }
}

// 写水电仓 内容
function dispatchItem(c){
     let dispatchArray = dispatch_detail[c],
          numShui,numDian,numContent,dispatchState
     if(dispatchArray instanceof Array){
          for(let i in dispatchArray){
               if(dispatchArray[i]['分机状态'] == '' || dispatchArray[i]['分机状态']== '空闲'){
                    dispatchState = 'leisure'
               }else if(dispatchArray[i]['分机状态'] == '呼叫失败'){
                    dispatchState = 'goUnder'
               }else if(dispatchArray[i]['分机状态'] == '摘机'){
                    dispatchState = 'callOut'
               }else{
                    dispatchState = 'outboard'
               }    
               numContent = `
                    <div class="${dispatchState}">
                         <div class="dispatch_div">
                              <span>${dispatchArray[i]["分机号码"]}</span>
                              </br></br>
                              <span>${dispatchArray[i]["分机名称"]}</span>
                         </div>
                    </div>
               `
               $(`.dispatchShowHide:eq(${c}) .dispatchContent:eq(0)`).append(numContent)
          }
     }else{
          for(let o in dispatchArray['水仓']){
               if(dispatchArray['水仓'][o]['分机状态'] == '' || dispatchArray['水仓'][o]['分机状态']== '空闲'){
                    dispatchState = 'leisure'
               }else if(dispatchArray['水仓'][o]['分机状态'] == '呼叫失败'){
                    dispatchState = 'goUnder'
               }else if(dispatchArray['水仓'][o]['分机状态'] == '摘机'){
                    dispatchState = 'callOut'
               }else{
                    dispatchState = 'outboard'
               }    
               numShui = `
               <div class="${dispatchState}">
                    <div class="dispatch_div">
                         <span>${dispatchArray['水仓'][o]["分机号码"]}</span>
                         </br></br>
                         <span>${dispatchArray['水仓'][o]["分机名称"]}</span>
                    </div>
               </div>
               `
               $(`.dispatchShowHide:eq(${c}) .dispatchContent:eq(0)`).append(numShui)
          }
          for(let y in dispatchArray['电仓']){
               if(dispatchArray['电仓'][y]['分机状态'] == '' || dispatchArray['电仓'][y]['分机状态']== '空闲'){
                    dispatchState = 'leisure'
               }else if(dispatchArray['电仓'][y]['分机状态'] == '呼叫失败'){
                    dispatchState = 'goUnder'
               }else if(dispatchArray['电仓'][y]['分机状态'] == '摘机'){
                    dispatchState = 'callOut'
               }else{
                    dispatchState = 'outboard'
               }         
               numDian = `
               <div class="${dispatchState}">
                    <div class="dispatch_div">
                         <span>${dispatchArray['电仓'][y]["分机号码"]}</span>
                         </br></br>
                         <span>${dispatchArray['电仓'][y]["分机名称"]}</span>
                    </div>
               </div>
               `
               $(`.dispatchShowHide:eq(${c}) .dispatchContent:eq(1)`).append( numDian)
          }
     }
     dispatchClickItem(b)
}

// 右侧二级菜单 单机事件
function dispatchClick(){
     let rightMenu = document.getElementsByClassName('rightMenu')
     for(let i = 0 ; i < rightMenu.length ; i++){
          rightMenu[i].onclick = function(){

               $('#jiao').css('top',`${15+(i*70)}px`)

               $('.dispatchShowHide').each(function(){
                    $(this).css('display','none')
               })
               $(`.dispatchShowHide:eq(${i})`).css('display','block')
               b = i
               dispatchClickItem(i)
          }
     }
}
dispatchClick()

// 话机 单机事件
function dispatchClickItem(a){
     if(dispatch_detail[a] instanceof Array){
          // 总
          $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(0) > div`).each(function(e){
               $(this).click(function(){
                    let itemData = dispatch_detail[a]
                    if(switchValue == '8001' || switchValue == '8002'){
                         if(showHide){
                              $.ajax({
                                   url:`http://192.168.5.100:1000/real/call_phone?type=调度单呼&from_num=${switchValue}&call=${itemData[e]["分机号码"]}`,
                                   type:'get',
                                   success:(res) => {
                                        console.log(res)
                                   }
                              })
                              showHide = false
                         }else{
                              layer.msg('调度电话已摘机！')
                         }
                    }else{
                         layer.msg('调度台未摘机！')
                    }
               })
          })
     }else{
          // 水仓
          $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(0) > div`).each(function(e){
               $(this).click(function(){
                    let itemData = dispatch_detail[a]['水仓']
                    if(switchValue == '8001' || switchValue == '8002'){
                         if(showHide){
                              $.ajax({
                                   url:`http://192.168.5.100:1000/real/call_phone?type=调度单呼&from_num=${switchValue}&call=${itemData[e]["分机号码"]}`,
                                   type:'get',
                                   success:(res) => {
                                        console.log(res)
                                   }
                              })
                              showHide = false
                         }else{
                              layer.msg('调度电话已摘机！')
                         }
                    }else{
                         layer.msg('调度台未摘机！')
                    }
               })
          })
          // 电仓
          $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(1) > div`).each(function(e){
               $(this).click(function(){
                    let itemData = dispatch_detail[a]['水仓']
                    if(switchValue == '8001' || switchValue == '8002'){
                         if(showHide){
                              $.ajax({
                                   url:`http://192.168.5.100:1000/real/call_phone?type=调度单呼&from_num=${switchValue}&call=${itemData[e]["分机号码"]}`,
                                   type:'get',
                                   success:(res) => {
                                        console.log(res)
                                   }
                              })
                              showHide = false
                         }else{
                              layer.msg('调度电话已摘机！')
                         }
                    }else{
                         layer.msg('调度台未摘机！')
                    }
               })
          })
     }
}


// 点击进行组呼
$('.dispatchImg1').click(()=>{
     if(switchValue == 8001 || switchValue == 8002){
          if(showHide){
               // let dispatchArray = Object.keys(dispatch)[b]
               if(dispatch_detail[b] instanceof Array){
                    // $(`.dispatchShowHide:eq(${b}) .dispatchContent:eq(0) div`).siblings().removeAttr('class').addClass('callOut')
                    $.ajax({
                         url:`http://192.168.5.100:1000/real/call_phone?type=调度组呼&from_num=${switchValue}&call=${dispatchArray}`,
                         type:'get',
                         success:(data) => {
                              console.log(data)
                         }
                    })
                    showHide = false
               }else{
                    // $(`.dispatchShowHide:eq(${b}) .dispatchContent:eq(0) div`).siblings().removeAttr('class').addClass('callOut')
                    // $(`.dispatchShowHide:eq(${b}) .dispatchContent:eq(1) div`).siblings().removeAttr('class').addClass('callOut')
                    $.ajax({
                         url:`http://192.168.5.100:1000/real/call_phone?type=调度组呼&from_num=${switchValue}&call=${dispatchArray}`,
                         type:'get',
                         success:(data) => {
                              console.log(data)
                         }
                    })
                    showHide = false 
               }
          }else{
               layer.msg('调度电话已摘机！')
          }
     }else{
          layer.msg('调度台未摘机！')
     }
})

// WebSocket
var socket = io('http://192.168.5.100:2120')
socket.emit('login',33333)
socket.on('new_msg',(data) => {
     c = eval("("+data+")")
     if(c.category == '号码更新'){
          ajax()
     }else if(c.category == '分机状态'){
          if(c['号码'] == 8001){
               if(c['状态'] == "空闲"){
                    switchValue = ''
                    $('#display1').css('backgroundColor','#00FFFF')
               }else if(c['状态'] == "摘机"){
                    switchValue = c['号码']
                    $('#display1').css('backgroundColor','#1ac036')
               }else{
                    console.log('未找到该状态')
               }
          }else if(c['号码'] == 8002){
               if(c['状态'] == '空闲'){
                    switchValue = ''
                    $('#display2').css('backgroundColor','#00FFFF')
               }else if(c['状态'] == '摘机'){
                    switchValue = c['号码']
                    $('#display2').css('backgroundColor','#1ac036')
               }else{
                    console.log('未找到该状态')
               }
          }else{
               for(let i in dispatch_detail){
                    if(dispatch_detail[i] instanceof Array){
                         dispatch_detail[i].filter((data,index) => {
                              if(data['分机号码'] == c['号码']){
                                   core(i,index,c)
                              }
                         })
                    }else{
                         for(let y in dispatch_detail[i]){
                              dispatch_detail[i][y].filter((data,index) => {
                                   if(data['分机号码'] == c['号码']){
                                        core1(i,y,index,c)
                                   }
                              })
                         }
                    }
               }
          }
     }
})

// 单个话机
function core(a,b,c){
     switch(c['状态']){
          case '空闲':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(0)> div:eq(${b})`).removeAttr('class').addClass('leisure')
               showHide = true
               break;
          case '摘机':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(0)> div:eq(${b})`).removeAttr('class').addClass('callOut')
               showHide = false
               break;
          case '正在呼叫':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(0)> div:eq(${b})`).removeAttr('class').addClass('outboard')
               break;
          case '呼叫失败':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(0)>div:eq(${b})`).removeAttr('class').addClass('callOut')
               showHide = true
               break;
          default:
               layer.msg('没有找到该状态！')
               break;
     }
}
function core1(a,b,c,d,e){
     if(b == '水仓'){
          e = 0
     }else{
          e = 1
     }
     switch(d['状态']){
          case '空闲':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(${e})> div:eq(${c})`).removeAttr('class').addClass('leisure')
               showHide = true
               break;
          case '摘机':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(${e})> div:eq(${c})`).removeAttr('class').addClass('callOut')
               showHide = false
               break;
          case '正在呼叫':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(${e})> div:eq(${c})`).removeAttr('class').addClass('outboard')
               break;
          case '呼叫失败':
               $(`.dispatchShowHide:eq(${a}) .dispatchContent:eq(${e})>div:eq(${c})`).removeAttr('class').addClass('callOut')
               showHide = true
               break;
          default:
               layer.msg('没有找到该状态！')
     }
}
