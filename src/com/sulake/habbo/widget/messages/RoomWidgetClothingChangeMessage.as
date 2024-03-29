package com.sulake.habbo.widget.messages
{
   import com.sulake.core.window.IWindowContainer;
   
   public class RoomWidgetClothingChangeMessage extends RoomWidgetMessage
   {
      
      public static const const_318:String = "RWCCM_REQUEST_EDITOR";
       
      
      private var var_640:String = "";
      
      private var _window:IWindowContainer = null;
      
      private var _roomId:int = 0;
      
      private var var_152:int = 0;
      
      private var var_1653:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function RoomWidgetClothingChangeMessage(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:IWindowContainer)
      {
         super(param1);
         var_640 = param2;
         var_152 = param3;
         var_1653 = param4;
         _roomId = param5;
         _roomCategory = param6;
         _window = param7;
      }
      
      public function get gender() : String
      {
         return var_640;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      public function get objectId() : int
      {
         return var_152;
      }
      
      public function get objectCategory() : int
      {
         return var_1653;
      }
   }
}
