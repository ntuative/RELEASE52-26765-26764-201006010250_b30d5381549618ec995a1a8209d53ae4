package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2255:Boolean = false;
      
      private var var_2257:int = 0;
      
      private var var_1563:int = 0;
      
      private var var_2256:int = 0;
      
      private var var_2060:Boolean = false;
      
      private var var_1426:int = 0;
      
      private var var_1562:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1426 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2257;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2255;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2255 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2060;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2257 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1563 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1426;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_2060 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2256 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1563;
      }
      
      public function get pixelBalance() : int
      {
         return var_2256;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1562 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1562;
      }
   }
}
