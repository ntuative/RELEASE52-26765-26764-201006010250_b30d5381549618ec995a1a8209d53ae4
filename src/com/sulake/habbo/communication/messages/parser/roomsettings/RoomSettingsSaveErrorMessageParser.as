package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1631:int = 9;
      
      public static const const_1505:int = 4;
      
      public static const const_1504:int = 1;
      
      public static const const_1232:int = 10;
      
      public static const const_1651:int = 2;
      
      public static const const_1303:int = 7;
      
      public static const const_1362:int = 11;
      
      public static const const_1694:int = 3;
      
      public static const const_1248:int = 8;
      
      public static const const_1287:int = 5;
      
      public static const const_1615:int = 6;
      
      public static const const_1264:int = 12;
       
      
      private var var_2299:String;
      
      private var _roomId:int;
      
      private var var_1222:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2299;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1222 = param1.readInteger();
         var_2299 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1222;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
