package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1213:String = "door";
      
      public static const const_507:String = "window";
      
      public static const const_530:String = "RORMUM_ADD_MASK";
      
      public static const const_401:String = "RORMUM_ADD_MASK";
      
      public static const const_223:String = "hole";
       
      
      private var var_1743:String = "";
      
      private var var_1740:String = "";
      
      private var var_1742:String = "window";
      
      private var var_1741:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         _type = param1;
         var_1740 = param2;
         var_1743 = param3;
         if(param4 != null)
         {
            var_1741 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_1742 = param5;
      }
      
      public function get maskCategory() : String
      {
         return var_1742;
      }
      
      public function get maskId() : String
      {
         return var_1740;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_1741;
      }
      
      public function get maskType() : String
      {
         return var_1743;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
