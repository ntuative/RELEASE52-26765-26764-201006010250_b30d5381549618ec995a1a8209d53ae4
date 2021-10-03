package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2315:Boolean;
      
      protected var var_1606:Number;
      
      protected var var_2316:Boolean;
      
      protected var _type:int;
      
      protected var var_2309:Boolean;
      
      protected var var_1726:int;
      
      protected var var_2314:Boolean;
      
      protected var var_1413:String;
      
      protected var var_2210:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1598:String;
      
      protected var var_2215:Boolean;
      
      protected var _category:int;
      
      protected var var_2211:int;
      
      protected var var_2319:int;
      
      protected var var_2209:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_2215 = param5;
         var_2314 = param6;
         var_2315 = param7;
         var_2316 = param8;
         var_1413 = param9;
         var_1606 = param10;
         var_2319 = param11;
         var_2209 = param12;
         var_2211 = param13;
         var_2210 = param14;
         var_1598 = param15;
         var_1726 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2309;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1606;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2309 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1726;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2316;
      }
      
      public function get slotId() : String
      {
         return var_1598;
      }
      
      public function get expires() : int
      {
         return var_2319;
      }
      
      public function get creationYear() : int
      {
         return var_2210;
      }
      
      public function get creationDay() : int
      {
         return var_2209;
      }
      
      public function get stuffData() : String
      {
         return var_1413;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2314;
      }
      
      public function get groupable() : Boolean
      {
         return var_2215;
      }
      
      public function get creationMonth() : int
      {
         return var_2211;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2315;
      }
   }
}
