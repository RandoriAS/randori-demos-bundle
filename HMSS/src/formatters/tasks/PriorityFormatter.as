/***
 * Copyright 2013 LTN Consulting, Inc. /dba Digital Primates®
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Created with IntelliJ IDEA.
 * Date: 4/22/13
 * Time: 12:36 PM
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */
package formatters.tasks
{
	import formatters.ISlickGridColumnFormatter;

	/**
	 * Formatter for priority column of the tasks grid.
	 */
	public class PriorityFormatter implements ISlickGridColumnFormatter
	{
		/**
		 * @inheritDoc
		 */
		public function format(row:int, cell:int, value:*, columnDef:Object, dataContext:Object) : String
		{
			var valueStr:String = value as String;

			if (!valueStr)
				return "";

			var fragment:String = "";

			switch (valueStr)
			{
				case "high":
					fragment = "<img src='assets/images/tasks/priority/priority_high.png'>";
					break;
				case "medium":
					fragment = "<img src='assets/images/tasks/priority/priority_medium.png'>";
					break;
				case "low":
					fragment = "<img src='assets/images/tasks/priority/priority_low.png'>";
					break;
			}

			return fragment;
		}

		/**
		 * Constructor
		 */
		public function PriorityFormatter()
		{
		}
	}
}