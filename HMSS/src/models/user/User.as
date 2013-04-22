package models.user {

	/**
	 * Created with IntelliJ IDEA.
	 * User: bschmidtke
	 * Date: 4/19/13
	 * Time: 1:40 PM
	 * To change this template use File | Settings | File Templates.
	 */
	[JavaScript(export="false")]
	public class User {


		private var _firstName:String;
		private var _lastName:String;
		private var _codeName:String;
		private var _role:String;

		public function User() {
		}

		public function get firstName():String
		{
			return _firstName;
		}

		public function set firstName( value:String ):void
		{
			_firstName = value;
		}

		public function get lastName():String
		{
			return _lastName;
		}

		public function set lastName( value:String ):void
		{
			_lastName = value;
		}

		public function get codeName():String
		{
			return _codeName;
		}

		public function set codeName( value:String ):void
		{
			_codeName = value;
		}

		public function get role():String
		{
			return _role;
		}

		public function set role( value:String ):void
		{
			_role = value;
		}
	}
}