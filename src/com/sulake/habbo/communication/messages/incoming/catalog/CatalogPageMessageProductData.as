package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_232:String = "e";
      
      public static const const_82:String = "i";
      
      public static const const_84:String = "s";
       
      
      private var var_1111:String;
      
      private var var_1382:String;
      
      private var var_1379:int;
      
      private var var_1692:int;
      
      private var var_1110:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1382 = param1.readString();
         var_1692 = param1.readInteger();
         var_1111 = param1.readString();
         var_1110 = param1.readInteger();
         var_1379 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1110;
      }
      
      public function get productType() : String
      {
         return var_1382;
      }
      
      public function get expiration() : int
      {
         return var_1379;
      }
      
      public function get furniClassId() : int
      {
         return var_1692;
      }
      
      public function get extraParam() : String
      {
         return var_1111;
      }
   }
}
