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
 * Date: 4/23/13
 * Time: 5:24 PM
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */
package models.tasks
{
	[JavaScript(export="false", name="Object", mode="json")]
	public class Task
	{
		public var taskName:String;
		public var assignedId:String;
		public var priority:String;
	}
}