package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2061:int = 0;
      
      private var var_1563:int = 0;
      
      private var var_2060:Boolean = false;
      
      private var var_2059:int = 0;
      
      private var var_2058:int = 0;
      
      private var var_1562:int = 0;
      
      private var var_2062:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1563;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1563 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_2060 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_2062 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1563 > 0 || var_1562 > 0;
      }
      
      public function get credits() : int
      {
         return var_2059;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_2058 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1562;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2060;
      }
      
      public function get pastClubDays() : int
      {
         return var_2062;
      }
      
      public function get pastVipDays() : int
      {
         return var_2058;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2061 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2061;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1562 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2059 = param1;
      }
   }
}
