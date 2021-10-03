package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_640:String;
      
      private var _id:int;
      
      private var var_2033:String = "";
      
      private var var_2034:int;
      
      private var var_2035:String;
      
      private var var_2023:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2034 = parseInt(param1.@pattern);
         var_640 = String(param1.@gender);
         var_2023 = Boolean(parseInt(param1.@colorable));
         var_2033 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2033;
      }
      
      public function get isColorable() : Boolean
      {
         return var_2023;
      }
      
      public function get gender() : String
      {
         return var_640;
      }
      
      public function get patternId() : int
      {
         return var_2034;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2035;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2035 = param1;
      }
   }
}
