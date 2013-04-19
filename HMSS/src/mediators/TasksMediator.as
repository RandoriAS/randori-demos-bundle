package mediators
{
	import behaviors.TasksGrid;

	import randori.behaviors.AbstractMediator;

	import services.TasksService;

	/**
	 * Mediator for the view showing the tasklist
	 */
	public class TasksMediator extends AbstractMediator
	{
		//----------------------------------------------------------------------------
		//
		// View elements
		//
		//----------------------------------------------------------------------------

		[View]
		public var grid:TasksGrid;

		//----------------------------------------------------------------------------
		//
		// Variables
		//
		//----------------------------------------------------------------------------

		/**
		 * service for getting tasks
		 */
		private var service:TasksService;

		//----------------------------------------------------------------------------
		//
		// Methods
		//
		//----------------------------------------------------------------------------

		/**
		 * @inheritDoc
		 */
		override protected function onRegister():void
		{
			var scopedGrid:TasksGrid = this.grid;

			service.get().then( function(data:Array):void
			{
				scopedGrid.data = data;
			});
		}

		/**
	 	 * @inheritDoc
	 	 */
		override protected function onDeregister():void
		{

		}

		/**
		 * Constructor
		 */
		public function TasksMediator(service:TasksService)
		{
			super();

			this.service = service;
		}
	}
}