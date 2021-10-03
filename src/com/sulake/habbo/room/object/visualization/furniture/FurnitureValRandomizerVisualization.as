package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1136:int = 31;
      
      private static const const_1137:int = 32;
      
      private static const const_522:int = 30;
      
      private static const const_795:int = 20;
      
      private static const const_521:int = 10;
       
      
      private var var_642:Boolean = false;
      
      private var var_241:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_241 = new Array();
         super();
         super.setAnimation(const_522);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_642 = true;
            var_241 = new Array();
            var_241.push(const_1136);
            var_241.push(const_1137);
            return;
         }
         if(param1 > 0 && param1 <= const_521)
         {
            if(var_642)
            {
               var_642 = false;
               var_241 = new Array();
               if(_direction == 2)
               {
                  var_241.push(const_795 + 5 - param1);
                  var_241.push(const_521 + 5 - param1);
               }
               else
               {
                  var_241.push(const_795 + param1);
                  var_241.push(const_521 + param1);
               }
               var_241.push(const_522);
               return;
            }
            super.setAnimation(const_522);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
         {
            if(false)
            {
               super.setAnimation(var_241.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
