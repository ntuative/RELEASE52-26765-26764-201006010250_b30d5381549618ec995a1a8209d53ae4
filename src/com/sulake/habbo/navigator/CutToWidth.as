package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_390:int;
      
      private var var_178:String;
      
      private var var_190:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_178 = param1;
         var_190 = param2;
         var_390 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_190.text = var_178.substring(0,param1) + "...";
         return var_190.textWidth > var_390;
      }
   }
}
