package mediators {
import commands.signals.ITipSelected;

import eventbus.AppEventsBus;

import model.TipsModel;

import randori.behaviors.AbstractMediator;
import randori.behaviors.List;
import randori.webkit.page.Window;

import services.TipsService;
import services.vo.Tip;

/**
 * Created with IntelliJ IDEA.
 * User: leifwells
 * Date: 4/21/13
 * Time: 4:19 PM
 * To change this template use File | Settings | File Templates.
 */

public class TipsMediator extends AbstractMediator {

	[View]
	public var tipsList:List;

	[Inject]
	public var tipsModel:TipsModel;

	[Inject]
	public var tipSelected:ITipSelected;

	override public function initialize():void {
		tipsList.listChanged.add( handleTipSelected );
		tipsList.data = tipsModel.allTips;
	}

	private function handleTipSelected( tipIndex:int ):void {
		tipSelected.dispatch( tipsList.selectedItem as Tip );
	}
}
}