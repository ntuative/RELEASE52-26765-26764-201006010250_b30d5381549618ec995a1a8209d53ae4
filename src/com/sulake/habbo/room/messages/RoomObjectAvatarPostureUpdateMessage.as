package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1931:String;
      
      private var var_833:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1931 = param1;
         var_833 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1931;
      }
      
      public function get parameter() : String
      {
         return var_833;
      }
   }
}
