package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1174:int;
      
      private var var_1173:String;
      
      private var var_1957:String;
      
      private var _index:int;
      
      private var var_1958:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1174 = param1;
         var_1957 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1173;
      }
      
      public function get questionId() : int
      {
         return var_1174;
      }
      
      public function get questionText() : String
      {
         return var_1957;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1173 = param1;
         var_1958 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1958;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
