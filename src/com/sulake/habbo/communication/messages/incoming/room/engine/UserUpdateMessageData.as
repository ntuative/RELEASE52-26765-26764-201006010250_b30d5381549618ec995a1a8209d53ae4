package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_87:Number = 0;
      
      private var var_227:int = 0;
      
      private var var_2088:int = 0;
      
      private var var_2154:Number = 0;
      
      private var var_2155:Number = 0;
      
      private var var_2157:Number = 0;
      
      private var var_2156:Number = 0;
      
      private var var_2153:Boolean = false;
      
      private var var_88:Number = 0;
      
      private var _id:int = 0;
      
      private var var_189:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_189 = [];
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_87 = param4;
         var_2156 = param5;
         var_227 = param6;
         var_2088 = param7;
         var_2154 = param8;
         var_2155 = param9;
         var_2157 = param10;
         var_2153 = param11;
         var_189 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function get dir() : int
      {
         return var_227;
      }
      
      public function get localZ() : Number
      {
         return var_2156;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2153;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_2088;
      }
      
      public function get targetX() : Number
      {
         return var_2154;
      }
      
      public function get targetY() : Number
      {
         return var_2155;
      }
      
      public function get targetZ() : Number
      {
         return var_2157;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get actions() : Array
      {
         return var_189.slice();
      }
   }
}
