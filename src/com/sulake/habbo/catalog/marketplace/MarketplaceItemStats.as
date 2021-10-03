package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1485:Array;
      
      private var var_1852:int;
      
      private var var_1850:int;
      
      private var var_1853:int;
      
      private var var_1851:int;
      
      private var _dayOffsets:Array;
      
      private var var_1854:int;
      
      private var var_1486:Array;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrices(param1:Array) : void
      {
         var_1485 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1850;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1486 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1852 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1853;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1851;
      }
      
      public function get offerCount() : int
      {
         return var_1854;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1854 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1486;
      }
      
      public function get averagePrice() : int
      {
         return var_1852;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1851 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1853 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1850 = param1;
      }
   }
}
