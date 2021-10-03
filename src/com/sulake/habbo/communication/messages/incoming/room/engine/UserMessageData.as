package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1354:String = "F";
      
      public static const const_919:String = "M";
       
      
      private var var_88:Number = 0;
      
      private var var_451:String = "";
      
      private var var_2286:int = 0;
      
      private var var_2194:String = "";
      
      private var var_2193:int = 0;
      
      private var var_2142:int = 0;
      
      private var var_2192:String = "";
      
      private var var_618:String = "";
      
      private var _id:int = 0;
      
      private var var_213:Boolean = false;
      
      private var var_227:int = 0;
      
      private var var_2285:String = "";
      
      private var _name:String = "";
      
      private var var_2143:int = 0;
      
      private var _y:Number = 0;
      
      private var var_87:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_87;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_227;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_213)
         {
            var_227 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_213)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2286;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_213)
         {
            var_2193 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2285;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_213)
         {
            var_2192 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_213)
         {
            var_2285 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_213)
         {
            var_2142 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_213)
         {
            var_451 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_213)
         {
            var_2286 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_213)
         {
            var_618 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_2193;
      }
      
      public function get groupID() : String
      {
         return var_2192;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_213)
         {
            var_2143 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_213)
         {
            var_2194 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_213 = true;
      }
      
      public function get sex() : String
      {
         return var_618;
      }
      
      public function get figure() : String
      {
         return var_451;
      }
      
      public function get webID() : int
      {
         return var_2143;
      }
      
      public function get custom() : String
      {
         return var_2194;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_213)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_213)
         {
            var_87 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_213)
         {
            var_88 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_2142;
      }
   }
}
