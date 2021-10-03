package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_717:String;
      
      private var var_2196:int;
      
      private var var_1599:Boolean;
      
      private var _roomId:int;
      
      private var var_2197:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1599 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_717 = param1.readString();
         var_2197 = param1.readInteger();
         var_2196 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1599;
      }
      
      public function get roomName() : String
      {
         return var_717;
      }
      
      public function get enterMinute() : int
      {
         return var_2196;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2197;
      }
   }
}
