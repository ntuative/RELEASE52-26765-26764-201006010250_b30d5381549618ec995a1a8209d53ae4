package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1072:int;
      
      private var var_1306:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1072 = param1;
         var_1306 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1072;
      }
      
      public function get itemName() : String
      {
         return var_1306;
      }
   }
}
