package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var _id:String;
      
      private var var_2201:IAnimation;
      
      private var var_2200:Boolean;
      
      private var var_1629:int;
      
      private var var_1365:Array;
      
      private var var_2202:String;
      
      private var _dx:Array;
      
      private var var_1364:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         var_2201 = param1;
         _id = String(param2.@id);
         var_1629 = parseInt(param2.@ink);
         var_2202 = String(param2.@member);
         var_2200 = Boolean(parseInt(param2.@directions));
         _dx = [];
         var_1364 = [];
         var_1365 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            _dx[_loc4_] = parseInt(_loc3_.@dx);
            var_1364[_loc4_] = parseInt(_loc3_.@dy);
            var_1365[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function get animation() : IAnimation
      {
         return var_2201;
      }
      
      public function get hasDirections() : Boolean
      {
         return var_2200;
      }
      
      public function get member() : String
      {
         return var_2202;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < var_1365.length)
         {
            return var_1365[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < _dx.length)
         {
            return _dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < var_1364.length)
         {
            return var_1364[param1];
         }
         return 0;
      }
      
      public function get ink() : int
      {
         return var_1629;
      }
   }
}
