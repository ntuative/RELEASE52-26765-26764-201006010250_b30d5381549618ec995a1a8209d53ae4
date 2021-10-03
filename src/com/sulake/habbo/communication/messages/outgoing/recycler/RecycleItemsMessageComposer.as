package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_901:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_901 = new Array();
         var_901.push(param1.length);
         var_901 = var_901.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_901;
      }
   }
}
