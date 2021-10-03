package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1439:String;
      
      private var var_658:String;
      
      private var var_1440:String;
      
      private var var_1441:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1441 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1439 = _loc5_[0];
         var_1440 = _loc5_[1];
         _name = param2;
         var_658 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1439;
      }
      
      public function get languageCode() : String
      {
         return var_1441;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_658;
      }
      
      public function get encoding() : String
      {
         return var_1440;
      }
      
      public function get id() : String
      {
         return var_1441 + "_" + var_1439 + "." + var_1440;
      }
   }
}
