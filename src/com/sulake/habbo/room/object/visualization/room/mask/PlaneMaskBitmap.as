package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_54:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_1999:Number = -1.0;
      
      private var var_952:IGraphicAsset = null;
      
      private var var_1998:Number = 1.0;
      
      private var var_1997:Number = -1.0;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         var_1999 = param2;
         _normalMaxX = param3;
         var_1997 = param4;
         var_1998 = param5;
         var_952 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1998;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_1999;
      }
      
      public function get normalMinY() : Number
      {
         return var_1997;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_952;
      }
      
      public function dispose() : void
      {
         var_952 = null;
      }
   }
}
