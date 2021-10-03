package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_590:Array;
      
      private var var_1228:int;
      
      private var var_1480:Array;
      
      private var var_591:Array;
      
      private var var_1359:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1359 = _loc2_.isWrappingEnabled;
         var_1228 = _loc2_.wrappingPrice;
         var_1480 = _loc2_.stuffTypes;
         var_591 = _loc2_.boxTypes;
         var_590 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_590;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1480;
      }
      
      public function get price() : int
      {
         return var_1228;
      }
      
      public function get boxTypes() : Array
      {
         return var_591;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1359;
      }
   }
}
