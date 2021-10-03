package com.sulake.habbo.help.help.data
{
   import com.sulake.core.utils.Map;
   
   public class FaqIndex
   {
       
      
      private var var_2400:int;
      
      private var _frontPageNormal:FaqCategory;
      
      private var var_2401:int;
      
      private var var_777:FaqCategory;
      
      private var var_778:FaqCategory;
      
      private var var_144:Map;
      
      public function FaqIndex()
      {
         super();
         var_778 = new FaqCategory(-999,"${help.faq.title.urgent}");
         _frontPageNormal = new FaqCategory(-9999,"${help.faq.title.normal}");
         var_777 = new FaqCategory(-99999,"${help.faq.title.searchresults}");
         var_144 = new Map();
      }
      
      public function getCategory(param1:int, param2:String = null, param3:Boolean = false) : FaqCategory
      {
         var _loc4_:FaqCategory = var_144.getValue(param1);
         if(_loc4_ != null || !param3)
         {
            return _loc4_;
         }
         _loc4_ = new FaqCategory(param1,param2);
         var_144.add(param1,_loc4_);
         return _loc4_;
      }
      
      public function get lastUpdatedQuestionId() : int
      {
         return var_2400;
      }
      
      public function getItem(param1:int, param2:int = -1) : FaqItem
      {
         if(param2 < 0)
         {
            return findItem(param1);
         }
         var _loc3_:FaqCategory = getCategory(param2);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getItem(param1);
      }
      
      public function storeAnswerText(param1:int, param2:String) : void
      {
         var _loc4_:* = null;
         if(var_778.hasItem(param1))
         {
            var_778.getItem(param1).answerText = param2;
         }
         if(_frontPageNormal.hasItem(param1))
         {
            _frontPageNormal.getItem(param1).answerText = param2;
         }
         if(var_777.hasItem(param1))
         {
            var_777.getItem(param1).answerText = param2;
         }
         var _loc3_:int = 0;
         while(_loc3_ < var_144.length)
         {
            _loc4_ = var_144.getWithIndex(_loc3_);
            if(_loc4_.hasItem(param1))
            {
               _loc4_.getItem(param1).answerText = param2;
            }
            _loc3_++;
         }
      }
      
      public function getFrontPageNormalCategory() : FaqCategory
      {
         return _frontPageNormal;
      }
      
      public function get lastUpdatedCategoryId() : int
      {
         return var_2401;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_144 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_144.length)
            {
               _loc2_ = var_144.getWithIndex(_loc1_);
               _loc2_.dispose();
               _loc1_++;
            }
            var_144.dispose();
            var_144 = null;
         }
         var_778.dispose();
         _frontPageNormal.dispose();
         var_777.dispose();
      }
      
      public function getFrontPageUrgentCategory() : FaqCategory
      {
         return var_778;
      }
      
      public function getCategoryByIndex(param1:int) : FaqCategory
      {
         if(param1 >= var_144.length)
         {
            return null;
         }
         return var_144.getWithIndex(param1);
      }
      
      private function findItem(param1:int) : FaqItem
      {
         var _loc3_:* = null;
         if(var_778.hasItem(param1))
         {
            return var_778.getItem(param1);
         }
         if(_frontPageNormal.hasItem(param1))
         {
            return _frontPageNormal.getItem(param1);
         }
         if(var_777.hasItem(param1))
         {
            return var_777.getItem(param1);
         }
         var _loc2_:int = 0;
         while(_loc2_ < var_144.length)
         {
            _loc3_ = var_144.getWithIndex(_loc2_);
            if(_loc3_.hasItem(param1))
            {
               return _loc3_.getItem(param1);
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getCategoryTitleArray() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < var_144.length)
         {
            _loc2_ = var_144.getWithIndex(_loc3_);
            if(_loc2_ != null)
            {
               _loc1_.push(_loc2_.categoryTitle);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getSearchResultCategory() : FaqCategory
      {
         return var_777;
      }
      
      public function getCategoryCount() : int
      {
         return var_144.length;
      }
   }
}
