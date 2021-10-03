package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_2049:String = "";
      
      private var var_152:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_2049 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_152 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_2049;
      }
      
      public function get objectId() : String
      {
         return var_152;
      }
   }
}
