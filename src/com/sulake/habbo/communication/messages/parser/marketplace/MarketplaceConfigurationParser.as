package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1761:int;
      
      private var var_1551:int;
      
      private var var_1757:int;
      
      private var var_1758:int;
      
      private var var_1759:int;
      
      private var var_1552:int;
      
      private var var_1760:int;
      
      private var var_1359:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1761;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1551;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1760;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1758;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1759;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1552;
      }
      
      public function get commission() : int
      {
         return var_1757;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1359 = param1.readBoolean();
         var_1757 = param1.readInteger();
         var_1551 = param1.readInteger();
         var_1552 = param1.readInteger();
         var_1758 = param1.readInteger();
         var_1761 = param1.readInteger();
         var_1759 = param1.readInteger();
         var_1760 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1359;
      }
   }
}
