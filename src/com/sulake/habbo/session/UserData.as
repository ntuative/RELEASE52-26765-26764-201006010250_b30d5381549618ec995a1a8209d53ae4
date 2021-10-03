package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_451:String = "";
      
      private var var_2194:String = "";
      
      private var var_2193:int = 0;
      
      private var var_2142:int = 0;
      
      private var _type:int = 0;
      
      private var var_2192:String = "";
      
      private var var_618:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_2143:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_2193 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_2192 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_451 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_618 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_2193;
      }
      
      public function set webID(param1:int) : void
      {
         var_2143 = param1;
      }
      
      public function get groupID() : String
      {
         return var_2192;
      }
      
      public function set custom(param1:String) : void
      {
         var_2194 = param1;
      }
      
      public function get figure() : String
      {
         return var_451;
      }
      
      public function get sex() : String
      {
         return var_618;
      }
      
      public function get custom() : String
      {
         return var_2194;
      }
      
      public function get webID() : int
      {
         return var_2143;
      }
      
      public function set xp(param1:int) : void
      {
         var_2142 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_2142;
      }
   }
}
