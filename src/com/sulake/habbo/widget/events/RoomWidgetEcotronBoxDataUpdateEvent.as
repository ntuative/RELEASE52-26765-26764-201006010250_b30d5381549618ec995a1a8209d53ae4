package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetEcotronBoxDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_86:String = "RWEBDUE_CONTENTS";
      
      public static const const_68:String = "RWEBDUE_PACKAGEINFO";
       
      
      private var var_190:String;
      
      private var var_1822:BitmapData;
      
      private var var_152:int = -1;
      
      private var var_29:Boolean;
      
      public function RoomWidgetEcotronBoxDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_152 = param2;
         var_190 = param3;
         var_29 = param4;
         var_1822 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1822;
      }
      
      public function get text() : String
      {
         return var_190;
      }
      
      public function get objectId() : int
      {
         return var_152;
      }
      
      public function get controller() : Boolean
      {
         return var_29;
      }
   }
}
