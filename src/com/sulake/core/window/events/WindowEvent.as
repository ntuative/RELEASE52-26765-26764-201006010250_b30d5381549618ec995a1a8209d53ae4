package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_293:String = "WE_CHILD_RESIZED";
      
      public static const const_1221:String = "WE_CLOSE";
      
      public static const const_1238:String = "WE_DESTROY";
      
      public static const const_125:String = "WE_CHANGE";
      
      public static const const_1259:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1537:String = "WE_PARENT_RESIZE";
      
      public static const const_95:String = "WE_UPDATE";
      
      public static const const_1393:String = "WE_MAXIMIZE";
      
      public static const const_509:String = "WE_DESTROYED";
      
      public static const const_897:String = "WE_UNSELECT";
      
      public static const const_1247:String = "WE_MAXIMIZED";
      
      public static const const_1657:String = "WE_UNLOCKED";
      
      public static const const_400:String = "WE_CHILD_REMOVED";
      
      public static const const_189:String = "WE_OK";
      
      public static const const_48:String = "WE_RESIZED";
      
      public static const const_1240:String = "WE_ACTIVATE";
      
      public static const const_261:String = "WE_ENABLED";
      
      public static const const_381:String = "WE_CHILD_RELOCATED";
      
      public static const const_1188:String = "WE_CREATE";
      
      public static const const_615:String = "WE_SELECT";
      
      public static const const_191:String = "";
      
      public static const const_1652:String = "WE_LOCKED";
      
      public static const const_1680:String = "WE_PARENT_RELOCATE";
      
      public static const const_1607:String = "WE_CHILD_REMOVE";
      
      public static const const_1549:String = "WE_CHILD_RELOCATE";
      
      public static const const_1584:String = "WE_LOCK";
      
      public static const const_210:String = "WE_FOCUSED";
      
      public static const const_606:String = "WE_UNSELECTED";
      
      public static const const_1027:String = "WE_DEACTIVATED";
      
      public static const const_1187:String = "WE_MINIMIZED";
      
      public static const const_1590:String = "WE_ARRANGED";
      
      public static const const_1690:String = "WE_UNLOCK";
      
      public static const const_1654:String = "WE_ATTACH";
      
      public static const const_1407:String = "WE_OPEN";
      
      public static const const_1320:String = "WE_RESTORE";
      
      public static const const_1588:String = "WE_PARENT_RELOCATED";
      
      public static const const_1396:String = "WE_RELOCATE";
      
      public static const const_1571:String = "WE_CHILD_RESIZE";
      
      public static const const_1703:String = "WE_ARRANGE";
      
      public static const const_1397:String = "WE_OPENED";
      
      public static const const_1373:String = "WE_CLOSED";
      
      public static const const_1599:String = "WE_DETACHED";
      
      public static const const_1649:String = "WE_UPDATED";
      
      public static const const_1319:String = "WE_UNFOCUSED";
      
      public static const const_396:String = "WE_RELOCATED";
      
      public static const const_1304:String = "WE_DEACTIVATE";
      
      public static const const_209:String = "WE_DISABLED";
      
      public static const const_683:String = "WE_CANCEL";
      
      public static const const_675:String = "WE_ENABLE";
      
      public static const const_1382:String = "WE_ACTIVATED";
      
      public static const const_1329:String = "WE_FOCUS";
      
      public static const const_1629:String = "WE_DETACH";
      
      public static const const_1198:String = "WE_RESTORED";
      
      public static const const_1185:String = "WE_UNFOCUS";
      
      public static const const_60:String = "WE_SELECTED";
      
      public static const const_1180:String = "WE_PARENT_RESIZED";
      
      public static const const_1387:String = "WE_CREATED";
      
      public static const const_1612:String = "WE_ATTACHED";
      
      public static const const_1195:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1645:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1423:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1645 = param3;
         var_1423 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1423;
      }
      
      public function get related() : IWindow
      {
         return var_1645;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1423 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
