package mediators {
import Slick.Column;
import Slick.Grid;
import Slick.Options;

import randori.behaviors.AbstractMediator;
import randori.jquery.Event;
import randori.jquery.JQuery;

/**
 * Created with IntelliJ IDEA.
 * User: mlabriola
 * Date: 4/18/13
 * Time: 11:12 AM
 * To change this template use File | Settings | File Templates.
 */
public class IndexMediator extends AbstractMediator {

    [View]
    public var load:JQuery;

    [View]
    public var gridDiv:JQuery;

    private var grid:Grid;

    override protected function onRegister():void {
        //load.click( loadGrid );
        loadGrid( null );
    }

    protected function loadGrid( event:Event ):void {
        var col1:Column = new Column("title", "Title", "title" );
        var col2:Column = new Column("duration", "Duration", "duration" );
        var col3:Column = new Column("%", "% Complete", "percentComplete" );
        var col4:Column = new Column("start", "Start", "start" );
        var col5:Column = new Column("finish", "Finish", "finish" );
        var col6:Column = new Column("effort-driven", "Effort Driven", "effortDriven" );

        var columns:Array = [col1,col2,col3,col4,col5,col6];

        var options:Options = new Options();
        options.enableCellNavigation = true;
        options.enableColumnReorder = false;

        var data:Array = new Array();
        for (var i:int = 0; i < 500; i++) {
            data[i] = {
                title: "Task " + i,
                duration: "5 days",
                percentComplete: Math.round(Math.random() * 100),
                start: "01/01/2009",
                finish: "01/05/2009",
                effortDriven: (i % 5 == 0)
            };
        }

        grid = new Grid( gridDiv, data, columns, options);
    }

    override protected function onDeregister():void {

    }

}
}