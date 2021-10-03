package com.sulake.habbo.communication.messages.outgoing.catalog
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SelectClubGiftComposer implements IMessageComposer
   {
       
      
      private var var_1162:String;
      
      public function SelectClubGiftComposer(param1:String)
      {
         super();
         var_1162 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1162];
      }
      
      public function dispose() : void
      {
         var_1162 = null;
      }
   }
}
