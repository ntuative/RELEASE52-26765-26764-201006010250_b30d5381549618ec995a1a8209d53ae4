package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_233:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_233 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_233;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_233 = new RoomSettingsFlatInfo();
         var_233.allowFurniMoving = param1.readInteger() == 1;
         var_233.doorMode = param1.readInteger();
         var_233.id = param1.readInteger();
         var_233.ownerName = param1.readString();
         var_233.type = param1.readString();
         var_233.name = param1.readString();
         var_233.description = param1.readString();
         var_233.showOwnerName = param1.readInteger() == 1;
         var_233.allowTrading = param1.readInteger() == 1;
         var_233.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
