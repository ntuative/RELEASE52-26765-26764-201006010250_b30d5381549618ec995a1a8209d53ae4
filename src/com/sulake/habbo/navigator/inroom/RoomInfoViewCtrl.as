package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_750:IWindowContainer;
      
      private var var_1089:ITextWindow;
      
      private var var_205:RoomSettingsCtrl;
      
      private var var_1335:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1334:ITextWindow;
      
      private var var_368:IWindowContainer;
      
      private var var_2114:IWindowContainer;
      
      private var var_2116:ITextWindow;
      
      private var var_920:IWindowContainer;
      
      private var var_1578:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_717:ITextWindow;
      
      private var var_1580:IWindowContainer;
      
      private var var_1331:IWindowContainer;
      
      private var var_922:ITextWindow;
      
      private var var_1090:ITextFieldWindow;
      
      private var var_311:IWindowContainer;
      
      private var var_921:ITextWindow;
      
      private var var_1579:IButtonWindow;
      
      private var var_1091:ITextWindow;
      
      private var var_2369:int;
      
      private var var_1330:IContainerButtonWindow;
      
      private var var_923:IWindowContainer;
      
      private var var_1336:ITextWindow;
      
      private var var_1332:IContainerButtonWindow;
      
      private var var_1577:ITextWindow;
      
      private var var_1581:IButtonWindow;
      
      private var var_946:TagRenderer;
      
      private var var_1833:ITextWindow;
      
      private var var_367:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_749:ITextWindow;
      
      private var var_280:RoomThumbnailCtrl;
      
      private var var_1333:IContainerButtonWindow;
      
      private var var_2115:IWindowContainer;
      
      private var var_279:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_367 = new RoomEventViewCtrl(_navigator);
         var_205 = new RoomSettingsCtrl(_navigator,this,true);
         var_280 = new RoomThumbnailCtrl(_navigator);
         var_946 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_205);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_205.active = true;
         this.var_367.active = false;
         this.var_280.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1578.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1581.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1580.visible = Util.hasVisibleChildren(var_1580);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_717.text = param1.roomName;
         var_717.height = NaN;
         _ownerName.text = param1.ownerName;
         var_922.text = param1.description;
         var_946.refreshTags(var_368,param1.tags);
         var_922.visible = false;
         if(param1.description != "")
         {
            var_922.height = NaN;
            var_922.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_368,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_368,"thumb_down",_loc3_,onThumbDown,0);
         var_2116.visible = _loc3_;
         var_921.visible = !_loc3_;
         var_1577.visible = !_loc3_;
         var_1577.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_368,"home",param2,null,0);
         _navigator.refreshButton(var_368,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_368,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_717.y,0);
         var_368.visible = true;
         var_368.height = Util.getLowestPoint(var_368);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_510,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1579.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1335.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1333.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1330.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1332.visible = _navigator.data.canEditRoomSettings && param1;
         var_1331.visible = Util.hasVisibleChildren(var_1331);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_367.active = false;
         this.var_205.active = false;
         this.var_280.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_367.active = false;
         this.var_205.active = false;
         this.var_280.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_510,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_311);
         var_311.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_205.refresh(var_311);
         this.var_280.refresh(var_311);
         Util.moveChildrenToColumn(var_311,["room_details","room_buttons"],0,2);
         var_311.height = Util.getLowestPoint(var_311);
         var_311.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1090.setSelection(0,var_1090.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_279);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_367.refresh(var_279);
         if(Util.hasVisibleChildren(var_279) && !this.var_280.active)
         {
            Util.moveChildrenToColumn(var_279,["event_details","event_buttons"],0,2);
            var_279.height = Util.getLowestPoint(var_279);
            var_279.visible = true;
         }
         else
         {
            var_279.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_367.active = true;
         this.var_205.active = false;
         this.var_280.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1089.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1089.height = NaN;
         var_1334.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1334.height = NaN;
         Util.moveChildrenToColumn(var_750,["public_space_name","public_space_desc"],var_1089.y,0);
         var_750.visible = true;
         var_750.height = Math.max(86,Util.getLowestPoint(var_750));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "HabboNavigatorCom_ros_flat_controller_xml";
         if(_loc1_ && true && true && true)
         {
            var_923.visible = true;
            var_1090.text = this.getEmbedData();
         }
         else
         {
            var_923.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_205.load(param1);
         this.var_205.active = true;
         this.var_367.active = false;
         this.var_280.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_205.active = false;
         this.var_367.active = false;
         this.var_280.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_72,false);
         _window.setParamFlag(HabboWindowParam.const_1298,true);
         _window.visible = false;
         var_311 = IWindowContainer(find("room_info"));
         var_368 = IWindowContainer(find("room_details"));
         var_750 = IWindowContainer(find("public_space_details"));
         var_2115 = IWindowContainer(find("owner_name_cont"));
         var_2114 = IWindowContainer(find("rating_cont"));
         var_1331 = IWindowContainer(find("room_buttons"));
         var_717 = ITextWindow(find("room_name"));
         var_1089 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_922 = ITextWindow(find("room_desc"));
         var_1334 = ITextWindow(find("public_space_desc"));
         var_1091 = ITextWindow(find("owner_caption"));
         var_921 = ITextWindow(find("rating_caption"));
         var_2116 = ITextWindow(find("rate_caption"));
         var_1577 = ITextWindow(find("rating_txt"));
         var_279 = IWindowContainer(find("event_info"));
         var_920 = IWindowContainer(find("event_details"));
         var_1580 = IWindowContainer(find("event_buttons"));
         var_1833 = ITextWindow(find("event_name"));
         var_749 = ITextWindow(find("event_desc"));
         var_1335 = IContainerButtonWindow(find("add_favourite_button"));
         var_1333 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1330 = IContainerButtonWindow(find("make_home_button"));
         var_1332 = IContainerButtonWindow(find("unmake_home_button"));
         var_1579 = IButtonWindow(find("room_settings_button"));
         var_1578 = IButtonWindow(find("create_event_button"));
         var_1581 = IButtonWindow(find("edit_event_button"));
         var_923 = IWindowContainer(find("embed_info"));
         var_1336 = ITextWindow(find("embed_info_txt"));
         var_1090 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1335,onAddFavouriteClick);
         Util.setProcDirectly(var_1333,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1579,onRoomSettingsClick);
         Util.setProcDirectly(var_1330,onMakeHomeClick);
         Util.setProcDirectly(var_1332,onUnmakeHomeClick);
         Util.setProcDirectly(var_1578,onEventSettingsClick);
         Util.setProcDirectly(var_1581,onEventSettingsClick);
         Util.setProcDirectly(var_1090,onEmbedSrcClick);
         _navigator.refreshButton(var_1335,"favourite",true,null,0);
         _navigator.refreshButton(var_1333,"favourite",true,null,0);
         _navigator.refreshButton(var_1330,"home",true,null,0);
         _navigator.refreshButton(var_1332,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_311,onHover);
         Util.setProcDirectly(var_279,onHover);
         var_1091.width = var_1091.textWidth;
         Util.moveChildrenToRow(var_2115,["owner_caption","owner_name"],var_1091.x,var_1091.y,3);
         var_921.width = var_921.textWidth;
         Util.moveChildrenToRow(var_2114,["rating_caption","rating_txt"],var_921.x,var_921.y,3);
         var_1336.height = NaN;
         Util.moveChildrenToColumn(var_923,["embed_info_txt","embed_src_txt"],var_1336.y,2);
         var_923.height = Util.getLowestPoint(var_923) + 5;
         var_2369 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1833.text = param1.eventName;
         var_749.text = param1.eventDescription;
         var_946.refreshTags(var_920,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_749.visible = false;
         if(param1.eventDescription != "")
         {
            var_749.height = NaN;
            var_749.y = Util.getLowestPoint(var_920) + 2;
            var_749.visible = true;
         }
         var_920.visible = true;
         var_920.height = Util.getLowestPoint(var_920);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1038,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
