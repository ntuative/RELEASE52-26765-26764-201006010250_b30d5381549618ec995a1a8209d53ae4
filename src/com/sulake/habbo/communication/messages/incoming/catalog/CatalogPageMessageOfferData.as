package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_864:Array;
      
      private var var_937:int;
      
      private var var_1357:String;
      
      private var _offerId:int;
      
      private var var_936:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1357 = param1.readString();
         var_937 = param1.readInteger();
         var_936 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_864 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_864.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_864;
      }
      
      public function get priceInCredits() : int
      {
         return var_937;
      }
      
      public function get localizationId() : String
      {
         return var_1357;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_936;
      }
   }
}
