package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_451:String;
      
      private var var_1690:int;
      
      private var var_2040:String;
      
      private var var_1066:int;
      
      private var var_1181:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1181;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1181 = param1.readInteger();
         var_2040 = param1.readString();
         var_1690 = param1.readInteger();
         var_451 = param1.readString();
         var_1066 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2040;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_451;
      }
      
      public function get petType() : int
      {
         return var_1066;
      }
      
      public function get level() : int
      {
         return var_1690;
      }
   }
}
