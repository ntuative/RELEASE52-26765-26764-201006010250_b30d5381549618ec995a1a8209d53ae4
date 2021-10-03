package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_436:uint;
      
      private var var_1068:IUnknown;
      
      private var var_1297:String;
      
      private var var_1069:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1069 = param1;
         var_1297 = getQualifiedClassName(var_1069);
         var_1068 = param2;
         var_436 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1069;
      }
      
      public function get disposed() : Boolean
      {
         return var_1068 == null;
      }
      
      public function get references() : uint
      {
         return var_436;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_436) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1068;
      }
      
      public function get iis() : String
      {
         return var_1297;
      }
      
      public function reserve() : uint
      {
         return ++var_436;
      }
      
      public function dispose() : void
      {
         var_1069 = null;
         var_1297 = null;
         var_1068 = null;
         var_436 = 0;
      }
   }
}
