package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2290:int;
      
      private var var_2289:String;
      
      private var var_1547:IActionDefinition;
      
      private var var_2291:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2293:String;
      
      private var var_2292:String;
      
      private var var_2023:Boolean;
      
      private var var_2288:ColorTransform;
      
      private var var_2250:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2289 = param1;
         var_2293 = param2;
         var_2290 = param3;
         _color = param4;
         _frames = param5;
         var_1547 = param6;
         var_2023 = param7;
         var_2250 = param8;
         var_2292 = param9;
         var_2291 = param10;
         var_2288 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_2023;
      }
      
      public function get partType() : String
      {
         return var_2293;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_2250;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2291;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2290;
      }
      
      public function get flippedPartType() : String
      {
         return var_2292;
      }
      
      public function get bodyPartId() : String
      {
         return var_2289;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1547;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2288;
      }
   }
}
