package services
{
	import randori.async.Promise;
	import randori.service.AbstractService;
	import randori.webkit.xml.XMLHttpRequest;

	import services.parser.GenericJsonParser;

	/**
	 * Service for getting tasks
	 */
	public class TasksService extends AbstractService
	{
		/**
		 * parses the result
		 */
		private var parser:GenericJsonParser;

		/**
		 * path to the data
		 */
		private var path:String;

		/**
		 * Gets the tasks
		 */
		public function get() : Promise
		{
			var promise:Promise = sendRequest("GET", path);
			var parserPromise:Promise = promise.then(parser.parseResult);

			return parserPromise;
		}

		/**
		 * Constructor
		 */
		public function TasksService(xmlHttpRequest:XMLHttpRequest, parser:GenericJsonParser)
		{
			super(xmlHttpRequest);

			this.parser = parser;
			this.path = "assets/data/tasks.txt";
		}
	}
}