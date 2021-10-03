package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1706:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1480:String = "ROE_MOUSE_ENTER";
      
      public static const const_427:String = "ROE_MOUSE_MOVE";
      
      public static const const_1637:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_211:String = "ROE_MOUSE_CLICK";
      
      public static const const_470:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1938:Boolean;
      
      private var var_1936:Boolean;
      
      private var var_1935:Boolean;
      
      private var var_1937:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1935 = param4;
         var_1937 = param5;
         var_1938 = param6;
         var_1936 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1936;
      }
      
      public function get altKey() : Boolean
      {
         return var_1935;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1937;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1938;
      }
   }
}
