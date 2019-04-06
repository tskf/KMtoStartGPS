using Toybox.Application;
using Toybox.Activity;
using Toybox.WatchUi;
using Toybox.Math;

class Start extends Application.AppBase
{ function getInitialView() {return [new DataField()];} }

class DataField extends WatchUi.DataField
{ function initialize() {DataField.initialize(); }

    var s,g="", c=0, x,y,bg,fg;

    function d(t1, n1, t2, n2) {
        return 12742*Math.asin(Math.sqrt(0.5-Math.cos(t2-t1)/2+Math.cos(t1)*Math.cos(t2)*(1-Math.cos(n2-n1))/2)); }

    function onUpdate(dc)
    { c++; if(c>10) { c=0;
        var info = Activity.getActivityInfo();
        if (info.startLocation!=null && info.currentLocation!=null)
        {
            if (s==null) {s = info.startLocation.toRadians();}
            g = info.currentLocation.toRadians();
            g = d(s[0],s[1], g[0],g[1]).format("%.2f");
        }
    } dc.setColor(fg,bg); dc.drawText(x,y,6,  g,  5); }

    function onLayout(dc) {
        x = dc.getWidth()/2;
        y = dc.getHeight()/2;
        bg = getBackgroundColor();
        fg = bg ^ 0xFFFFFF; }
}