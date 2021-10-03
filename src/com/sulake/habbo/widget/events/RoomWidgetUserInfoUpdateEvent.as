package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_231:String = "RWUIUE_PEER";
      
      public static const const_217:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1428:String = "BOT";
      
      public static const const_845:int = 2;
      
      public static const const_1406:int = 0;
      
      public static const const_922:int = 3;
       
      
      private var var_451:String = "";
      
      private var var_1191:String = "";
      
      private var var_2141:Boolean = false;
      
      private var var_2142:int = 0;
      
      private var var_1934:int = 0;
      
      private var var_2144:Boolean = false;
      
      private var var_1190:String = "";
      
      private var var_2140:Boolean = false;
      
      private var var_810:int = 0;
      
      private var var_2146:Boolean = true;
      
      private var var_1117:int = 0;
      
      private var var_2149:Boolean = false;
      
      private var var_1317:Boolean = false;
      
      private var var_2139:Boolean = false;
      
      private var var_1932:int = 0;
      
      private var var_2145:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_284:Array;
      
      private var var_1320:Boolean = false;
      
      private var _name:String = "";
      
      private var var_2143:int = 0;
      
      private var var_2148:Boolean = false;
      
      private var var_2147:int = 0;
      
      private var var_1933:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_284 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1934;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1934 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2141;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2146;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2146 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2140 = param1;
      }
      
      public function get motto() : String
      {
         return var_1191;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2149 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1317;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1191 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2148;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1933;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1317 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2145;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1932 = param1;
      }
      
      public function get badges() : Array
      {
         return var_284;
      }
      
      public function get amIController() : Boolean
      {
         return var_2144;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2144 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2148 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2147 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1933 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1190 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2140;
      }
      
      public function set figure(param1:String) : void
      {
         var_451 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1932;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1320;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2149;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_810 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2147;
      }
      
      public function get realName() : String
      {
         return var_1190;
      }
      
      public function get figure() : String
      {
         return var_451;
      }
      
      public function set webID(param1:int) : void
      {
         var_2143 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_284 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2139 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2145 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_810;
      }
      
      public function get webID() : int
      {
         return var_2143;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1117 = param1;
      }
      
      public function get xp() : int
      {
         return var_2142;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2141 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1117;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2139;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1320 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_2142 = param1;
      }
   }
}
