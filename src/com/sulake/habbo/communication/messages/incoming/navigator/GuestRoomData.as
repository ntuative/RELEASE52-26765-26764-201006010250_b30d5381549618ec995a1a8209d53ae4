package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1954:int;
      
      private var var_2184:String;
      
      private var var_2185:int;
      
      private var var_2187:int;
      
      private var var_733:Boolean;
      
      private var var_1718:Boolean;
      
      private var var_402:int;
      
      private var var_1236:String;
      
      private var var_1711:int;
      
      private var var_1189:int;
      
      private var _ownerName:String;
      
      private var var_717:String;
      
      private var var_2186:int;
      
      private var var_2188:RoomThumbnailData;
      
      private var var_1794:Boolean;
      
      private var var_661:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_661 = new Array();
         super();
         var_402 = param1.readInteger();
         var_733 = param1.readBoolean();
         var_717 = param1.readString();
         _ownerName = param1.readString();
         var_1711 = param1.readInteger();
         var_1954 = param1.readInteger();
         var_2186 = param1.readInteger();
         var_1236 = param1.readString();
         var_2185 = param1.readInteger();
         var_1794 = param1.readBoolean();
         var_2187 = param1.readInteger();
         var_1189 = param1.readInteger();
         var_2184 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_661.push(_loc4_);
            _loc3_++;
         }
         var_2188 = new RoomThumbnailData(param1);
         var_1718 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2186;
      }
      
      public function get roomName() : String
      {
         return var_717;
      }
      
      public function get userCount() : int
      {
         return var_1954;
      }
      
      public function get score() : int
      {
         return var_2187;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2184;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1794;
      }
      
      public function get tags() : Array
      {
         return var_661;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1718;
      }
      
      public function get event() : Boolean
      {
         return var_733;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_661 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1189;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2185;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2188;
      }
      
      public function get doorMode() : int
      {
         return var_1711;
      }
      
      public function get flatId() : int
      {
         return var_402;
      }
      
      public function get description() : String
      {
         return var_1236;
      }
   }
}
