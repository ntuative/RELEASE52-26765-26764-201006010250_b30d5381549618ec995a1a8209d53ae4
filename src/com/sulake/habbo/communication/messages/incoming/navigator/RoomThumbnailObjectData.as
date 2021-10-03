package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1519:int;
      
      private var var_1518:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1519;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1519 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1519 = this.var_1519;
         _loc1_.var_1518 = this.var_1518;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1518 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1518;
      }
   }
}
