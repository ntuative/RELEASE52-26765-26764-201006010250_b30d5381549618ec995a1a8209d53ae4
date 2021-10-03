package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1119:int = 1;
      
      private static const const_1137:int = 3;
      
      private static const const_1118:int = 2;
      
      private static const const_1117:int = 15;
       
      
      private var var_868:int;
      
      private var var_241:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_241 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1118)
         {
            var_241 = new Array();
            var_241.push(const_1119);
            var_868 = const_1117;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_868 > 0)
         {
            --var_868;
         }
         if(var_868 == 0)
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
