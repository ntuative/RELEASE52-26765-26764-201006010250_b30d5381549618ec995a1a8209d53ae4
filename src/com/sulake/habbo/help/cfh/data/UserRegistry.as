package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1111:int = 80;
       
      
      private var var_512:Map;
      
      private var var_717:String = "";
      
      private var var_1257:Array;
      
      public function UserRegistry()
      {
         var_512 = new Map();
         var_1257 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_512.getValue(var_1257.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_717;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_512.getValue(param1) != null)
         {
            var_512.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_717);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_717 == "")
         {
            var_1257.push(param1);
         }
         var_512.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_512;
      }
      
      public function unregisterRoom() : void
      {
         var_717 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_512.length > const_1111)
         {
            _loc1_ = var_512.getKey(0);
            var_512.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_717 = param1;
         if(var_717 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
