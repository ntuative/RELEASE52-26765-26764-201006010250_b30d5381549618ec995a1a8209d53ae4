package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1034:String = "select_outfit";
       
      
      private var var_2264:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1034);
         var_2264 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2264;
      }
   }
}
