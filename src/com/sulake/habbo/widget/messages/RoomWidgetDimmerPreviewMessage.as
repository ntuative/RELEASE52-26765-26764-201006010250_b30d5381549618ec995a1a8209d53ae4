package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const const_753:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var var_1058:int;
      
      private var _color:uint;
      
      private var var_1984:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super(const_753);
         _color = param1;
         var_1058 = param2;
         var_1984 = param3;
      }
      
      public function get brightness() : int
      {
         return var_1058;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_1984;
      }
   }
}
