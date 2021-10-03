package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1765:int;
      
      private var var_1764:Boolean;
      
      private var _offerId:int;
      
      private var var_1766:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1764 = param1.readBoolean();
         var_1765 = param1.readInteger();
         var_1766 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1766;
      }
      
      public function get monthsRequired() : int
      {
         return var_1765;
      }
      
      public function get isVip() : Boolean
      {
         return var_1764;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
