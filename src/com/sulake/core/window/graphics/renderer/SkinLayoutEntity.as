package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_277:uint = 1;
      
      public static const const_392:uint = 0;
      
      public static const const_984:uint = 8;
      
      public static const const_252:uint = 4;
      
      public static const const_376:uint = 2;
       
      
      private var var_441:uint;
      
      private var var_2057:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2056:uint;
      
      private var var_99:Rectangle;
      
      private var var_661:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_99 = param3;
         _color = param4;
         var_441 = param5;
         var_2057 = param6;
         var_2056 = param7;
         var_661 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2057;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_441;
      }
      
      public function get scaleV() : uint
      {
         return var_2056;
      }
      
      public function get tags() : Array
      {
         return var_661;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_99 = null;
         var_661 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_99;
      }
   }
}
