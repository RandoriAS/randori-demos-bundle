package services {
import model.TipsModel;

import randori.async.Promise;
import randori.service.AbstractService;
import randori.webkit.xml.XMLHttpRequest;

import services.parser.GenericJsonParser;

public class TipsService extends AbstractService {

	[Inject]
	public var tipsModel:TipsModel;

	private var targets:GenericJsonParser;
	private var path:String;

	public function get():Promise {
		var promise:Promise = sendRequest("GET", path);
		var parserPromise:Promise = promise.then( targets.parseResult );

		return parserPromise.then( handleResult, handleFault );
	}

	private function handleResult( value:Array ):void {
		tipsModel.allTips = value;
	}

	private function handleFault( info:Object ):void {

	}

	public function TipsService( xmlHttpRequest:XMLHttpRequest, targets:GenericJsonParser ) {
		super(xmlHttpRequest);

		this.targets = targets;
		this.path = "assets/data/tips.txt";
	}
}
}