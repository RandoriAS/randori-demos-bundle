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
 *
 * @author Michael Labriola <labriola@digitalprimates.net>
 */

package behaviors
{
	import Slick.Column;
	import Slick.Grid;
	import Slick.Options;

	import formatters.tasks.PriorityFormatter;

	import randori.behaviors.AbstractBehavior;

	/**
	 * The grid for the tasklist
	 */
	public class TasksGrid extends AbstractBehavior
	{
		//----------------------------------------------------------------------------
		//
		// Properties
		//
		//----------------------------------------------------------------------------

		//----------------------------------------
		// data
		//----------------------------------------

		/**
		 * @private
		 */
		private var _data:Array;

		/**
		 * the grid updates when data is written to this property
		 */
		public function get data() : Array
		{
			return _data;
		}

		/**
		 * @private
		 */
		public function set data(value:Array) : void
		{
			if (_data == value)
				return;

			_data = value;

			applyDataToGrid(_data);
		}

		//----------------------------------------------------------------------------
		//
		// Variables
		//
		//----------------------------------------------------------------------------

		/**
		 * the slick grid
		 */
		public var grid:Grid;

		/**
		 * we initialize the grid ourselves, but we want to do so only once
		 */
		private var gridInitialized:Boolean = false;

		/**
		 * formatter for the priority column
		 */
		private var priorityFormatter:PriorityFormatter;

		//----------------------------------------------------------------------------
		//
		// Methods
		//
		//----------------------------------------------------------------------------

		/**
		 * @inheritDoc
		 */
		override public function initialize():void	{
			setupGrid();
		}

		/**
		 * @inheritDoc
		 */
		override public function destroy():void {
			grid.destroy();
		}

		/**
		 * when we get data, give it to the grid
		 */
		private function applyDataToGrid(data:Array) : void
		{
			grid.setData(data);
			grid.render();

			if (!gridInitialized)
			{
				grid.init();
				gridInitialized = true;
			}
		}

		/**
		 * define the columns and create the grid, but do not initialize it until
		 * we get data
		 */
		private function setupGrid() : void
		{
			var taskNameColumn:Column = new Column("taskNameColumn", "Task", "taskName");
			var assignedAgentColumn:Column = new Column("assignedColumn", "Agent Assigned", "assignedId" );
			var priorityColumn:Column = new Column("priorityColumn", "Priority", "priority", this.priorityFormatter.format);

			var columns:Array = [taskNameColumn, assignedAgentColumn, priorityColumn];

			var options:Options = new Options();

			options.enableCellNavigation = true;
			options.enableColumnReorder = false;
			options.autoHeight = true;
			options.forceFitColumns = true;
			options.explicitInitialization = true;

			var data:Array = [];
			grid = new Grid(decoratedNode, data, columns, options);
		}

		/**
		 * Constructor
		 */
		public function TasksGrid(priorityFormatter:PriorityFormatter)
		{
			this.priorityFormatter = priorityFormatter;
		}
	}
}