/** Compiled by the Randori compiler v0.2.4 on Fri May 31 16:59:54 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};

mediators.IndexMediator = function() {
	this.polar = null;
	this.doughnut = null;
	this.line = null;
	this.radar = null;
	this.pie = null;
	this.bar = null;
	randori.behaviors.AbstractMediator.call(this);
	
};

mediators.IndexMediator.prototype.onRegister = function() {
	console.log("chart1");
	this.createLineChart(this.line);
	this.createBarChart(this.bar);
	this.createRadarChart(this.radar);
	this.createPolarAreaChart(this.polar);
	this.createPieChart(this.pie);
	this.createDougnutChart(this.doughnut);
};

mediators.IndexMediator.prototype.createLineChart = function(canvas) {
	var line1 = new Object();
	line1.data = [65, 59, 90, 81, 56, 55, 40];
	console.log(line1);
	var line2 = new Object();
	line2.fillColor = "rgba(151,187,205,0.5)";
	line2.strokeColor = "rgba(151,187,205,1)";
	line2.pointColor = "rgba(151,187,205,1)";
	line2.pointStrokeColor = "#fff";
	line2.data = [28, 48, 40, 19, 96, 27, 100];
	var chartData = new Object();
	chartData.datasets = [line1, line2];
	chartData.labels = ["January", "February", "March", "April", "May", "June", "July"];
	var lineOptions = new Object();
	lineOptions.scaleLineColor = "rgba(0,0,0,.2)";
	lineOptions.scaleLineWidth = 3;
	lineOptions.animationEasing = "easeInExpo";
	var chart = this.createChart(canvas);
	chart.Line(chartData, lineOptions);
};

mediators.IndexMediator.prototype.createBarChart = function(canvas) {
	var bar1 = new Object();
	bar1.data = [65, 59, 90, 81, 56, 55, 40];
	var bar2 = new Object();
	bar2.fillColor = "rgba(151,187,205,0.5)";
	bar2.strokeColor = "rgba(151,187,205,1)";
	bar2.data = [28, 48, 40, 19, 96, 27, 100];
	var chartData = new Object();
	chartData.datasets = [bar1, bar2];
	chartData.labels = ["January", "February", "March", "April", "May", "June", "July"];
	var barOptions = new Object();
	barOptions.scaleLineColor = "rgba(0,0,0,.2)";
	var chart = this.createChart(canvas);
	chart.Bar(chartData, barOptions);
};

mediators.IndexMediator.prototype.createRadarChart = function(canvas) {
	var line1 = new Object();
	line1.fillColor = "rgba(220,220,220,0.5)";
	line1.strokeColor = "rgba(220,220,220,1)";
	line1.pointColor = "rgba(220,220,220,1)";
	line1.pointStrokeColor = "#fff";
	line1.data = [65, 59, 90, 81, 56, 55, 40];
	var line2 = new Object();
	line2.fillColor = "rgba(151,187,205,0.5)";
	line2.strokeColor = "rgba(151,187,205,1)";
	line2.pointColor = "rgba(151,187,205,1)";
	line2.pointStrokeColor = "#fff";
	line2.data = [28, 48, 40, 19, 96, 27, 100];
	var chartData = new Object();
	chartData.datasets = [line1, line2];
	chartData.labels = ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Partying", "Running"];
	var radarOptions = new Object();
	var chart = this.createChart(canvas);
	chart.Radar(chartData, radarOptions);
};

mediators.IndexMediator.prototype.createPolarAreaChart = function(canvas) {
	var data = [new chartJs.data.models.Point(30, "#D97041"), new chartJs.data.models.Point(90, "#C7604C"), new chartJs.data.models.Point(24, "#21323D"), new chartJs.data.models.Point(58, "#9D9B7F"), new chartJs.data.models.Point(82, "#7D4F6D"), new chartJs.data.models.Point(8, "#584A5E")];
	var polarOptions = new Object();
	var chart = this.createChart(canvas);
	chart.PolarArea(data, polarOptions);
};

mediators.IndexMediator.prototype.createPieChart = function(canvas) {
	var data = [new chartJs.data.models.Point(30, "#D97041"), new chartJs.data.models.Point(50, "#E0E4CC"), new chartJs.data.models.Point(100, "#69D2E7")];
	var pieOptions = new Object();
	var chart = this.createChart(canvas);
	chart.Pie(data, pieOptions);
};

mediators.IndexMediator.prototype.createDougnutChart = function(canvas) {
	var data = [new chartJs.data.models.Point(30, "#D97041"), new chartJs.data.models.Point(50, "#C7604C"), new chartJs.data.models.Point(100, "#21323D"), new chartJs.data.models.Point(40, "#9D9B7F"), new chartJs.data.models.Point(120, "#7D4F6D")];
	var doughnutOptions = new Object();
	var chart = this.createChart(canvas);
	chart.Doughnut(data, doughnutOptions);
};

mediators.IndexMediator.prototype.createChart = function(canvas) {
	var ctx = canvas["context"].getContext("2d");
	return new Chart(ctx);
};

mediators.IndexMediator.prototype.onDeregister = function() {
};

$inherit(mediators.IndexMediator, randori.behaviors.AbstractMediator);

mediators.IndexMediator.className = "mediators.IndexMediator";

mediators.IndexMediator.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('chartJs.data.models.Point');
	return p;
};

mediators.IndexMediator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 2:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'line'});
			p.push({n:'bar'});
			p.push({n:'radar'});
			p.push({n:'polar'});
			p.push({n:'pie'});
			p.push({n:'doughnut'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

