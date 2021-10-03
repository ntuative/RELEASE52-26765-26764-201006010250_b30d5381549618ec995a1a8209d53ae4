package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1080:Boolean;
      
      private var var_1279:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1080 = param1.readInteger() > 0;
         var_1279 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1080;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1279;
      }
      
      public function flush() : Boolean
      {
         var_1080 = false;
         var_1279 = false;
         return true;
      }
   }
}
