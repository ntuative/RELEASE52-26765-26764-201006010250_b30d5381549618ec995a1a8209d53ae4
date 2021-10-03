package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1752:int;
      
      private var var_1228:int;
      
      private var var_1750:int;
      
      private var _offerId:int;
      
      private var var_1753:int;
      
      private var var_1751:int;
      
      private var var_1754:Boolean;
      
      private var var_1755:int;
      
      private var var_1756:Boolean;
      
      private var var_1162:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1162 = param1.readString();
         var_1228 = param1.readInteger();
         var_1756 = param1.readBoolean();
         var_1754 = param1.readBoolean();
         var_1750 = param1.readInteger();
         var_1755 = param1.readInteger();
         var_1753 = param1.readInteger();
         var_1752 = param1.readInteger();
         var_1751 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1753;
      }
      
      public function get month() : int
      {
         return var_1752;
      }
      
      public function get price() : int
      {
         return var_1228;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1750;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1755;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1756;
      }
      
      public function get day() : int
      {
         return var_1751;
      }
      
      public function get vip() : Boolean
      {
         return var_1754;
      }
      
      public function get productCode() : String
      {
         return var_1162;
      }
   }
}
