package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2231:String;
      
      private var var_1384:String;
      
      private var var_2232:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2232 = param1;
         var_1384 = param2;
         var_2231 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2232,var_1384,var_2231];
      }
      
      public function dispose() : void
      {
      }
   }
}
