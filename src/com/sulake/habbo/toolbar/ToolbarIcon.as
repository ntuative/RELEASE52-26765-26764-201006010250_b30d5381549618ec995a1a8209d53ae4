package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_495:ToolbarIconGroup;
      
      private var var_1017:Boolean = false;
      
      private var var_1843:String;
      
      private var var_929:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1015:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_36:String = "-1";
      
      private var var_99:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_703:String;
      
      private var var_1842:int;
      
      private var var_704:Timer;
      
      private var var_1484:Array;
      
      private var var_1018:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2346:Array;
      
      private var var_264:ToolbarBarMenuAnimator;
      
      private var var_406:ToolbarIconAnimator;
      
      private var var_592:Array;
      
      private var var_839:Array;
      
      private var var_840:String = "-1";
      
      private var var_2411:Boolean = true;
      
      private var var_1016:Array;
      
      private var var_1219:Timer;
      
      private var var_1841:int;
      
      private var var_88:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_592 = new Array();
         var_839 = new Array();
         var_2346 = new Array();
         var_1018 = new ToolbarIconBouncer(0.8,1);
         super();
         var_495 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_703 = param4;
         _events = param5;
         var_264 = param6;
         var_1219 = new Timer(40,40);
         var_1219.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_99 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_487,HabboWindowStyle.const_41,HabboWindowParam.const_44,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_99.background = true;
         var_99.mouseTreshold = 0;
         var_99.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_41,HabboWindowParam.const_41,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_99.addChild(_window);
         _window.addEventListener(WindowEvent.const_48,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1484[var_1016.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1841;
      }
      
      public function get iconId() : String
      {
         return var_703;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_929 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_36 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_99 == null || _window == null)
         {
            return;
         }
         var_99.width = _window.width;
         var_99.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_88 = (0 - 0) / 2;
            _y = var_929 + (0 - 0) / 2;
         }
         else
         {
            var_88 = var_929 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_99.x = var_88;
         var_99.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_99 != null)
         {
            var_99.dispose();
            var_99 = null;
         }
         var_592 = null;
         var_839 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_264 = null;
         var_406 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_592.indexOf(param1) < 0)
         {
            var_592.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_839.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1017)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_264)
               {
                  var_264.repositionWindow(var_703,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_63);
                  _loc4_.iconId = var_703;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1015;
                  }
               }
               break;
            case WindowMouseEvent.const_33:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_840;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_592.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_839[var_592.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1017 = param1;
         if(var_99 != null)
         {
            var_99.visible = var_1017;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_99 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_99.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_99.toolTipCaption = "${toolbar.icon.tooltip." + var_1843.toLowerCase() + "}";
         }
         var_99.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_264 != null)
         {
            var_264.animateWindowIn(this,param1,param2,var_703,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_406 != null && _window != null)
         {
            var_406.update(_window);
            if(var_406.hasNextState())
            {
               state = var_406.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1484 = new Array();
         var_1016 = new Array();
         var_1843 = param1.@id;
         var_1841 = int(param1.@window_offset_from_icon);
         var_1842 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1015 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_840 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1016.push(_loc5_.id);
               var_1484.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1015 == "-1")
                  {
                     var_1015 = _loc5_.id;
                  }
                  if(var_840 == "-1")
                  {
                     var_840 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_36 = var_840;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_264 != null)
         {
            var_264.hideWindow(param1,param2,var_703,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_264 != null)
         {
            var_264.positionWindow(this,param1,param2,var_703,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_264 != null)
         {
            var_264.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1017;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1018 != null && _window != null)
         {
            var_1018.update();
            _window.y = var_1018.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_704 != null)
         {
            var_704.stop();
            var_704 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1017)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_406 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_88,_y,_bitmapData);
            if(false)
            {
               var_704 = new Timer(_loc1_.timer);
               var_704.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_704.start();
            }
            if(_loc1_.bounce)
            {
               var_1018.reset(-7);
               var_1219.reset();
               var_1219.start();
            }
         }
         else
         {
            var_406 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1842 + var_495.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_36);
      }
      
      public function get window() : IWindow
      {
         return var_99;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_839[var_592.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_495;
      }
   }
}
