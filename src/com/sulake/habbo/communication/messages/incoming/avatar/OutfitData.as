package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1844:String;
      
      private var var_640:String;
      
      private var var_1598:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1598 = param1.readInteger();
         var_1844 = param1.readString();
         var_640 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_640;
      }
      
      public function get figureString() : String
      {
         return var_1844;
      }
      
      public function get slotId() : int
      {
         return var_1598;
      }
   }
}
