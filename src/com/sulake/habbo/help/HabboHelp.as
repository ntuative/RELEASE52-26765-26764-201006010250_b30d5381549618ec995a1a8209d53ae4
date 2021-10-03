package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2103:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_137:TutorialUI;
      
      private var var_746:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_60:HelpUI;
      
      private var var_745:IHabboConfigurationManager;
      
      private var var_195:IHabboToolbar;
      
      private var var_623:HotelMergeUI;
      
      private var var_295:IHabboCommunicationManager;
      
      private var var_910:FaqIndex;
      
      private var var_2104:String = "";
      
      private var var_1052:IncomingMessages;
      
      private var var_1325:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1325 = new CallForHelpData();
         var_2103 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_910 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_195;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_60 != null)
         {
            var_60.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_60 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_60.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_137 != null)
         {
            var_137.dispose();
            var_137 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_2104;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_60 != null)
         {
            var_60.dispose();
            var_60 = null;
         }
         if(var_137 != null)
         {
            var_137.dispose();
            var_137 = null;
         }
         if(var_623)
         {
            var_623.dispose();
            var_623 = null;
         }
         if(var_910 != null)
         {
            var_910.dispose();
            var_910 = null;
         }
         var_1052 = null;
         if(var_195)
         {
            var_195.release(new IIDHabboToolbar());
            var_195 = null;
         }
         if(var_746)
         {
            var_746.release(new IIDHabboLocalizationManager());
            var_746 = null;
         }
         if(var_295)
         {
            var_295.release(new IIDHabboCommunicationManager());
            var_295 = null;
         }
         if(var_745)
         {
            var_745.release(new IIDHabboConfigurationManager());
            var_745 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_746;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_100:
               if(var_60 != null)
               {
                  var_60.setRoomSessionStatus(true);
               }
               if(var_137 != null)
               {
                  var_137.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_108:
               if(var_60 != null)
               {
                  var_60.setRoomSessionStatus(false);
               }
               if(var_137 != null)
               {
                  var_137.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_60 != null)
         {
            var_60.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2103;
      }
      
      public function method_6(param1:String) : void
      {
         if(var_60 != null)
         {
            var_60.method_6(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_623)
         {
            var_623 = new HotelMergeUI(this);
         }
         var_623.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_137 == null && _assetLibrary != null && _windowManager != null)
         {
            var_137 = new TutorialUI(this);
         }
         return var_137 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_60 == null && _assetLibrary != null && _windowManager != null)
         {
            var_60 = new HelpUI(this,_assetLibrary,_windowManager,var_746,var_195);
         }
         return var_60 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1325;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1325.reportedUserId = param1;
         var_1325.reportedUserName = param2;
         var_60.showUI(HabboHelpViewEnum.const_345);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_2104 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_195 != null)
         {
            var_195.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_144,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_746 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_137 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_137.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_295 = IHabboCommunicationManager(param2);
         var_1052 = new IncomingMessages(this,var_295);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_60 != null)
         {
            var_60.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_60 != null)
         {
            var_60.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_295 != null && param1 != null)
         {
            var_295.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_910;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_60 != null)
         {
            var_60.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_195 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_745 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_137;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_89)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_63)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_623;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_100,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_108,onRoomSessionEvent);
         var_195.events.addEventListener(HabboToolbarEvent.const_89,onHabboToolbarEvent);
         var_195.events.addEventListener(HabboToolbarEvent.const_63,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_60 != null)
         {
            var_60.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_745 == null)
         {
            return param1;
         }
         return var_745.getKey(param1,param2,param3);
      }
   }
}
