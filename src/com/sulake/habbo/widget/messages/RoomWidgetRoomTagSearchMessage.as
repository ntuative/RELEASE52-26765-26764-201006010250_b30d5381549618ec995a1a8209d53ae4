package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_533:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1893:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_533);
         var_1893 = param1;
      }
      
      public function get tag() : String
      {
         return var_1893;
      }
   }
}
