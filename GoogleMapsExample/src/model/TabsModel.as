package model {
import behaviors.tabs.MenuItem;

import commands.signals.INewTipsArrived;
import commands.signals.ITabsModelUpdated;
import commands.signals.ITipsModelUpdated;

import services.vo.Tip;

public class TabsModel {

	[Inject]
	public var tabsModelUpdated:ITabsModelUpdated;

	public var currentTab:MenuItem;
	public var _allTabs:Array;

	public function get allTabs():Array {
		return _allTabs;
	}

	public function set allTabs( value:Array ):void {
		_allTabs = value;
		tabsModelUpdated.dispatch( value );
	}
}
}