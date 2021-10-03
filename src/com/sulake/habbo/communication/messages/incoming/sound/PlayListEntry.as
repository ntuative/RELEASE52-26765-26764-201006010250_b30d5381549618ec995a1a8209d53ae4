package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1726:int;
      
      private var var_1727:int = 0;
      
      private var var_1724:String;
      
      private var var_1723:int;
      
      private var var_1725:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1726 = param1;
         var_1723 = param2;
         var_1725 = param3;
         var_1724 = param4;
      }
      
      public function get length() : int
      {
         return var_1723;
      }
      
      public function get name() : String
      {
         return var_1725;
      }
      
      public function get creator() : String
      {
         return var_1724;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1727;
      }
      
      public function get id() : int
      {
         return var_1726;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1727 = param1;
      }
   }
}
