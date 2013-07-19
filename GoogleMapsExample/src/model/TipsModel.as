package model {
import commands.signals.INewTipsArrived;
import commands.signals.ITipsModelUpdated;

import services.vo.Tip;

public class TipsModel {

	[Inject]
	public var tipsModelUpdated:ITipsModelUpdated;

	public var currentTip:Tip;
	public var _allTips:Array;

	public function get allTips():Array {
		return _allTips;
	}

	public function set allTips( value:Array ):void {
		_allTips = value;
		tipsModelUpdated.dispatch( value );
	}
}
}