package services.parser {
	import models.user.User;

	import randori.service.parser.AbstractParser;

	/**
	 * Created with IntelliJ IDEA.
	 * User: bschmidtke
	 * Date: 4/19/13
	 * Time: 4:38 PM
	 * To change this template use File | Settings | File Templates.
	 */
	public class UserParser extends AbstractParser {

		public function parseResult(result:Object):User {
			//Here we are just going to parse the result into Json.
			//We are adding some extra data just to show the concept that transforming here is totally allowed and legit
			var json:Object = JSON.parse( result as String );

			return json as User;
		}

		public function UserParser()
		{
			super();
		}
	}
}