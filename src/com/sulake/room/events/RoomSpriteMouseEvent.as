package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1936:Boolean = false;
      
      private var var_1935:Boolean = false;
      
      private var var_2049:String = "";
      
      private var _type:String = "";
      
      private var var_1938:Boolean = false;
      
      private var var_2005:Number = 0;
      
      private var var_2048:Number = 0;
      
      private var var_2046:Number = 0;
      
      private var var_2047:String = "";
      
      private var var_2003:Number = 0;
      
      private var var_1937:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2047 = param2;
         var_2049 = param3;
         var_2048 = param4;
         var_2046 = param5;
         var_2005 = param6;
         var_2003 = param7;
         var_1937 = param8;
         var_1935 = param9;
         var_1938 = param10;
         var_1936 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1937;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1936;
      }
      
      public function get localX() : Number
      {
         return var_2005;
      }
      
      public function get localY() : Number
      {
         return var_2003;
      }
      
      public function get canvasId() : String
      {
         return var_2047;
      }
      
      public function get altKey() : Boolean
      {
         return var_1935;
      }
      
      public function get spriteTag() : String
      {
         return var_2049;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2048;
      }
      
      public function get screenY() : Number
      {
         return var_2046;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1938;
      }
   }
}
