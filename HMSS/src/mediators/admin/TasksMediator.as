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
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */

package mediators.admin
{
	import behaviors.TasksGrid;

	import models.tasks.Task;

	import randori.behaviors.AbstractMediator;
	import randori.jquery.Event;
	import randori.jquery.JQuery;
	import randori.jquery.JQueryStatic;

	import services.TasksService;

	/**
	 * Mediator for the view showing the tasklist
	 */
	public class TasksMediator extends AbstractMediator
	{
		//----------------------------------------------------------------------------
		//
		// Consts
		//
		//----------------------------------------------------------------------------

		/**
		 * how quickly the add button fades in/out when enabled/disabled
		 */
		protected static const ADD_BUTTON_FADE_DURATION:int = 40;

		//----------------------------------------------------------------------------
		//
		// View elements
		//
		//----------------------------------------------------------------------------

		[View]
		public var grid:TasksGrid;

		[View]
		public var addBtn:JQuery;

		[View]
		public var newTaskForm:JQuery;

		[View]
		public var taskName:JQuery;

		[View]
		public var agent:JQuery;

		[View]
		public var priorityHigh:JQuery;

		[View]
		public var priorityMedium:JQuery;

		[View]
		public var priorityLow:JQuery;

		[View]
		public var saveBtn:JQuery;

		[View]
		public var cancelBtn:JQuery;

		//----------------------------------------------------------------------------
		//
		// Variables
		//
		//----------------------------------------------------------------------------

		/**
		 * service for getting tasks
		 */
		private var service:TasksService;

		//----------------------------------------------------------------------------
		//
		// Methods
		//
		//----------------------------------------------------------------------------

		/**
		 * @inheritDoc
		 */
		override protected function onRegister():void
		{
			hideControlsForAddingTask();
			enableAddButton();

			addBtn.click(handleAddClick);
			saveBtn.click(handleSaveClick);
			cancelBtn.click(handleCancelClick);

			var scopedGrid:TasksGrid = this.grid;

			service.get().then( function(data:Array):void
			{
				scopedGrid.data = data;
			});
		}

		/**
	 	 * @inheritDoc
	 	 */
		override protected function onDeregister():void
		{
			addBtn.off(handleAddClick);
			saveBtn.off(handleSaveClick);
			cancelBtn.off(handleCancelClick);
		}

		/**
		 * when user wants to add task, disable add button and show the
		 * form for adding.
		 */
		private function handleAddClick(event:Event) : void
		{
			showControlsForAddingTask();
			disableAddButton();
		}

		/**
		 * read form variables and create task object
		 */
		private function getTaskFromForm() : Task
		{
			var task:Task = new Task();

			task.taskName = taskName.val();
			task.assignedId = agent.val();
			task.priority = JQueryStatic.J("input[name=priority]:checked").val();

			return task;
		}

		/**
		 * user is saving form data
		 */
		private function handleSaveClick(event:Event) : void
		{
			var task:Task = getTaskFromForm();

			enableAddButton();
			hideControlsForAddingTask();

			var scopedGrid:TasksGrid = this.grid;

			service.create(task).then( function(data:Array):void
			{
				scopedGrid.data = data;
			});
		}

		/**
		 * user has cancelled add task, hide the form
		 */
		private function handleCancelClick(event:Event) : void
		{
			enableAddButton();
			hideControlsForAddingTask();
		}

		/**
		 * reset form to default values
		 */
		private function clearForm() : void
		{
			taskName.val("");
			agent.val("");
		}

		/**
		 * the user has clicked the Add button, show the form
		 */
		private function showControlsForAddingTask() : void
		{
			clearForm();

			newTaskForm.show();
			saveBtn.show();
			cancelBtn.show();
		}

		/**
		 * hide the form and controls for adding a task, such as after one has
		 * been added and we're waiting for user to click the Add button again
		 */
		private function hideControlsForAddingTask() : void
		{
			newTaskForm.hide();
			saveBtn.hide();
			cancelBtn.hide();
		}

		/**
		 * make the Add button look enabled
		 */
		private function enableAddButton() : void
		{
			addBtn.fadeTo(ADD_BUTTON_FADE_DURATION, 1);
		}

		/**
		 * make the Add button look disabled
		 */
		private function disableAddButton() : void
		{
			addBtn.fadeTo(ADD_BUTTON_FADE_DURATION, .25);
		}

		/**
		 * Constructor
		 */
		public function TasksMediator(service:TasksService)
		{
			super();

			this.service = service;
		}
	}
}