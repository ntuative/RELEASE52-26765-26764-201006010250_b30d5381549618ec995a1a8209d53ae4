package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1321:String = "WN_CREATED";
      
      public static const const_969:String = "WN_DISABLE";
      
      public static const const_1000:String = "WN_DEACTIVATED";
      
      public static const const_924:String = "WN_OPENED";
      
      public static const const_903:String = "WN_CLOSED";
      
      public static const const_1042:String = "WN_DESTROY";
      
      public static const const_1625:String = "WN_ARRANGED";
      
      public static const const_495:String = "WN_PARENT_RESIZED";
      
      public static const const_887:String = "WN_ENABLE";
      
      public static const const_974:String = "WN_RELOCATE";
      
      public static const const_892:String = "WN_FOCUS";
      
      public static const const_850:String = "WN_PARENT_RELOCATED";
      
      public static const const_422:String = "WN_PARAM_UPDATED";
      
      public static const const_647:String = "WN_PARENT_ACTIVATED";
      
      public static const const_171:String = "WN_RESIZED";
      
      public static const const_828:String = "WN_CLOSE";
      
      public static const const_980:String = "WN_PARENT_REMOVED";
      
      public static const const_265:String = "WN_CHILD_RELOCATED";
      
      public static const const_548:String = "WN_ENABLED";
      
      public static const const_285:String = "WN_CHILD_RESIZED";
      
      public static const const_869:String = "WN_MINIMIZED";
      
      public static const const_713:String = "WN_DISABLED";
      
      public static const const_233:String = "WN_CHILD_ACTIVATED";
      
      public static const const_488:String = "WN_STATE_UPDATED";
      
      public static const const_754:String = "WN_UNSELECTED";
      
      public static const const_498:String = "WN_STYLE_UPDATED";
      
      public static const const_1614:String = "WN_UPDATE";
      
      public static const const_462:String = "WN_PARENT_ADDED";
      
      public static const const_641:String = "WN_RESIZE";
      
      public static const const_744:String = "WN_CHILD_REMOVED";
      
      public static const const_1626:String = "";
      
      public static const const_849:String = "WN_RESTORED";
      
      public static const const_360:String = "WN_SELECTED";
      
      public static const const_965:String = "WN_MINIMIZE";
      
      public static const const_967:String = "WN_FOCUSED";
      
      public static const const_1250:String = "WN_LOCK";
      
      public static const const_352:String = "WN_CHILD_ADDED";
      
      public static const const_833:String = "WN_UNFOCUSED";
      
      public static const const_403:String = "WN_RELOCATED";
      
      public static const const_973:String = "WN_DEACTIVATE";
      
      public static const const_1227:String = "WN_CRETAE";
      
      public static const const_832:String = "WN_RESTORE";
      
      public static const const_354:String = "WN_ACTVATED";
      
      public static const const_1335:String = "WN_LOCKED";
      
      public static const const_475:String = "WN_SELECT";
      
      public static const const_838:String = "WN_MAXIMIZE";
      
      public static const const_987:String = "WN_OPEN";
      
      public static const const_547:String = "WN_UNSELECT";
      
      public static const const_1655:String = "WN_ARRANGE";
      
      public static const const_1186:String = "WN_UNLOCKED";
      
      public static const const_1620:String = "WN_UPDATED";
      
      public static const const_827:String = "WN_ACTIVATE";
      
      public static const const_1370:String = "WN_UNLOCK";
      
      public static const const_945:String = "WN_MAXIMIZED";
      
      public static const const_1006:String = "WN_DESTROYED";
      
      public static const const_854:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1645,cancelable);
      }
   }
}
