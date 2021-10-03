package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1487:int = 2;
      
      public static const const_1281:int = 4;
      
      public static const const_1197:int = 1;
      
      public static const const_1246:int = 3;
       
      
      private var var_1008:int = 0;
      
      private var var_833:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1008;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1008 = param1.readInteger();
         if(var_1008 == 3)
         {
            var_833 = param1.readString();
         }
         else
         {
            var_833 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1008 = 0;
         var_833 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_833;
      }
   }
}
