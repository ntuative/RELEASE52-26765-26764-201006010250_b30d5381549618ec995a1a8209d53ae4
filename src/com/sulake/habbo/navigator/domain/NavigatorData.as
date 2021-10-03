package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1461:int = 10;
       
      
      private var var_1523:NavigatorSettingsMessageParser;
      
      private var var_1267:int;
      
      private var var_1964:int;
      
      private var var_1959:Boolean;
      
      private var var_1051:Array;
      
      private var var_874:Dictionary;
      
      private var var_1050:Array;
      
      private var var_2358:int;
      
      private var var_1961:int;
      
      private var var_1962:int;
      
      private var var_1965:int;
      
      private var var_610:PublicRoomShortData;
      
      private var var_428:RoomEventData;
      
      private var var_129:MsgWithRequestId;
      
      private var var_1960:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1963:Boolean;
      
      private var var_198:GuestRoomData;
      
      private var var_726:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1051 = new Array();
         var_1050 = new Array();
         var_874 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1964;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1963;
      }
      
      public function startLoading() : void
      {
         this.var_726 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1963 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_428 != null)
         {
            var_428.dispose();
         }
         var_428 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_129 != null && var_129 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_129 != null && var_129 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_129 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_198;
      }
      
      public function get allCategories() : Array
      {
         return var_1051;
      }
      
      public function onRoomExit() : void
      {
         if(var_428 != null)
         {
            var_428.dispose();
            var_428 = null;
         }
         if(var_610 != null)
         {
            var_610.dispose();
            var_610 = null;
         }
         if(var_198 != null)
         {
            var_198.dispose();
            var_198 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_129 = param1;
         var_726 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1523;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_129 = param1;
         var_726 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_610 = null;
         var_198 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_610 = param1.publicSpace;
            var_428 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2358 = param1.limit;
         this.var_1267 = param1.favouriteRoomIds.length;
         this.var_874 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_874[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_129 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_610;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1959;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_129 = param1;
         var_726 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1962 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_198 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_726;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1050;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1051 = param1;
         var_1050 = new Array();
         for each(_loc2_ in var_1051)
         {
            if(_loc2_.visible)
            {
               var_1050.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1961;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1965;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1523 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_129 == null)
         {
            return;
         }
         var_129.dispose();
         var_129 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_428;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_874[param1] = !!param2 ? "yes" : null;
         var_1267 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_129 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1962;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_129 != null && var_129 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1959 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1961 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1960 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_198 != null)
         {
            var_198.dispose();
         }
         var_198 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_198 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1523.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1267 >= var_2358;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1965 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1960;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_198 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1964 = param1;
      }
   }
}
