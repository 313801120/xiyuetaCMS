;
layui.define(function(e) {
    var a = layui.admin;
    layui.use(["carousel", "echarts"], function() {
        var sjson

        function loadData(nian) {
            if (nian == undefined) nian = "";
            // alert(inadminid)
            jQuery.ajax({
                url: '?act=json&nian='+nian+'&inadminid='+inadminid,
                type: 'POST',
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest)
                    console.log(textStatus)
                    console.log(errorThrown)
                },
                success: function(result) {
                    var splxx = result.split(",")
                    // alert(result)
                    var json = JSON.parse(result); //字符转json
                    // console.log("json",json)
                    aa(json);

                }
            });

        }
        $(".loadlian").click(function(){            
            const currentYear = new Date().getFullYear();//今年
            var title=$(this).text();
            if(title=="今年"){
                loadData(currentYear); 
            }else if(title=="去年"){
                loadData(currentYear-1);     
            }else if(title=="前年"){
                loadData(currentYear-2);     
            }
            // alert("title="+title);

        }) 
        loadData();


        function aa(json) {
            var e = layui.$,
                a = (layui.carousel, layui.echarts),
                l = [],
                t = [{
                    title: {

                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        bottom: true,
                        // data: ['访问量', '留言量', '金币', '用户'],
                        data: ['项目量', '收入', '支出', '新用户'],
                        textStyle: {
                            color: '#123'
                        }

                    },
                    grid: {
                        x: 50, //向左边位置留空白
                        x2: 10, //向右边位置留空白
                        y: 30, //向上边位置留空白
                        y2: 30, //向下边位置留空白
                        containLabel: true
                    },
                    xAxis: {
                        data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
                    },
                    yAxis: {},
                    series: [{
                            name: '项目量',
                            type: 'line',
                            data: json.jiedancount
                        }, {
                            name: '收入',
                            type: 'line',
                            data: json.shouduancount
                        }, {
                            name: '支出',
                            type: 'line',
                            data: json.payment
                        }, {
                            name: '新用户',
                            type: 'line',
                            data: json.newmemebercount
                        }

                        // , {
                        //     name: '用户',
                        //     type: 'line',
                        //     data: [25, 63, 52, 41, 210, 120, 24, 35, 46, 577, 633, 299]
                        // }
                    ]
                }],
                i = e("#LAY-index-pagetwoA").children("div"),
                n = function(e) { l[e] = a.init(i[e], layui.echartsTheme), l[e].setOption(t[e]), window.onresize = l[e].resize };



            i[0] && n(0)
        }
    }), e("yun", {})
});