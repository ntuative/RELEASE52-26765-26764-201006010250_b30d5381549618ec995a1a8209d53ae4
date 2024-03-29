package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1097:int = 0;
      
      private var _data:String = "";
      
      private var var_1606:int = -1;
      
      private var var_36:int = 0;
      
      private var _type:int = 0;
      
      private var var_1099:int = 0;
      
      private var var_2420:String = "";
      
      private var var_1749:int = 0;
      
      private var _id:int = 0;
      
      private var var_213:Boolean = false;
      
      private var var_227:int = 0;
      
      private var var_2180:String = null;
      
      private var var_88:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_87:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_213)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_213)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_227;
      }
      
      public function get extra() : int
      {
         return var_1606;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_213)
         {
            var_227 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_213)
         {
            var_88 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_213)
         {
            var_1606 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_213)
         {
            var_36 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1749;
      }
      
      public function get staticClass() : String
      {
         return var_2180;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_213)
         {
            var_1749 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_213)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_213)
         {
            var_2180 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_213 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_213)
         {
            var_1097 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_213)
         {
            var_1099 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_213)
         {
            var_87 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1097;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get sizeY() : int
      {
         return var_1099;
      }
   }
}
