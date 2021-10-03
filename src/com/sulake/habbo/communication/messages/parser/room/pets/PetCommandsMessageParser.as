package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1029:Array;
      
      private var var_1181:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1181 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_1029 = new Array();
         while(_loc2_-- > 0)
         {
            var_1029.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return var_1029;
      }
      
      public function get petId() : int
      {
         return var_1181;
      }
      
      public function flush() : Boolean
      {
         var_1181 = -1;
         var_1029 = null;
         return true;
      }
   }
}
