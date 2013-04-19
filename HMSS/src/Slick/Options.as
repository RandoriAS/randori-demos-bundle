package Slick {

	/**
	 * Created with IntelliJ IDEA.
	 * User: mlabriola
	 * Date: 4/18/13
	 * Time: 11:13 AM
	 * To change this template use File | Settings | File Templates.
	 */
	[JavaScript(export="false",name="Object",mode="json")]
	public class Options {

		/**
		 * @default false
		 */
		public var autoHeight:Boolean;

		/**
		 * Appears to enable cell virtualisation for optimised speed with large datasets
		 *
		 * @default true
		 */
		public var enableCellNavigation:Boolean;

		/**
		 * @default true
		 *
		 * @requires jquery-ui.sortable
		 */
		public var enableColumnReorder:Boolean;

		/**
		 * c.f. http://mleibman.github.io/SlickGrid/examples/example-explicit-initialization.html
		 * @default false
		 */
		public var explicitInitialization:Boolean;

		/**
		 * Force column sizes to fit into the container (preventing horizontal scrolling). Effectively sets column width to be 1/Number of Columns which on small containers may not be desirable.
		 *
		 * @default false
		 */
		public var forceFitColumns:Boolean;

		/**
		 * Constructor
		 */
		public function Options() {
		}
	}
}