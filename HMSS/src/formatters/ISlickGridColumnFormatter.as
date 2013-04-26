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
 * Time: 4:06 PM
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */
package formatters
{
	/**
	 * Interface for formatters for slick grid columns
	 */
	public interface ISlickGridColumnFormatter
	{
		/**
		 * Called when the grid needs to format the column.
		 *
		 * @param row			the row number
		 * @param cell			the column number
		 * @param value			the value of the cell from the data
		 * @param columnDef		the definition of the column
		 * @param dataContext	the data for the entire row
		 *
		 * @return a string value representing the cell contents. can be an html fragment.
		 */
		function format(row:int, cell:int, value:*, columnDef:Object, dataContext:Object) : String;
	}
}