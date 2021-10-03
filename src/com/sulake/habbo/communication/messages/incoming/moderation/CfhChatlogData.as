package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1681:int;
      
      private var var_1006:int;
      
      private var var_1986:int;
      
      private var var_1534:int;
      
      private var var_118:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1534 = param1.readInteger();
         var_1986 = param1.readInteger();
         var_1006 = param1.readInteger();
         var_1681 = param1.readInteger();
         var_118 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1534);
      }
      
      public function get chatRecordId() : int
      {
         return var_1681;
      }
      
      public function get reportedUserId() : int
      {
         return var_1006;
      }
      
      public function get callerUserId() : int
      {
         return var_1986;
      }
      
      public function get callId() : int
      {
         return var_1534;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_118;
      }
   }
}
