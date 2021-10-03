package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_736:String = "RWUAM_RESPECT_USER";
      
      public static const const_665:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_537:String = "RWUAM_START_TRADING";
      
      public static const const_561:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_578:String = "RWUAM_WHISPER_USER";
      
      public static const const_645:String = "RWUAM_IGNORE_USER";
      
      public static const const_512:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_590:String = "RWUAM_BAN_USER";
      
      public static const const_593:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_446:String = "RWUAM_KICK_USER";
      
      public static const const_613:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_622:String = " RWUAM_RESPECT_PET";
      
      public static const const_409:String = "RWUAM_KICK_BOT";
      
      public static const const_1322:String = "RWUAM_TRAIN_PET";
      
      public static const const_631:String = "RWUAM_PICKUP_PET";
      
      public static const const_577:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_663:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
