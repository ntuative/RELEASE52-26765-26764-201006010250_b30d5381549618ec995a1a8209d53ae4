package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1485:Array;
      
      private var var_1852:int;
      
      private var var_1850:int;
      
      private var var_1851:int;
      
      private var var_1853:int;
      
      private var _dayOffsets:Array;
      
      private var var_1854:int;
      
      private var var_1486:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1485;
      }
      
      public function get furniTypeId() : int
      {
         return var_1850;
      }
      
      public function get historyLength() : int
      {
         return var_1853;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1851;
      }
      
      public function get offerCount() : int
      {
         return var_1854;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1486;
      }
      
      public function get averagePrice() : int
      {
         return var_1852;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1852 = param1.readInteger();
         var_1854 = param1.readInteger();
         var_1853 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1485 = [];
         var_1486 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1485.push(param1.readInteger());
            var_1486.push(param1.readInteger());
            _loc3_++;
         }
         var_1851 = param1.readInteger();
         var_1850 = param1.readInteger();
         return true;
      }
   }
}
