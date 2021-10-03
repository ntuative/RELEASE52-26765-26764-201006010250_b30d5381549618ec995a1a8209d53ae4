package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_368:Number = 0.5;
      
      private static const const_797:int = 3;
      
      private static const const_1145:Number = 1;
       
      
      private var var_2075:Boolean = false;
      
      private var var_2073:Boolean = false;
      
      private var var_1073:int = 0;
      
      private var var_277:Vector3d = null;
      
      private var var_2079:int = 0;
      
      private var var_2076:int = 0;
      
      private var var_2080:Boolean = false;
      
      private var var_2072:int = -2;
      
      private var var_2074:Boolean = false;
      
      private var var_2071:int = 0;
      
      private var var_2077:int = -1;
      
      private var var_439:Vector3d = null;
      
      private var var_2078:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_2079;
      }
      
      public function get targetId() : int
      {
         return var_2077;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_2071 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_2079 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_2075 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_2077 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_2073 = param1;
      }
      
      public function dispose() : void
      {
         var_439 = null;
         var_277 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_439 == null)
         {
            var_439 = new Vector3d();
         }
         var_439.assign(param1);
         var_1073 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_2072;
      }
      
      public function get screenHt() : int
      {
         return var_2078;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_2076 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_277;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_2078 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_2071;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_2075;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_2073;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_439 != null && var_277 != null)
         {
            ++var_1073;
            _loc2_ = Vector3d.dif(var_439,var_277);
            if(_loc2_.length <= const_368)
            {
               var_277 = var_439;
               var_439 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_368 * (const_797 + 1))
               {
                  _loc2_.mul(const_368);
               }
               else if(var_1073 <= const_797)
               {
                  _loc2_.mul(const_368);
               }
               else
               {
                  _loc2_.mul(const_1145);
               }
               var_277 = Vector3d.sum(var_277,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_2080 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_2076;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_2074 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_2072 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_277 != null)
         {
            return;
         }
         var_277 = new Vector3d();
         var_277.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_2080;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_2074;
      }
   }
}
