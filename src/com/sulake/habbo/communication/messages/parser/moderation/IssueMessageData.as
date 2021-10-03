package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_158:int = 1;
      
      public static const const_1363:int = 3;
      
      public static const const_484:int = 2;
       
      
      private var var_1685:int;
      
      private var var_1687:int;
      
      private var var_1676:int;
      
      private var var_1686:int;
      
      private var var_36:int;
      
      private var var_402:int;
      
      private var var_1268:int;
      
      private var var_1677:int;
      
      private var var_1006:int;
      
      private var _roomResources:String;
      
      private var var_1681:int;
      
      private var var_1680:int;
      
      private var var_1683:String;
      
      private var var_1678:String;
      
      private var var_1682:int = 0;
      
      private var var_1207:String;
      
      private var _message:String;
      
      private var var_1675:int;
      
      private var var_1684:String;
      
      private var var_1189:int;
      
      private var var_717:String;
      
      private var var_1679:String;
      
      private var var_1434:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1006 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1682 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1680;
      }
      
      public function set roomName(param1:String) : void
      {
         var_717 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1681 = param1;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_717;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1686 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_36 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1687;
      }
      
      public function get priority() : int
      {
         return var_1685 + var_1682;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1677 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1678;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1434) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1189;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1680 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1268;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1683 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1681;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1686;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1679 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1207 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1677;
      }
      
      public function set priority(param1:int) : void
      {
         var_1685 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1687 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1683;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1676 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1678 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1675 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1207;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1268 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1676;
      }
      
      public function set flatId(param1:int) : void
      {
         var_402 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1189 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1434 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1675;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1684 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1434;
      }
      
      public function get reportedUserId() : int
      {
         return var_1006;
      }
      
      public function get flatId() : int
      {
         return var_402;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1679;
      }
      
      public function get reporterUserName() : String
      {
         return var_1684;
      }
   }
}
