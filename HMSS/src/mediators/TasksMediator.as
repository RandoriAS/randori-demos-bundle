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
 * @author Steve Zimmers <szimmers@digitalprimates.net>
 */

package mediators
{
	import behaviors.TasksGrid;

	import randori.behaviors.AbstractMediator;

	import services.TasksService;

	/**
	 * Mediator for the view showing the tasklist
	 */
	public class TasksMediator extends AbstractMediator
	{
		//----------------------------------------------------------------------------
		//
		// View elements
		//
		//----------------------------------------------------------------------------

		[View]
		public var grid:TasksGrid;

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