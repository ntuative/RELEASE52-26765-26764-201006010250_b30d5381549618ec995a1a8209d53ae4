package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1515:int;
      
      private var var_1702:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1702 = param1.readString();
         var_1515 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1515;
      }
      
      public function get productItemType() : String
      {
         return var_1702;
      }
   }
}
