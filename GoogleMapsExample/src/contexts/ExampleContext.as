package contexts {
import commands.GetSystemDataCommand;
import commands.GetTabsCommand;
import commands.GetTipsCommand;
import commands.signals.INavigationRequest;
import commands.signals.INewTipsArrived;
import commands.signals.ITabsModelUpdated;
import commands.signals.ITipSelected;
import commands.signals.ITipsModelUpdated;

import eventbus.AppEventsBus;

import guice.binding.IBinder;
import guice.binding.Scope;

import model.TabsModel;

import model.TipsModel;

import randori.signal.SimpleSignal;

import robotlegs.flexo.command.ICommandMap;

import robotlegs.flexo.config.IConfig;
import robotlegs.flexo.context.IContextInitialized;

/**
	 * Created with IntelliJ IDEA.
	 * User: leifwells
	 * Date: 4/12/13
	 * Time: 3:22 PM
	 * To change this template use File | Settings | File Templates.
	 */
public class ExampleContext implements IConfig{

	public function configure( binder:IBinder ):void {
		//nuke me
		binder.bind( AppEventsBus ).inScope( Scope.Singleton).to( AppEventsBus );

		binder.bind( TipsModel ).inScope( Scope.Singleton ).to( TipsModel );
		binder.bind( TabsModel ).inScope( Scope.Singleton ).to( TabsModel );

		binder.bind( INavigationRequest).inScope( Scope.Singleton ).to( SimpleSignal );
		binder.bind( ITipSelected ).inScope( Scope.Singleton ).to( SimpleSignal );
		binder.bind( INewTipsArrived ).inScope( Scope.Singleton ).to( SimpleSignal );
		binder.bind( ITipsModelUpdated ).inScope( Scope.Singleton ).to( SimpleSignal );
		binder.bind( ITabsModelUpdated ).inScope( Scope.Singleton ).to( SimpleSignal );
	}

	public function configureCommands(map:ICommandMap):void {
		map.signal( IContextInitialized ).to( GetTabsCommand );
		map.signal( IContextInitialized ).to( GetTipsCommand );
	}

	public function ExampleContext() {
		super();
	}
}
}