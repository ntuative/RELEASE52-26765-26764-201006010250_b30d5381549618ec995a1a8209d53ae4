package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1817:Date;
      
      private var var_1209:Boolean = false;
      
      private var _type:int;
      
      private var var_381:BitmapData;
      
      private var var_252:Boolean = false;
      
      private var var_1387:int;
      
      private var var_589:int = 1;
      
      private var var_1007:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_381;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_589;
         if(var_589 < 0)
         {
            var_589 = 0;
         }
         var_1007 = var_1387;
         var_252 = false;
         var_1209 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1007 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_252;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_381 = param1;
      }
      
      public function get duration() : int
      {
         return var_1387;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1209;
      }
      
      public function get effectsInInventory() : int
      {
         return var_589;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_381;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_252)
         {
            var_1817 = new Date();
         }
         var_252 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_589 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_252)
         {
            _loc1_ = var_1007 - (new Date().valueOf() - var_1817.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1007;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1209 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1387 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
