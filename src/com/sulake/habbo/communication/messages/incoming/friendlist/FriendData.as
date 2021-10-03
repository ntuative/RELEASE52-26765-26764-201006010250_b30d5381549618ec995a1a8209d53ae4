package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_451:String;
      
      private var var_1192:String;
      
      private var var_1191:String;
      
      private var var_1189:int;
      
      private var var_640:int;
      
      private var var_1190:String;
      
      private var _name:String;
      
      private var var_1175:Boolean;
      
      private var var_674:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_640 = param1.readInteger();
         this.var_674 = param1.readBoolean();
         this.var_1175 = param1.readBoolean();
         this.var_451 = param1.readString();
         this.var_1189 = param1.readInteger();
         this.var_1191 = param1.readString();
         this.var_1192 = param1.readString();
         this.var_1190 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_640;
      }
      
      public function get realName() : String
      {
         return var_1190;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1191;
      }
      
      public function get categoryId() : int
      {
         return var_1189;
      }
      
      public function get online() : Boolean
      {
         return var_674;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1175;
      }
      
      public function get lastAccess() : String
      {
         return var_1192;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_451;
      }
   }
}
