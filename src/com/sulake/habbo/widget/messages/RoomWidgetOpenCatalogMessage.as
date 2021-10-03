package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_1015:String = "RWOCM_CLUB_MAIN";
      
      public static const const_686:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1953:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_686);
         var_1953 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1953;
      }
   }
}
