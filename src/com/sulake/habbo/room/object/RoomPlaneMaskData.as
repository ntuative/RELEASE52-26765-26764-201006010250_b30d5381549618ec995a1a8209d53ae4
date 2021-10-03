package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1668:Number = 0.0;
      
      private var var_1666:Number = 0.0;
      
      private var var_1665:Number = 0.0;
      
      private var var_1667:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1666 = param1;
         var_1665 = param2;
         var_1668 = param3;
         var_1667 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1666;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1668;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1665;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1667;
      }
   }
}
