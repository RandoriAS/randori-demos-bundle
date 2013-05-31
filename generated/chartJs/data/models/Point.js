/** Compiled by the Randori compiler v0.2.4 on Fri May 31 16:59:54 CEST 2013 */

if (typeof chartJs == "undefined")
	var chartJs = {};
if (typeof chartJs.data == "undefined")
	chartJs.data = {};
if (typeof chartJs.data.models == "undefined")
	chartJs.data.models = {};

chartJs.data.models.Point = function(value, color) {
	if (arguments.length < 2) {
		color = "#000000";
	}
	this.value = value;
	this.color = color;
};

chartJs.data.models.Point.className = "chartJs.data.models.Point";

chartJs.data.models.Point.getClassDependencies = function(t) {
	var p;
	return [];
};

chartJs.data.models.Point.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 0:
			p = [];
			p.push({n:'value', t:'Number'});
			p.push({n:'color', t:'String'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

