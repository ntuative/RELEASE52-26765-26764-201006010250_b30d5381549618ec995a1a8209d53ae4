package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var var_379:Timer;
      
      private var _navigator:HabboNavigator;
      
      private var _popupIndentLeft:int;
      
      private var var_1857:int;
      
      private var var_325:Timer;
      
      private var var_1329:String;
      
      private var var_51:IWindowContainer;
      
      public function PopupCtrl(param1:HabboNavigator, param2:int, param3:int, param4:String)
      {
         var_379 = new Timer(500,1);
         var_325 = new Timer(100,1);
         super();
         _navigator = param1;
         var_1329 = param4;
         var_1857 = param2;
         _popupIndentLeft = param3;
         var_379.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_325.addEventListener(TimerEvent.TIMER,onHideTimer);
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(var_51 != null)
         {
            var_51.visible = false;
         }
      }
      
      public function hideInstantly() : void
      {
         if(var_51 != null)
         {
            var_51.visible = false;
         }
         this.var_379.reset();
         this.var_325.reset();
      }
      
      private function onPopup(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 as WindowMouseEvent == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_325.reset();
         }
         else if(param1.type == WindowMouseEvent.const_33)
         {
            if(!Util.containsMouse(var_51))
            {
               this.closePopup();
            }
         }
      }
      
      public function closePopup() : void
      {
         var_325.reset();
         var_379.reset();
         var_325.start();
      }
      
      public function get navigator() : HabboNavigator
      {
         return _navigator;
      }
      
      public function refreshContent(param1:IWindowContainer) : void
      {
      }
      
      public function dispose() : void
      {
         _navigator = null;
         if(var_379)
         {
            var_379.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_379.reset();
            var_379 = null;
         }
         if(var_325)
         {
            var_325.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_325.reset();
            var_325 = null;
         }
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_51.visible = true;
         this.var_51.activate();
      }
      
      public function showPopup(param1:IWindow) : void
      {
         if(var_51 == null)
         {
            var_51 = IWindowContainer(_navigator.getXmlWindow(var_1329));
            var_51.visible = false;
            var_51.setParamFlag(HabboWindowParam.const_44,true);
            var_51.procedure = onPopup;
         }
         Util.hideChildren(var_51);
         refreshContent(var_51);
         var_51.height = Util.getLowestPoint(var_51) + 5;
         var _loc2_:Point = new Point();
         param1.getGlobalPosition(_loc2_);
         var_51.x = _loc2_.x + var_1857 + param1.width;
         var_51.y = _loc2_.y - 0 + param1.height * 0.5;
         var _loc3_:Point = new Point();
         var_51.getGlobalPosition(_loc3_);
         if(_loc3_.x + var_51.width > var_51.desktop.width)
         {
            var_51.x = 0 + _loc2_.x + _popupIndentLeft;
            refreshPopupArrows(var_51,false);
         }
         else
         {
            refreshPopupArrows(var_51,true);
         }
         if(true)
         {
            var_379.reset();
            var_379.start();
         }
         var_325.reset();
         var_51.activate();
      }
      
      public function get visible() : Boolean
      {
         return this.var_51 != null && this.var_51.visible;
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = _navigator.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_72,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         refreshPopupArrow(param1,true,param2);
         refreshPopupArrow(param1,false,!param2);
      }
   }
}
