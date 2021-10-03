package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_485:int = 0;
      
      public static const const_134:int = 2;
      
      public static const const_175:int = 1;
      
      public static const const_711:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1710:Boolean;
      
      private var var_1712:Boolean;
      
      private var var_1717:int;
      
      private var var_1715:Array;
      
      private var var_1716:int;
      
      private var var_1718:Boolean;
      
      private var var_1236:String;
      
      private var var_1713:int;
      
      private var var_1714:Boolean;
      
      private var var_1711:int;
      
      private var var_1189:int;
      
      private var _roomId:int;
      
      private var var_661:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1713;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1713 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_1714 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_661;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1718;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1716 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1715 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_661 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1710;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1712;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1717;
      }
      
      public function get categoryId() : int
      {
         return var_1189;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1718 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_1714;
      }
      
      public function get controllerCount() : int
      {
         return var_1716;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1715;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1711 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1710 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1712 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1717 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1711;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1189 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1236 = param1;
      }
      
      public function get description() : String
      {
         return var_1236;
      }
   }
}
