/**
 * Created by Administrator on 2019/8/30.
 */
/**
 * Created by Administrator on 2019/8/28.
 */
// var ol = require('openlayers');
// var logo = require("@supermap/iclient-openlayers").Logo;
// var TileSuperMapRest = require('@supermap/iclient-openlayers').TileSuperMapRest;

    // 定义点坐标

// var col = new SuperMap.Geometry.Collection([point1,point2]);



var url = "http://192.168.0.243:8090/iserver/services/map-zhengDing/rest/maps/zhengDing";
var map = new ol.Map({
    target: 'map',
    // controls: ol.control.defaults({attributionOptions: {collapsed: false}})
    //     .extend([new ol.supermap.control.Logo()]),
    view: new ol.View({
        center: [114.62 , 38.14],
        zoom: 14,
        maxZoom:16,
        minZoom:12,
        projection: 'EPSG:4326'
    })
});

//获取坐标系统
// ol.View.getProjection();
var layer = new ol.layer.Tile({
    source: new ol.source.TileSuperMapRest({
        url: url,
        wrapX: true
    }),
    projection: 'EPSG:4326'
});
map.addLayer(layer);
// map.addControl(new ol.supermap.control.ScaleLine());
query();

// 鼠标事件
var stylesOptions = {
    url: url,
    view: map.getView()
};
var sections;
var vectorTileStyles = new ol.supermap.VectorTileStyles(stylesOptions);

map.on('pointermove',function (e) {
    if(typeof(feature)== 'undefined'){
        $('#popu').css('display','none');
    }
    var features = map.forEachFeatureAtPixel(e.pixel,function (feature) {
        $('#popu').css("display","block");
        // console.log(feature.N.Section);
        if(sections !== feature.N.Section){
            $("#galRoad").html(feature.N.Name);
            $("#section").html(feature.N.Section);
            var temN = (Math.random()*2+19).toFixed(1);
            var humN =(Math.random()*12+78).toFixed(1);
            var oxyN = (Math.random()*3+20).toFixed(1);
            var metN = Math.round(Math.random()*2);
            $("#temN").html(temN);
            $("#humN").html(humN);
            $("#oxyN").html(oxyN);
            $("#metN").html(metN);
        }
        sections = feature.N.Section;
        // alert(feature.N.Section);
        // alert(feature.N.Section);

        // console.log(e.pixel);
        // var x = e.pixel[0]+"px";
        // var y = e.pixel[1]+'px';
        // popu.style.top = y;
        // popu.style.left = x;
        // // vectorTileStyles.dispatchEvent({type: 'featureSelected',
        //     selectedId: feature.getProperties().id,
        //     layerName: feature.getProperties().layerName
        // });
        return true;
    },{hitTolerance:5})});


// SQL查询
function query() {
    var param = new SuperMap.QueryBySQLParameters({
        queryParams: {
            name: "gallery_L@zhengDing.1",
            // attributeFilter: "NAME = 新城大街",
            fields:["Name",'Section']
        }
    });
    new ol.supermap.QueryService(url).queryBySQL(param, function (serviceResult) {
        /*console.log(serviceResult.result.recordsets[0].features.forEach);
        console.log(serviceResult.result.recordsets[0].features.features[0].properties.Section);*/
        var vectorSource = new ol.source.Vector({
            features: (new ol.format.GeoJSON()).readFeatures(serviceResult.result.recordsets[0].features),
            wrapX: false,
        });
        // console.log(vectorSource);
        resultLayer = new ol.layer.Vector({
            source: vectorSource
        });
        map.addLayer(resultLayer);
    });

}