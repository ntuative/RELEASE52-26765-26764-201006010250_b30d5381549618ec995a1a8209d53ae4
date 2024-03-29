package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1127:Boolean;
      
      private var var_1128:Boolean;
      
      private var var_1129:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1127;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1128;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1129 = param1.readBoolean();
         var_1128 = param1.readBoolean();
         var_1127 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1129;
      }
      
      public function flush() : Boolean
      {
         var_1129 = false;
         var_1128 = false;
         var_1127 = false;
         return true;
      }
   }
}
