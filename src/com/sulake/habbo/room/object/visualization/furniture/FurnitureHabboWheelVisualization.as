package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1136:int = 31;
      
      private static const const_1137:int = 32;
      
      private static const const_795:int = 10;
      
      private static const const_521:int = 20;
       
      
      private var var_642:Boolean = false;
      
      private var var_241:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_241 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_642 = true;
            var_241 = new Array();
            var_241.push(const_1136);
            var_241.push(const_1137);
            return;
         }
         if(param1 > 0 && param1 <= const_795)
         {
            if(var_642)
            {
               var_642 = false;
               var_241 = new Array();
               var_241.push(const_795 + param1);
               var_241.push(const_521 + param1);
               var_241.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
