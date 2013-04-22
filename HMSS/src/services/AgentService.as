package services {
	import randori.async.Promise;
	import randori.service.AbstractService;
	import randori.webkit.xml.XMLHttpRequest;

	import services.parser.UserParser;

	/**
	 * Created with IntelliJ IDEA.
	 * User: bschmidtke
	 * Date: 4/19/13
	 * Time: 3:38 PM
	 * To change this template use File | Settings | File Templates.
	 */
	public class AgentService extends AbstractService
	{

		private var parser:UserParser;
		private var path:String;

		public function login( userName:String, password:String ):Promise
		{
			var agentPath:String = this.path + "\/" + userName + "\/" + password + ".txt";
			var promise:Promise = sendRequest("GET", agentPath);
			var parserPromise:Promise = promise.then( parser.parseResult );

			return parserPromise;
		}

		public function AgentService(xmlHttpRequest:XMLHttpRequest, parser:UserParser )
		{
			super(xmlHttpRequest);

			this.parser = parser;
			this.path = "assets/data/login/MI6";
		}
	}
}