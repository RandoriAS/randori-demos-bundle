package mediators {

import chartJs.Chart;
import chartJs.data.ChartData;
import chartJs.data.models.Point;
import chartJs.data.models.Trend;
import chartJs.easing.Easing;
import chartJs.options.*;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.webkit.html.canvas.CanvasRenderingContext2D;
import randori.webkit.page.Window;

public class IndexMediator extends AbstractMediator {

    [View] public var line:JQuery;
    [View] public var bar:JQuery;
    [View] public var radar:JQuery;
    [View] public var polar:JQuery;
    [View] public var pie:JQuery;
    [View] public var doughnut:JQuery;

    override protected function onRegister():void {
        Window.console.log("chart1");
        createLineChart( line );
        createBarChart( bar );
        createRadarChart( radar );
        createPolarAreaChart( polar );
        createPieChart( pie );
        createDougnutChart( doughnut );
    }

    private function createLineChart( canvas:JQuery ):void {

        var line1:Trend = new Trend()
        line1.data = [65,59,90,81,56,55,40];
        Window.console.log(line1);

        var line2:Trend = new Trend();
        line2.fillColor = "rgba(151,187,205,0.5)";
        line2.strokeColor = "rgba(151,187,205,1)";
        line2.pointColor = "rgba(151,187,205,1)";
        line2.pointStrokeColor = "#fff";
        line2.data = [28,48,40,19,96,27,100];

        var chartData:ChartData = new ChartData();
        chartData.datasets = [line1,line2];
        chartData.labels = ["January","February","March","April","May","June","July"];

        var lineOptions:LineOptions = new LineOptions();
        lineOptions.scaleLineColor = "rgba(0,0,0,.2)";
        lineOptions.scaleLineWidth = 3;
        lineOptions.animationEasing = Easing.EASE_IN_EXPO;



        var chart:Chart = createChart( canvas );

        chart.Line( chartData, lineOptions );
    }

    private function createBarChart( canvas:JQuery ):void {
        var bar1:Trend = new Trend()
        bar1.data = [65,59,90,81,56,55,40];

        var bar2:Trend = new Trend();
        bar2.fillColor = "rgba(151,187,205,0.5)";
        bar2.strokeColor = "rgba(151,187,205,1)";
        bar2.data = [28,48,40,19,96,27,100];

        var chartData:ChartData = new ChartData();
        chartData.datasets = [bar1,bar2];
        chartData.labels = ["January","February","March","April","May","June","July"];

        var barOptions:BarOptions = new BarOptions();
        barOptions.scaleLineColor = "rgba(0,0,0,.2)";
        var chart:Chart = createChart( canvas );
        chart.Bar( chartData, barOptions );
    }
    private function createRadarChart( canvas:JQuery ):void {
        var line1:Trend = new Trend();
        line1.fillColor = "rgba(220,220,220,0.5)";
        line1.strokeColor = "rgba(220,220,220,1)";
        line1.pointColor = "rgba(220,220,220,1)";
        line1.pointStrokeColor = "#fff";
        line1.data = [65,59,90,81,56,55,40];

        var line2:Trend = new Trend();
        line2.fillColor = "rgba(151,187,205,0.5)";
        line2.strokeColor = "rgba(151,187,205,1)";
        line2.pointColor = "rgba(151,187,205,1)";
        line2.pointStrokeColor = "#fff";
        line2.data = [28,48,40,19,96,27,100];

        var chartData:ChartData = new ChartData();
        chartData.datasets = [line1,line2];
        chartData.labels = ["Eating","Drinking","Sleeping","Designing","Coding","Partying","Running"];

        var radarOptions:RadarOptions = new RadarOptions();

        var chart:Chart = createChart( canvas );
        chart.Radar( chartData, radarOptions );
    }

    private function createPolarAreaChart( canvas:JQuery ):void{
        var data:Array = [
            new Point( 30, "#D97041" ),
            new Point( 90, "#C7604C" ),
            new Point( 24, "#21323D" ),
            new Point( 58, "#9D9B7F" ),
            new Point( 82, "#7D4F6D" ),
            new Point( 8, "#584A5E" ),
        ];

        var polarOptions:PolarAreaOptions = new PolarAreaOptions();
        var chart:Chart = createChart( canvas );
        chart.PolarArea( data, polarOptions );

    }
    private function createPieChart( canvas:JQuery ):void{
        var data:Array = [
            new Point( 30, "#D97041" ),
            new Point( 50, "#E0E4CC" ),
            new Point( 100, "#69D2E7" ),
        ];

        var pieOptions:PieOptions = new PieOptions();
        var chart:Chart = createChart( canvas );
        chart.Pie( data, pieOptions );

    }
    private function createDougnutChart( canvas:JQuery ):void{
        var data:Array = [
            new Point( 30, "#D97041" ),
            new Point( 50, "#C7604C" ),
            new Point( 100, "#21323D" ),
            new Point( 40, "#9D9B7F" ),
            new Point( 120, "#7D4F6D" ),
        ];

        var doughnutOptions:DoughnutOptions = new DoughnutOptions();
        var chart:Chart = createChart( canvas );
        chart.Doughnut( data, doughnutOptions );

    }

    private function createChart( canvas:JQuery ):Chart{
        var ctx:CanvasRenderingContext2D = canvas["context"].getContext("2d");
        return new Chart( ctx );
    }

    override protected function onDeregister():void {

    }

}
}