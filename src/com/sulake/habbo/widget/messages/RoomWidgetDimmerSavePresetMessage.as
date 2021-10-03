package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_709:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2175:int;
      
      private var var_2176:int;
      
      private var var_2174:Boolean;
      
      private var var_1058:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_709);
         var_2176 = param1;
         var_2175 = param2;
         _color = param3;
         var_1058 = param4;
         var_2174 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_2175;
      }
      
      public function get presetNumber() : int
      {
         return var_2176;
      }
      
      public function get brightness() : int
      {
         return var_1058;
      }
      
      public function get apply() : Boolean
      {
         return var_2174;
      }
   }
}
