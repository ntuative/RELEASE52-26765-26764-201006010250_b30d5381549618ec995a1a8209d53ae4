package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ModeratorActionResultMessageParser implements IMessageParser
   {
       
      
      private var var_2240:Boolean;
      
      private var _userId:int;
      
      public function ModeratorActionResultMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _userId = param1.readInteger();
         var_2240 = param1.readBoolean();
         return true;
      }
      
      public function get success() : Boolean
      {
         return var_2240;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
