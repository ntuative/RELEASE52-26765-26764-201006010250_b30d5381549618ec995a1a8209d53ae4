package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_532:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_190:String;
      
      private var var_687:String;
      
      private var var_1454:String;
      
      private var var_152:int = -1;
      
      private var var_29:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_152 = param2;
         var_1454 = param3;
         var_190 = param4;
         var_687 = param5;
         var_29 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1454;
      }
      
      public function get colorHex() : String
      {
         return var_687;
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
