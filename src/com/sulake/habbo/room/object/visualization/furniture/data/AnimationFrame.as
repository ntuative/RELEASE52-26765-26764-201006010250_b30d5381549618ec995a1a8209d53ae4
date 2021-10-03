package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_651:int = -1;
      
      public static const const_911:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_2031:int = -1;
      
      private var var_88:int = 0;
      
      private var var_1296:int = 1;
      
      private var var_897:int = 1;
      
      private var var_2032:Boolean = false;
      
      private var var_2030:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_2032 = param5;
         if(param4 < 0)
         {
            param4 = const_651;
         }
         var_897 = param4;
         var_1296 = param4;
         if(param6 >= 0)
         {
            var_2031 = param6;
            var_2030 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_897 > 0 && param1 > var_897)
         {
            param1 = var_897;
         }
         var_1296 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_897;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2030;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_897 < 0)
         {
            return const_651;
         }
         return var_1296;
      }
      
      public function get activeSequence() : int
      {
         return var_2031;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2032;
      }
      
      public function get x() : int
      {
         return var_88;
      }
   }
}
