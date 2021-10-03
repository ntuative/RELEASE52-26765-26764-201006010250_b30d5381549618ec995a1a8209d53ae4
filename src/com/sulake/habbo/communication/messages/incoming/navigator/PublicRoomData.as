package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1687:int;
      
      private var var_1863:String;
      
      private var var_1686:int;
      
      private var _disposed:Boolean;
      
      private var var_1862:int;
      
      private var var_1864:String;
      
      private var var_1241:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1864 = param1.readString();
         var_1687 = param1.readInteger();
         var_1686 = param1.readInteger();
         var_1863 = param1.readString();
         var_1862 = param1.readInteger();
         var_1241 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1862;
      }
      
      public function get worldId() : int
      {
         return var_1686;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1864;
      }
      
      public function get unitPort() : int
      {
         return var_1687;
      }
      
      public function get castLibs() : String
      {
         return var_1863;
      }
      
      public function get nodeId() : int
      {
         return var_1241;
      }
   }
}
