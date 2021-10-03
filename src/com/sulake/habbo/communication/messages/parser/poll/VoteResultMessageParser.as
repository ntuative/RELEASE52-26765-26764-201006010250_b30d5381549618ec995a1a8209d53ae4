package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1349:int;
      
      private var var_1071:String;
      
      private var var_689:Array;
      
      private var var_1061:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_689.slice();
      }
      
      public function flush() : Boolean
      {
         var_1071 = "";
         var_1061 = [];
         var_689 = [];
         var_1349 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1349;
      }
      
      public function get question() : String
      {
         return var_1071;
      }
      
      public function get choices() : Array
      {
         return var_1061.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1071 = param1.readString();
         var_1061 = [];
         var_689 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1061.push(param1.readString());
            var_689.push(param1.readInteger());
            _loc3_++;
         }
         var_1349 = param1.readInteger();
         return true;
      }
   }
}
