package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PickupObjectMessageComposer implements IMessageComposer
   {
       
      
      private var _roomCategory:int;
      
      private var _roomId:int;
      
      private var var_152:int;
      
      private var var_1653:int;
      
      public function PickupObjectMessageComposer(param1:int, param2:int, param3:int = 0, param4:int = 0)
      {
         super();
         var_152 = param1;
         var_1653 = param2;
         _roomId = param3;
         _roomCategory = param4;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:int = 0;
         switch(var_1653)
         {
            case RoomObjectCategoryEnum.const_34:
               _loc1_ = 2;
               break;
            case RoomObjectCategoryEnum.const_32:
               _loc1_ = 1;
               break;
            default:
               return [];
         }
         return [_loc1_,var_152];
      }
      
      public function dispose() : void
      {
      }
   }
}
