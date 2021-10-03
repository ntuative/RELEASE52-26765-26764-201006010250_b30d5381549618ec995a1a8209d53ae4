package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1996:Array;
      
      private var var_1994:String;
      
      private var var_1995:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1994 = param1;
         var_1996 = param2;
         var_1995 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1994;
      }
      
      public function get yieldList() : Array
      {
         return var_1996;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1995;
      }
   }
}
