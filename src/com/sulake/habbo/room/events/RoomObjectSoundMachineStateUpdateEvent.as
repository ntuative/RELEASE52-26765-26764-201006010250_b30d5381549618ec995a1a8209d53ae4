package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectSoundMachineStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_976:String = "ROSM_SOUND_MACHINE_SWITCHED_ON";
      
      public static const const_1202:String = "ROSM_JUKEBOX_INIT";
      
      public static const const_1386:String = "ROSM_SOUND_MACHINE_SWITCHED_OFF";
      
      public static const const_837:String = "ROSM_DISPOSE";
       
      
      private var var_2110:String;
      
      public function RoomObjectSoundMachineStateUpdateEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param3,param1,param2,param4,param5);
         var_2110 = param3;
      }
      
      public function get updateType() : String
      {
         return var_2110;
      }
   }
}
