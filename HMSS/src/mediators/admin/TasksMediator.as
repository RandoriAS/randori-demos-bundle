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
	import behaviors.CreateTaskForm;
	import behaviors.TasksGrid;

	import models.tasks.Task;

	import randori.behaviors.AbstractMediator;
	import randori.jquery.Event;
	import randori.jquery.JQuery;

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
		public var createTaskForm:CreateTaskForm;

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
		override public function initialize():void
		{
			hideNewTaskForm();
			enableAddButton();

			addBtn.click(handleAddClick);
			createTaskForm.formSaved.add(formSaved);
			createTaskForm.formCancelled.add(formCancelled);

			var scopedGrid:TasksGrid = this.grid;

			service.get().then( function(data:Array):void
			{
				scopedGrid.data = data;
			});
		}

		/**
	 	 * @inheritDoc
	 	 */
		override public function destroy():void
		{
			addBtn.off(handleAddClick);
			createTaskForm.formSaved.remove(formSaved);
			createTaskForm.formCancelled.remove(formCancelled);
		}

		/**
		 * when user wants to add task, disable add button and show the
		 * form for adding.
		 */
		private function handleAddClick(event:Event) : void
		{
			showNewTaskForm();
			disableAddButton();
		}

		/**
		 * user is saving form data
		 */
		private function formSaved(task:Task) : void
		{
			enableAddButton();
			hideNewTaskForm();

			var scopedGrid:TasksGrid = this.grid;

			service.create(task).then( function(data:Array):void
			{
				scopedGrid.data = data;
			});
		}

		/**
		 * user has cancelled add task, hide the form
		 */
		private function formCancelled() : void
		{
			enableAddButton();
			hideNewTaskForm();
		}

		/**
		 * the user has clicked the Add button, show the form
		 */
		private function showNewTaskForm() : void
		{
			createTaskForm.clearForm();
			createTaskForm.show();
		}

		/**
		 * hide the form and controls for adding a task, such as after one has
		 * been added and we're waiting for user to click the Add button again
		 */
		private function hideNewTaskForm() : void
		{
			createTaskForm.hide();
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