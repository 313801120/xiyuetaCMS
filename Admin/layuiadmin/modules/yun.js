;
layui.define(function(e) {
    var a = layui.admin;
    layui.use(["carousel", "echarts"], function() {
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
                    data: ['访问量', '留言量', '金币', '用户'],
                    textStyle: {
                        color: '#123'
                    }

                },
                grid: {
                    x:30,
                    x2:10,
                    y: 30, 
                    y2:30,
                    containLabel: true
                },
                xAxis: {
                    data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
                },
                yAxis: {},
                series: [{
                    name: '访问量',
                    type: 'line',
                    data: [15, 33, 232, 256, 253, 23, 34, 25, 16, 277, 333, 499]
                }, {
                    name: '留言量',
                    type: 'line',
                    data: [5, 20, 36, 10, 10, 20, 4, 5, 6, 77, 33, 99]
                }, {
                    name: '金币',
                    type: 'line',
                    data: [56, 25, 35, 45, 56, 120, 24, 35, 46, 177, 233, 199]
                }, {
                    name: '用户',
                    type: 'line',
                    data: [25, 63, 52, 41, 210, 120, 24, 35, 46, 577, 633, 299]
                }]
            }],
            i = e("#LAY-index-pagetwoA").children("div"),
            n = function(e) { l[e] = a.init(i[e], layui.echartsTheme), l[e].setOption(t[e]), window.onresize = l[e].resize };
        i[0] && n(0)
    }), e("yun", {})
});