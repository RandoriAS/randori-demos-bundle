/** Compiled by the Randori compiler v0.2.4 on Wed May 15 15:36:24 EDT 2013 */


ExampleContext = function() {
	guice.GuiceModule.call(this);
};

ExampleContext.prototype.configure = function(binder) {
};

$inherit(ExampleContext, guice.GuiceModule);

ExampleContext.className = "ExampleContext";

ExampleContext.getClassDependencies = function(t) {
	var p;
	return [];
};

ExampleContext.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = guice.GuiceModule.injectionPoints(t);
			break;
		case 2:
			p = guice.GuiceModule.injectionPoints(t);
			break;
		case 3:
			p = guice.GuiceModule.injectionPoints(t);
			break;
		default:
			p = [];
			break;
	}
	return p;
};

