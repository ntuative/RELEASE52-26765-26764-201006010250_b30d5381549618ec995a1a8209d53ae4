package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1174:int;
      
      private var var_1173:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_1174;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1174 = param1.readInteger();
         var_1173 = param1.readString();
         return true;
      }
      
      public function get answerText() : String
      {
         return var_1173;
      }
      
      public function flush() : Boolean
      {
         var_1174 = -1;
         var_1173 = null;
         return true;
      }
   }
}
