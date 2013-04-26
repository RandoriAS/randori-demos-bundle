package behaviors {
	import randori.behaviors.AbstractBehavior;
	import randori.jquery.Event;
	import randori.jquery.JQuery;

	import services.vo.Gadget;

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
	 * Date: 4/25/13
	 * Time: 4:04 PM
	 * @author Jared Schraub <jschraub@digitalprimates.net>
	 */
	public class GadgetSlideShow extends AbstractBehavior {

		//----------------------------------------------------------------------------
		//
		// Properties
		//
		//----------------------------------------------------------------------------

		//----------------------------------------
		// data
		//----------------------------------------

		[View]
		public var mainSlide:JQuery;
		[View]
		public var imageRow:JQuery;
		[View]
		public var gadgetName:JQuery;
		[View]
		public var gadgetStatus:JQuery;
		[View]
		public var gadgetDescription:JQuery;

		public var activeGadget:Gadget;

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

			// remove the list items that already exist
			imageRow.remove("li");

			// add each new list item
			var item:JQuery
			var totalWidth:Number = 0;
			for (var i:int = 0; i < _data.length; i++) {
				// create the item
				imageRow.append("<li id='gadget" + i + "'><img src='" + _data[i].image + "'/></li>");
				// add a click listener to the item
				item = imageRow.find("#gadget" + i);
				item.click(_data[i], gadgetClicked);

				// total the width of the items
				totalWidth += item.outerWidth(true);
			}
			// set the width of the imageRow to the total width of the items
			imageRow.width(totalWidth);

			// set the active item to the first item in the list
			setActive(_data[0]);
		}

		public function gadgetClicked(event:Event):void {
			if (event == null)
				return;
			setActive(event.data as Gadget);
		}

		public function setActive(gadget:Gadget):void {
			if (activeGadget == gadget)
				return;
			// set the active gadget
			activeGadget = gadget;
			// set the displays of the active gadget
			mainSlide.attr("src", gadget.image);
			gadgetName.html(gadget.name);
			gadgetStatus.html(gadget.status);
			gadgetDescription.html(gadget.description);
		}

		override protected function onRegister():void {

		}

		override protected function onDeregister():void {

		}
	}
}