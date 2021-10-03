package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_926:String = "inventory_badges";
      
      public static const const_1210:String = "inventory_clothes";
      
      public static const const_1257:String = "inventory_furniture";
      
      public static const const_737:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_916:String = "inventory_effects";
       
      
      private var var_1781:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_737);
         var_1781 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1781;
      }
   }
}
