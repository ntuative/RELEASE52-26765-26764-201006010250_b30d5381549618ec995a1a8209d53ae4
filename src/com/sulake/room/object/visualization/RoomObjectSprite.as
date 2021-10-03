package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1152:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_1895:Boolean = false;
      
      private var var_1896:String = "normal";
      
      private var var_1388:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_345:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_1701:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1124:Boolean = false;
      
      private var var_1125:Boolean = false;
      
      private var var_1892:Boolean = false;
      
      private var _offset:Point;
      
      private var var_1894:Boolean = true;
      
      private var var_1024:Number = 0;
      
      private var _width:int = 0;
      
      private var var_1893:String = "";
      
      private var var_952:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
         _instanceId = var_1152++;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_1125 = param1;
         ++_updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1892 = param1;
         ++_updateID;
      }
      
      public function dispose() : void
      {
         var_952 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_1896 = param1;
         ++_updateID;
      }
      
      public function set tag(param1:String) : void
      {
         var_1893 = param1;
         ++_updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1388 = param1;
         ++_updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1895;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
         ++_updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
         ++_updateID;
      }
      
      public function get relativeDepth() : Number
      {
         return var_1024;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get alpha() : int
      {
         return var_1701;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_1894 = param1;
         ++_updateID;
      }
      
      public function get visible() : Boolean
      {
         return var_345;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1895 = param1;
         ++_updateID;
      }
      
      public function get flipH() : Boolean
      {
         return var_1124;
      }
      
      public function get flipV() : Boolean
      {
         return var_1125;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1892;
      }
      
      public function get blendMode() : String
      {
         return var_1896;
      }
      
      public function get instanceId() : int
      {
         return _instanceId;
      }
      
      public function get tag() : String
      {
         return var_1893;
      }
      
      public function get assetName() : String
      {
         return var_1388;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_1024 = param1;
         ++_updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_1894;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         var_1701 = param1;
         ++_updateID;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get updateId() : int
      {
         return _updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         _color = param1;
         ++_updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            _width = param1.width;
            _height = param1.height;
         }
         var_952 = param1;
         ++_updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_345 = param1;
         ++_updateID;
      }
      
      public function get asset() : BitmapData
      {
         return var_952;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_1124 = param1;
         ++_updateID;
      }
   }
}
