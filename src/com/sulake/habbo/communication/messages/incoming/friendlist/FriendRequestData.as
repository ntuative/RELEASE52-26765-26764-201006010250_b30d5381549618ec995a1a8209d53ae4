package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_2123:int;
      
      private var var_2122:String;
      
      private var var_1014:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1014 = param1.readInteger();
         this.var_2122 = param1.readString();
         this.var_2123 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1014;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2123;
      }
      
      public function get requesterName() : String
      {
         return this.var_2122;
      }
   }
}
