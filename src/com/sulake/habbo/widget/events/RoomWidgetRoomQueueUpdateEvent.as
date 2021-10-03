package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_449:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_341:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_929:int;
      
      private var var_252:Boolean;
      
      private var var_1993:Boolean;
      
      private var var_1546:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_929 = param2;
         var_1993 = param3;
         var_252 = param4;
         var_1546 = param5;
      }
      
      public function get position() : int
      {
         return var_929;
      }
      
      public function get isActive() : Boolean
      {
         return var_252;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1546;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1993;
      }
   }
}
