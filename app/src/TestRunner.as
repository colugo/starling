package
{
	import flash.display.Sprite;
	import flash.system.fscommand;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;

	import tests.CircleTest;

	public class TestRunner extends Sprite
	{
		private var core:FlexUnitCore;


		public function TestRunner()
		{
			super();

			core = new FlexUnitCore();
			core.addListener( new TraceListener() );
			core.run( CircleTest );

			var timer:Timer = new Timer(3000);
			timer.addEventListener(TimerEvent.TIMER, end); // will call callback()
			timer.start();


		}

		public function end(event:TimerEvent):void {
			fscommand("quit");
		}
	}
}
