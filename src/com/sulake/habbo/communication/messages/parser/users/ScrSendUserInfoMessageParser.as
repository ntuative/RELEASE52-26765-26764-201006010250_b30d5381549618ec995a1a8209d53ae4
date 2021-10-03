package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1280:int = 2;
      
      public static const const_1568:int = 1;
       
      
      private var var_2118:int;
      
      private var var_2120:int;
      
      private var var_2060:Boolean;
      
      private var var_2117:int;
      
      private var var_1408:String;
      
      private var var_2121:Boolean;
      
      private var var_2058:int;
      
      private var var_2119:int;
      
      private var var_2062:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2120;
      }
      
      public function get isVIP() : Boolean
      {
         return var_2060;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2119;
      }
      
      public function get memberPeriods() : int
      {
         return var_2117;
      }
      
      public function get productName() : String
      {
         return var_1408;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2121;
      }
      
      public function get responseType() : int
      {
         return var_2118;
      }
      
      public function get pastClubDays() : int
      {
         return var_2062;
      }
      
      public function get pastVipDays() : int
      {
         return var_2058;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1408 = param1.readString();
         var_2120 = param1.readInteger();
         var_2117 = param1.readInteger();
         var_2119 = param1.readInteger();
         var_2118 = param1.readInteger();
         var_2121 = param1.readBoolean();
         var_2060 = param1.readBoolean();
         var_2062 = param1.readInteger();
         var_2058 = param1.readInteger();
         return true;
      }
   }
}
