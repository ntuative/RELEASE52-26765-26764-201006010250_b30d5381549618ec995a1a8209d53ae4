package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1413:String;
      
      private var var_1072:String;
      
      private var var_2221:Boolean;
      
      private var var_1606:int;
      
      private var var_1745:int;
      
      private var var_2222:Boolean;
      
      private var var_1598:String = "";
      
      private var var_1748:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1216:int;
      
      private var var_1744:Boolean;
      
      private var var_1726:int = -1;
      
      private var var_1749:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1745 = param1;
         var_1072 = param2;
         _objId = param3;
         var_1216 = param4;
         _category = param5;
         var_1413 = param6;
         var_2221 = param7;
         var_1748 = param8;
         var_1744 = param9;
         var_2222 = param10;
         var_1749 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1598;
      }
      
      public function get extra() : int
      {
         return var_1606;
      }
      
      public function get classId() : int
      {
         return var_1216;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2222;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2221;
      }
      
      public function get stripId() : int
      {
         return var_1745;
      }
      
      public function get stuffData() : String
      {
         return var_1413;
      }
      
      public function get songId() : int
      {
         return var_1726;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1598 = param1;
         var_1606 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1072;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1749;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1744;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1748;
      }
   }
}
