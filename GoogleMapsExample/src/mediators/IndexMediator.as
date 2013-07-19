/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/12/13
 * Time: 9:54 AM
 * To change this template use File | Settings | File Templates.
 */
package mediators {
import behaviors.HorizontalTabs;
import behaviors.TipMap;
import behaviors.tabs.MenuItem;

import commands.signals.ITabsModelUpdated;
import commands.signals.ITipsModelUpdated;

import model.TabsModel;

import model.TipsModel;

import randori.async.Promise;
import randori.behaviors.AbstractBehavior;
import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;

import robotlegs.flexo.context.IContextInitialized;

import services.vo.Tip;

import commands.signals.INavigationRequest;
import commands.signals.ITipSelected;

public class IndexMediator extends AbstractMediator {

	[View(required="true")]
	public var viewStack:ViewStack;

	[View(required="true")]
	public var menu:HorizontalTabs;

	[View]
	public var map:TipMap;

	[Inject]
	public var navigationRequest:INavigationRequest;

	[Inject]
	public var tipSelected:ITipSelected;

	[Inject]
	public var contextInitialized:IContextInitialized;

	[Inject]
	public var tipsModel:TipsModel;

	[Inject]
	public var tabsModel:TabsModel;

	[Inject]
	public var tipsModelUpdated:ITipsModelUpdated;

	[Inject]
	public var tabsModelUpdated:ITabsModelUpdated;

	private var selectedMenuItem:MenuItem;

	override public function initialize():void {
		navigationRequest.add( handleNavigationRequest );
		tipSelected.add( tipSelectedHandler );

		tipsModelUpdated.add( provideMapWithData );
		tabsModelUpdated.add( provideMenuWithData );

		menu.menuItemSelected.add( menuItemSelected );
	}

	private function provideMenuWithData( items:Array ):void {
		menu.data = items;
	}

	private function handleNavigationRequest( navto:String ):void {
		if( navto == "tips"){
			menu.selectedIndex = 1;
		}
	}

	private function menuItemSelected( menuData:MenuItem ):void {
		viewStack.popView();

		selectedMenuItem = menuData;

		var promise:Promise = viewStack.pushView(menuData.url);

		promise.then( promiseResult );
	}

	private function promiseResult( result:AbstractMediator ):void{
		if(selectedMenuItem.name == "How it works"){
			resetMap();
		}
	}

	private function provideMapWithData( locations:Array ):void{
		map.showLocations( locations );
	}

	private function resetMap():void{
		map.resetMap();
	}

	private function tipSelectedHandler( tip:Tip):void{
		map.showTip( tip );
	}
}
}