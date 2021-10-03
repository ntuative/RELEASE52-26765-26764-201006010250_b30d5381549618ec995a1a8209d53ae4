package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2175:int;
      
      private var var_2176:int;
      
      private var var_2300:Boolean;
      
      private var var_2302:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2301:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_2176 = param1;
         var_2175 = param2;
         var_2302 = param3;
         var_2301 = param4;
         var_2300 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2176,var_2175,var_2302,var_2301,int(var_2300)];
      }
      
      public function dispose() : void
      {
      }
   }
}
