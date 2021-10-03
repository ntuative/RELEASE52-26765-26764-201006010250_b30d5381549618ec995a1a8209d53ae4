package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_118:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1954:int;
      
      private var var_402:int;
      
      private var var_733:RoomData;
      
      private var var_1773:int;
      
      private var _ownerName:String;
      
      private var var_2269:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_402 = param1.readInteger();
         var_1954 = param1.readInteger();
         var_2269 = param1.readBoolean();
         var_1773 = param1.readInteger();
         _ownerName = param1.readString();
         var_118 = new RoomData(param1);
         var_733 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1954;
      }
      
      public function get event() : RoomData
      {
         return var_733;
      }
      
      public function get room() : RoomData
      {
         return var_118;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_118 != null)
         {
            var_118.dispose();
            var_118 = null;
         }
         if(var_733 != null)
         {
            var_733.dispose();
            var_733 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_402;
      }
      
      public function get ownerId() : int
      {
         return var_1773;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_2269;
      }
   }
}
