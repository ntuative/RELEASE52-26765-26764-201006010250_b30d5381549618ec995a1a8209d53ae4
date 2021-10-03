package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1745:int;
      
      private var var_1748:Boolean;
      
      private var var_1726:int;
      
      private var var_1413:String;
      
      private var var_1747:Boolean = false;
      
      private var var_1749:int;
      
      private var var_457:int;
      
      private var var_1072:String;
      
      private var var_1598:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1216:int;
      
      private var var_1744:Boolean;
      
      private var var_1746:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1745 = param1;
         var_1072 = param2;
         _objId = param3;
         var_1216 = param4;
         var_1413 = param5;
         var_1748 = param6;
         var_1744 = param7;
         var_1749 = param8;
         var_1598 = param9;
         var_1726 = param10;
         var_457 = -1;
      }
      
      public function get songId() : int
      {
         return var_1726;
      }
      
      public function get iconCallbackId() : int
      {
         return var_457;
      }
      
      public function get expiryTime() : int
      {
         return var_1749;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1746 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1747 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_457 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1744;
      }
      
      public function get slotId() : String
      {
         return var_1598;
      }
      
      public function get classId() : int
      {
         return var_1216;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1748;
      }
      
      public function get stuffData() : String
      {
         return var_1413;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1745;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1747;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1746;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1072;
      }
   }
}
