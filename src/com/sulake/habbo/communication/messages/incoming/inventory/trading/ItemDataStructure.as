package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1072:String;
      
      private var var_1948:int;
      
      private var var_2214:int;
      
      private var var_1606:int;
      
      private var var_2210:int;
      
      private var _category:int;
      
      private var var_2428:int;
      
      private var var_2209:int;
      
      private var var_2212:int;
      
      private var var_2213:int;
      
      private var var_2211:int;
      
      private var var_2215:Boolean;
      
      private var var_1413:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1948 = param1;
         var_1072 = param2;
         var_2214 = param3;
         var_2213 = param4;
         _category = param5;
         var_1413 = param6;
         var_1606 = param7;
         var_2212 = param8;
         var_2209 = param9;
         var_2211 = param10;
         var_2210 = param11;
         var_2215 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2213;
      }
      
      public function get extra() : int
      {
         return var_1606;
      }
      
      public function get stuffData() : String
      {
         return var_1413;
      }
      
      public function get groupable() : Boolean
      {
         return var_2215;
      }
      
      public function get creationMonth() : int
      {
         return var_2211;
      }
      
      public function get roomItemID() : int
      {
         return var_2214;
      }
      
      public function get itemType() : String
      {
         return var_1072;
      }
      
      public function get itemID() : int
      {
         return var_1948;
      }
      
      public function get songID() : int
      {
         return var_1606;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2212;
      }
      
      public function get creationYear() : int
      {
         return var_2210;
      }
      
      public function get creationDay() : int
      {
         return var_2209;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
