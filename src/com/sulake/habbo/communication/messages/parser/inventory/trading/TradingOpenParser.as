package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingOpenParser implements IMessageParser
   {
       
      
      private var _userID:int;
      
      private var _otherUserCanTrade:Boolean;
      
      private var var_1239:int;
      
      private var var_1238:Boolean;
      
      public function TradingOpenParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _userID = -1;
         var_1238 = false;
         var_1239 = -1;
         _otherUserCanTrade = false;
         return true;
      }
      
      public function get userID() : int
      {
         return _userID;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return _otherUserCanTrade;
      }
      
      public function get otherUserID() : int
      {
         return var_1239;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _userID = param1.readInteger();
         var_1238 = param1.readInteger() == 1;
         var_1239 = param1.readInteger();
         _otherUserCanTrade = param1.readInteger() == 1;
         return true;
      }
      
      public function get userCanTrade() : Boolean
      {
         return var_1238;
      }
   }
}
