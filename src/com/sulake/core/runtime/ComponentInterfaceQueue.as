package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1328:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_913:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1328 = param1;
         var_913 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_913;
      }
      
      public function get identifier() : IID
      {
         return var_1328;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1328 = null;
            while(false)
            {
               var_913.pop();
            }
            var_913 = null;
         }
      }
   }
}
