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
package mediators {
import behaviors.SiteHeader;
import behaviors.VerticalTabs;
import behaviors.tabs.MenuItem;

import eventBus.HMSSBus;

import models.AppModel;
import models.user.User;

import randori.async.Promise;
import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;

import services.MenuService;
import services.vo.Target;

public class IndexMediator extends AbstractMediator {

		[View(required="true")]
		public var header:SiteHeader;

		[View(required="true")] 
		public var viewStack:ViewStack;
		
		[View(required="true")]
		public var menu:VerticalTabs;

        [Inject]
        public var bus:HMSSBus;

		[Inject]
		public var appModel:AppModel;

		[Inject]
		public var menuService:MenuService;

        override public function initialize():void
		{

			bus.userChanged.add( currentUser_changeHandler );

			if( appModel.currentUser == null )
			{
				promptLogin();
			}
			else
			{
				loadUserMenu( appModel.currentUser );
			}
		}

		protected function loadUserMenu( usr:User ):void
		{
			if( usr )
			{
				var menuPromise:Promise = menuService.get( usr.role );
				menuPromise.then( menuLoadSuccessfully, menuLoadFailure )
			}
			else
			{
				throw new Error("No User Passed In.")
			}
		}

		protected function menuLoadSuccessfully( results:Array ) :void
		{
			initializeMenu( results );
		}

		protected function menuLoadFailure( reason:String ):void
		{

		}

		protected function initializeMenu( menuItems:Array ):void
		{
			menu.menuItemSelected.add( menuItemSelected );
			menu.data = menuItems;

			bus.targetSelected.add( handleTargetSelected );
			bus.targetClose.add( handleCloseTargetDetail );
			bus.showTargetLocation.add( handleShowTargetLocation );
		}

		protected function promptLogin():void
		{
			viewStack.pushView( "views/login/login.html");

			bus.loginSuccess.add( handleLoginSuccess );
		}

		protected function handleLoginSuccess( usr:User ):void
		{
			appModel.currentUser = usr;

			viewStack.popView();

			loadUserMenu( appModel.currentUser );
		}

		protected function currentUser_changeHandler( usr:User ):void
		{
			header.showUser( usr );
		}

        private function handleShowTargetLocation( target:Target ):void {
            var promise:Promise = viewStack.pushView( "views/target/targetLocation.html");
            promise.then( function( result:AbstractMediator ):void {
                //do something here with the new view if you want
                result.setViewData( target );
            } );
        }

        private function handleCloseTargetDetail():void {
            viewStack.popView();
        }

        private function handleTargetSelected( target:Target ):void {
            var promise:Promise = viewStack.pushView( "views/target/targetDetail.html");
            promise.then( function( result:AbstractMediator ):void {
                //do something here with the new view if you want
                result.setViewData( target );
            } );
        }

        private function menuItemSelected( menuData:MenuItem ):void  {

			if( viewStack.hasView( menuData.url ) )
			{
				  return;
			}

            //We want to pop all views: This code is strange due to a compiler bug
            //TODO: Update this after latest compiler is tested
            for ( var i:int=0;i<50; i++ ) {
                var url:String = viewStack.currentViewUrl;

                if ( url ) {
                    viewStack.popView();
                } else {
                    break;
                }

            }

			viewStack.popView();
			var promise:Promise = viewStack.pushView(menuData.url);
			
			promise.then( function( result:AbstractMediator ):void {
				//do something here with the new view if you want
			} );
		}
		
		public function IndexMediator()
		{
			super();
		}
	}
}