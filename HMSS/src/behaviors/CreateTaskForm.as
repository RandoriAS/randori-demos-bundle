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
 * Date: 4/24/13
 * Time: 12:33 PM
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */
package behaviors
{
	import models.tasks.Task;

	import randori.behaviors.AbstractBehavior;
	import randori.jquery.Event;
	import randori.jquery.JQuery;
	import randori.jquery.JQueryStatic;
	import randori.signal.SimpleSignal;

	/**
	 * form for adding a task to the tasks grid
	 */
	public class CreateTaskForm extends AbstractBehavior
	{
		//----------------------------------------------------------------------------
		//
		// View elements
		//
		//----------------------------------------------------------------------------

		 [View]
		 public var taskDetails:JQuery;

		 [View]
		 public var taskName:JQuery;

		 [View]
		 public var agent:JQuery;

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
		 * dispatched when the user saves, dispatches a Task
		 */
		public var formSaved:SimpleSignal;

		/**
		 * dispatched when the user cancels
		 */
		public var formCancelled:SimpleSignal;

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
			saveBtn.click(handleSaveClick);
			cancelBtn.click(handleCancelClick);
		}

		/**
		 * @inheritDoc
		 */
		override public function destroy():void
		{
			saveBtn.off(handleSaveClick);
			cancelBtn.off(handleCancelClick);
		}

		/**
		 * reset form to default values
		 */
		public function clearForm() : void
		{
			taskName.val("");
			agent.val("");
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

			if (task)
			{
				formSaved.dispatch(task);
			}
		}

		/**
		 * user has cancelled add task, hide the form
		 */
		private function handleCancelClick(event:Event) : void
		{
			formCancelled.dispatch();
		}

		/**
		 * Constructor
		 */
		public function CreateTaskForm()
		{
			formSaved = new SimpleSignal();
			formCancelled = new SimpleSignal();
		}
	}
}