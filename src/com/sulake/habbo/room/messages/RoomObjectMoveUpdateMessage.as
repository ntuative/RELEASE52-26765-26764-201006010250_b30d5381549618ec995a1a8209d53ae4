package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectMoveUpdateMessage extends RoomObjectUpdateMessage
   {
       
      
      private var var_439:IVector3d;
      
      public function RoomObjectMoveUpdateMessage(param1:IVector3d, param2:IVector3d, param3:IVector3d)
      {
         super(param1,param3);
         var_439 = param2;
      }
      
      public function get realTargetLoc() : IVector3d
      {
         return var_439;
      }
      
      public function get targetLoc() : IVector3d
      {
         if(var_439 == null)
         {
            return loc;
         }
         return var_439;
      }
   }
}
