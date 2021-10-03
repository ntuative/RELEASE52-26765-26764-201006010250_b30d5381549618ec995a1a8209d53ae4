package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_2191:int;
      
      private var var_1273:int;
      
      private var var_698:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1273 = param1.readInteger();
         var_2191 = param1.readInteger();
         var_698 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_698.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_2191;
      }
      
      public function get prizes() : Array
      {
         return var_698;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1273;
      }
   }
}
