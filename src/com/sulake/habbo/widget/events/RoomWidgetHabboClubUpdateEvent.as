package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_214:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2081:Boolean = false;
      
      private var var_2084:int = 0;
      
      private var var_2083:int = 0;
      
      private var var_2024:int;
      
      private var var_2082:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_214,param6,param7);
         var_2082 = param1;
         var_2083 = param2;
         var_2084 = param3;
         var_2081 = param4;
         var_2024 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_2024;
      }
      
      public function get pastPeriods() : int
      {
         return var_2084;
      }
      
      public function get periodsLeft() : int
      {
         return var_2083;
      }
      
      public function get daysLeft() : int
      {
         return var_2082;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2081;
      }
   }
}
