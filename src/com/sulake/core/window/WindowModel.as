package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_383:Rectangle;
      
      protected var _param:uint;
      
      protected var var_148:Rectangle;
      
      protected var _type:uint;
      
      protected var var_1143:Boolean = true;
      
      protected var var_147:Rectangle;
      
      protected var var_560:uint = 16777215;
      
      protected var var_36:uint;
      
      protected var var_559:uint = 10;
      
      protected var var_80:uint;
      
      protected var var_345:Boolean = true;
      
      protected var var_331:String = "";
      
      protected var var_75:WindowRectLimits;
      
      protected var var_1416:uint;
      
      protected var var_660:Boolean = false;
      
      protected var var_441:Number = 1.0;
      
      protected var var_57:Rectangle;
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var var_8:Rectangle;
      
      protected var var_16:WindowContext;
      
      protected var var_661:Array;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         _id = param1;
         _name = param2;
         _type = param3;
         _param = param5;
         var_36 = WindowState.const_90;
         var_80 = param4;
         var_661 = param8 == null ? new Array() : param8;
         var_16 = param6;
         var_8 = param7.clone();
         var_383 = param7.clone();
         var_57 = param7.clone();
         var_147 = new Rectangle();
         var_148 = null;
         var_75 = new WindowRectLimits(this as IWindow);
      }
      
      public function getMinHeight() : int
      {
         return var_75.minHeight;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_type & param2 ^ param1) == 0;
         }
         return (_type & param1) == param1;
      }
      
      public function getMinWidth() : int
      {
         return var_75.minWidth;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get param() : uint
      {
         return _param;
      }
      
      public function get state() : uint
      {
         return var_36;
      }
      
      public function getMaximizedWidth() : int
      {
         return var_148.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return var_147.height;
      }
      
      public function get limits() : IRectLimiter
      {
         return var_75;
      }
      
      public function get tags() : Array
      {
         return var_661;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_36 & param2 ^ param1) == 0;
         }
         return (var_36 & param1) == param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_8 = null;
            var_36 = WindowState.const_391;
            var_661 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get height() : int
      {
         return var_8.height;
      }
      
      public function get position() : Point
      {
         return var_8.topLeft;
      }
      
      public function get background() : Boolean
      {
         return var_660;
      }
      
      public function get context() : IWindowContext
      {
         return var_16;
      }
      
      public function get mouseTreshold() : uint
      {
         return var_559;
      }
      
      public function get style() : uint
      {
         return var_80;
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_param & param2 ^ param1) == 0;
         }
         return (_param & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_80 & param2 ^ param1) == 0;
         }
         return (var_80 & param1) == param1;
      }
      
      public function getMaxWidth() : int
      {
         return var_75.maxWidth;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return false;
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function get clipping() : Boolean
      {
         return var_1143;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.minWidth = param1;
         return _loc2_;
      }
      
      public function get width() : int
      {
         return var_8.width;
      }
      
      public function hasMinHeight() : Boolean
      {
         return false;
      }
      
      public function get blend() : Number
      {
         return var_441;
      }
      
      public function getInitialHeight() : int
      {
         return var_383.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return var_147.width;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.minHeight = param1;
         return _loc2_;
      }
      
      public function getInitialWidth() : int
      {
         return var_383.width;
      }
      
      public function getPreviousWidth() : int
      {
         return var_57.width;
      }
      
      public function hasMinWidth() : Boolean
      {
         return false;
      }
      
      public function get color() : uint
      {
         return var_560;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.maxHeight = param1;
         return _loc2_;
      }
      
      public function get caption() : String
      {
         return var_331;
      }
      
      public function get rectangle() : Rectangle
      {
         return var_8;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_75.maxWidth = param1;
         return _loc2_;
      }
      
      public function get visible() : Boolean
      {
         return var_345;
      }
      
      public function getMaxHeight() : int
      {
         return var_75.maxHeight;
      }
      
      public function get x() : int
      {
         return var_8.x;
      }
      
      public function get y() : int
      {
         return var_8.y;
      }
      
      public function getPreviousHeight() : int
      {
         return var_57.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return false;
      }
      
      public function getMaximizedHeight() : int
      {
         return var_148.height;
      }
   }
}
