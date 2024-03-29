package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1775:int;
      
      private var var_1185:PetData;
      
      private var var_2000:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1775;
      }
      
      public function get petData() : PetData
      {
         return var_1185;
      }
      
      public function flush() : Boolean
      {
         var_1185 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2000;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1775 = param1.readInteger();
         var_2000 = param1.readInteger();
         var_1185 = new PetData(param1);
         return true;
      }
   }
}
