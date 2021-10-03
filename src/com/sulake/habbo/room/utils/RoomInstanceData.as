package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_824:LegacyWallGeometry = null;
      
      private var var_579:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_578:TileHeightMap = null;
      
      private var var_1768:String = null;
      
      private var _roomId:int = 0;
      
      private var var_577:SelectedRoomObjectData = null;
      
      private var var_823:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_824 = new LegacyWallGeometry();
         var_823 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_579 != null)
         {
            var_579.dispose();
         }
         var_579 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_578 != null)
         {
            var_578.dispose();
         }
         var_578 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1768 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_824;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_577;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_823;
      }
      
      public function dispose() : void
      {
         if(var_578 != null)
         {
            var_578.dispose();
            var_578 = null;
         }
         if(var_824 != null)
         {
            var_824.dispose();
            var_824 = null;
         }
         if(var_823 != null)
         {
            var_823.dispose();
            var_823 = null;
         }
         if(var_579 != null)
         {
            var_579.dispose();
            var_579 = null;
         }
         if(var_577 != null)
         {
            var_577.dispose();
            var_577 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_578;
      }
      
      public function get worldType() : String
      {
         return var_1768;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_577 != null)
         {
            var_577.dispose();
         }
         var_577 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_579;
      }
   }
}
