package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class SessionCreditBalanceEvent extends Event
   {
      
      public static const const_187:String = "session_credit_balance";
       
      
      private var var_2059:int;
      
      public function SessionCreditBalanceEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_187,param2,param3);
         var_2059 = param1;
      }
      
      public function get credits() : int
      {
         return var_2059;
      }
   }
}
