package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	[SWF(frameRate="30", width="960" , height="640")]
	public class FrameWork extends Sprite
	{
		private var _loader:Loader;
		private var _req:URLRequest;
		private var _loadercontext:LoaderContext;
		
		private var _gameName:String = "OOXX";
		private var _game:*;
		
		public function FrameWork()
		{
			stage.color = 0x0;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.LOW;
			
			this._loader = new Loader();
			this._req = new URLRequest("bin-debug/"+_gameName+".swf");
			this._loadercontext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
			this._loadercontext.allowCodeImport = true;
			this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			this._loader.load(this._req,this._loadercontext);
		}
		private function onComplete(e:Event):void
		{
			var cls:Class = this._loader.content.loaderInfo.applicationDomain.getDefinition(_gameName) as Class;
			_game = new cls();
			_loader.width = 960;
			_loader.height = 640;
			addChild(_game)
		}
	}
}