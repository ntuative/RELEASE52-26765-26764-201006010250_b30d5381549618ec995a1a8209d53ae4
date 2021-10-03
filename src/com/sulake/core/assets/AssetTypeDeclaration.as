package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1700:Class;
      
      private var var_1698:Class;
      
      private var var_1699:String;
      
      private var var_1161:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1699 = param1;
         var_1698 = param2;
         var_1700 = param3;
         if(rest == null)
         {
            var_1161 = new Array();
         }
         else
         {
            var_1161 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1700;
      }
      
      public function get assetClass() : Class
      {
         return var_1698;
      }
      
      public function get mimeType() : String
      {
         return var_1699;
      }
      
      public function get fileTypes() : Array
      {
         return var_1161;
      }
   }
}
