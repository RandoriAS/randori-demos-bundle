/** Compiled by the Randori compiler v0.2.4 on Wed May 15 15:38:27 EDT 2013 */

if (typeof contexts == "undefined")
	var contexts = {};

contexts.ExampleContext = function() {
	guice.GuiceModule.call(this);
};

contexts.ExampleContext.prototype.configure = function(binder) {
};

$inherit(contexts.ExampleContext, guice.GuiceModule);

contexts.ExampleContext.className = "contexts.ExampleContext";

contexts.ExampleContext.getClassDependencies = function(t) {
	var p;
	return [];
};

contexts.ExampleContext.injectionPoints = function(t) {
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

