package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2229:int;
      
      private var var_401:Boolean;
      
      private var var_2228:Boolean;
      
      private var var_948:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2228 = param1.readBoolean();
         if(var_2228)
         {
            var_2229 = param1.readInteger();
            var_401 = param1.readBoolean();
         }
         else
         {
            var_948 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_948 != null)
         {
            var_948.dispose();
            var_948 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2229;
      }
      
      public function get owner() : Boolean
      {
         return var_401;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2228;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_948;
      }
   }
}
