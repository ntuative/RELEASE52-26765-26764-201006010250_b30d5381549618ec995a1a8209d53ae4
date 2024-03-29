package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_962:String = "price_type_none";
      
      public static const const_502:String = "pricing_model_multi";
      
      public static const const_316:String = "price_type_credits";
      
      public static const const_456:String = "price_type_credits_and_pixels";
      
      public static const const_451:String = "pricing_model_bundle";
      
      public static const const_398:String = "pricing_model_single";
      
      public static const const_762:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1226:String = "pricing_model_unknown";
      
      public static const const_380:String = "price_type_pixels";
       
      
      private var var_2189:int;
      
      private var var_937:int;
      
      private var _offerId:int;
      
      private var var_936:int;
      
      private var var_450:String;
      
      private var var_638:String;
      
      private var var_423:ICatalogPage;
      
      private var var_449:IProductContainer;
      
      private var var_1357:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1357 = param1.localizationId;
         var_937 = param1.priceInCredits;
         var_936 = param1.priceInPixels;
         var_423 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_450;
      }
      
      public function get page() : ICatalogPage
      {
         return var_423;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2189 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_449;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_936;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1357 = "";
         var_937 = 0;
         var_936 = 0;
         var_423 = null;
         if(var_449 != null)
         {
            var_449.dispose();
            var_449 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2189;
      }
      
      public function get priceInCredits() : int
      {
         return var_937;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_450 = const_398;
            }
            else
            {
               var_450 = const_502;
            }
         }
         else if(param1.length > 1)
         {
            var_450 = const_451;
         }
         else
         {
            var_450 = const_1226;
         }
      }
      
      public function get priceType() : String
      {
         return var_638;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_450)
         {
            case const_398:
               var_449 = new SingleProductContainer(this,param1);
               break;
            case const_502:
               var_449 = new MultiProductContainer(this,param1);
               break;
            case const_451:
               var_449 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_450);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1357;
      }
      
      private function analyzePriceType() : void
      {
         if(var_937 > 0 && var_936 > 0)
         {
            var_638 = const_456;
         }
         else if(var_937 > 0)
         {
            var_638 = const_316;
         }
         else if(var_936 > 0)
         {
            var_638 = const_380;
         }
         else
         {
            var_638 = const_962;
         }
      }
   }
}
