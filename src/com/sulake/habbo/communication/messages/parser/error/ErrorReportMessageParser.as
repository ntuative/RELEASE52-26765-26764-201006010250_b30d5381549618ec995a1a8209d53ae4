package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1340:int;
      
      private var var_1222:int;
      
      private var var_1341:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1340;
      }
      
      public function flush() : Boolean
      {
         var_1222 = 0;
         var_1340 = 0;
         var_1341 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1222;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1340 = param1.readInteger();
         var_1222 = param1.readInteger();
         var_1341 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1341;
      }
   }
}
