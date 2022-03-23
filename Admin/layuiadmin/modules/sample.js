/** layuiAdmin.std-v1.4.0 LPPL License By https://www.layui.com/admin/ */ ;
layui.define(function(e) {
    var a = layui.admin;
    layui.use(["admin", "carousel"], function() {
        var e = layui.$,
            a = (layui.admin, layui.carousel),
            l = layui.element,
            t = layui.device();
        e(".layadmin-carousel").each(function() {
            var l = e(this);
            a.render({ elem: this, width: "100%", arrow: "none", interval: l.data("interval"), autoplay: l.data("autoplay") === !0, trigger: t.ios || t.android ? "click" : "hover", anim: l.data("anim") })
        }), l.render("progress")
    }),
    layui.use("table", function() {
        var e = (layui.$, layui.table);
        e.render({
            elem: "#LAY-index-prograss",
            url: layui.setter.base + "json/console/prograss.js",
            cols: [
                [{ field: "prograss", title: "任务" }, { field: "time", title: "所需时间" }, { field: "complete", title: "完成情况", templet: function(e) { return "已完成" == e.complete ? '<del style="color: #5FB878;">' + e.complete + "</del>" : "进行中" == e.complete ? '<span style="color: #FFB800;">' + e.complete + "</span>" : '<span style="color: #FF5722;">' + e.complete + "</span>" } }]
            ],
            skin: "line"
        })
    }), a.events.replyNote = function(e) {
        var a = e.data("id");
        layer.prompt({ title: "回复留言 ID:" + a, formType: 2 }, function(e, a) { layer.msg("得到：" + e), layer.close(a) })
    }, e("sample", {})
});


