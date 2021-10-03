package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_765:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_765 = new ByteArray();
         var_765.writeShort(param1);
         var_765.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_765.position = 0;
         if(false)
         {
            _loc1_ = var_765.readShort();
            var_765.position = 0;
         }
         return _loc1_;
      }
   }
}
