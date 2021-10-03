package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class HabboSessionFigureUpdatedEvent extends Event
   {
      
      public static const const_638:String = "HABBO_SESSION_FIGURE_UPDATE";
       
      
      private var var_640:String;
      
      private var var_451:String;
      
      private var _userId:int;
      
      public function HabboSessionFigureUpdatedEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_638,param4,param5);
         _userId = param1;
         var_451 = param2;
         var_640 = param3;
      }
      
      public function get gender() : String
      {
         return var_640;
      }
      
      public function get figure() : String
      {
         return var_451;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
