package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_455:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_491:int = 0;
      
      public static const const_918:int = 2;
      
      public static const const_1051:int = 1;
      
      public static const const_757:Boolean = false;
      
      public static const const_708:String = "";
      
      public static const const_496:int = 0;
      
      public static const const_441:int = 0;
      
      public static const const_447:int = 0;
       
      
      private var var_1928:int = 0;
      
      private var var_1893:String = "";
      
      private var var_1629:int = 0;
      
      private var var_1927:int = 0;
      
      private var var_1929:Number = 0;
      
      private var var_1701:int = 255;
      
      private var var_1930:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1928;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1629 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1929;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1927 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1928 = param1;
      }
      
      public function get tag() : String
      {
         return var_1893;
      }
      
      public function get alpha() : int
      {
         return var_1701;
      }
      
      public function get ink() : int
      {
         return var_1629;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1929 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1927;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1930 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1930;
      }
      
      public function set tag(param1:String) : void
      {
         var_1893 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1701 = param1;
      }
   }
}
