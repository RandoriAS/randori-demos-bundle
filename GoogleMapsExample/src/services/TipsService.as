package services {
import randori.async.Promise;
import randori.service.AbstractService;
import randori.webkit.xml.XMLHttpRequest;

import services.parser.GenericJsonParser;

public class TipsService extends AbstractService {

        private var targets:GenericJsonParser;

        private var path:String;

        public function get():Promise {
            var promise:Promise = sendRequest("GET", path);
            var parserPromise:Promise = promise.then( targets.parseResult );

            return parserPromise;
        }

        public function TipsService(xmlHttpRequest:XMLHttpRequest, targets:GenericJsonParser ) {
            super(xmlHttpRequest);

            this.targets = targets;
            this.path = "assets/data/tips.txt";
        }
    }
}