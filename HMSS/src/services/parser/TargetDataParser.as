package services.parser {
import randori.service.parser.AbstractParser;

import services.vo.Target;

/**
 * Created with IntelliJ IDEA.
 * User: mlabriola
 * Date: 4/11/13
 * Time: 11:43 AM
 * To change this template use File | Settings | File Templates.
 */
public class TargetDataParser extends AbstractParser {
    public function parseResult(result:Object):Array {
        //Here we are just going to parse the result into Json.
        //We are adding some extra data just to show the concept that transforming here is totally allowed and legit
        var json:Array = JSON.parse( result as String ) as Array;

        return json;
    }

    public function TargetDataParser() {
    }
}
}