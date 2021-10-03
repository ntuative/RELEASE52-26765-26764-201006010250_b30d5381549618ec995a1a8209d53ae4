package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1059:int = 0;
      
      private var var_1321:int = 0;
      
      private var var_1989:String = "";
      
      private var var_1060:int = 0;
      
      private var var_2100:String = "";
      
      private var var_2099:int = 0;
      
      private var var_1537:String = "";
      
      private var var_2098:int = 0;
      
      private var var_2097:int = 0;
      
      private var var_1991:String = "";
      
      private var var_2101:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2098 = param1;
         var_1991 = param2;
         var_1537 = param3;
         var_1989 = param4;
         var_2100 = param5;
         if(param6)
         {
            var_1321 = 1;
         }
         else
         {
            var_1321 = 0;
         }
         var_2099 = param7;
         var_2097 = param8;
         var_1060 = param9;
         var_2101 = param10;
         var_1059 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2098,var_1991,var_1537,var_1989,var_2100,var_1321,var_2099,var_2097,var_1060,var_2101,var_1059];
      }
      
      public function dispose() : void
      {
      }
   }
}
