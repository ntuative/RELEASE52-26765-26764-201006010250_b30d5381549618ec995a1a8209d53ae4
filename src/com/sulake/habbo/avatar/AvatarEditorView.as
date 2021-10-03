package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabSelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.avatar.events.AvatarEditorSavedEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class AvatarEditorView
   {
      
      public static var var_1638:IWindowContainer;
      
      public static var var_1410:IWindowContainer;
      
      public static var var_2305:int = 6710886;
       
      
      private var var_1522:Boolean = true;
      
      private var var_1047:Array;
      
      private var var_347:Timer;
      
      private var var_519:ITabSelectorWindow;
      
      private var _window:IWindowContainer;
      
      private var var_518:IFrameWindow;
      
      private var _catalog:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1952:Boolean = true;
      
      private var var_1521:String;
      
      private var var_1051:Array;
      
      private var var_260:String;
      
      private var var_29:HabboAvatarEditor;
      
      private var var_1648:Number = 0;
      
      public function AvatarEditorView(param1:HabboAvatarEditor, param2:IHabboWindowManager, param3:IHabboCatalog, param4:Array, param5:Boolean)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var_1047 = [];
         var_1051 = [AvatarEditorFigureCategory.const_660,AvatarEditorFigureCategory.const_47,AvatarEditorFigureCategory.const_221,AvatarEditorFigureCategory.const_733,AvatarEditorFigureCategory.HOTLOOKS,AvatarEditorFigureCategory.const_99];
         super();
         var_29 = param1;
         _windowManager = param2;
         _catalog = param3;
         if(var_1410 == null)
         {
            _loc7_ = var_29.assets.getAssetByName("AvatarEditorThumb") as XmlAsset;
            var_1410 = var_29.windowManager.buildFromXML(_loc7_.content as XML) as IWindowContainer;
         }
         if(var_1638 == null)
         {
            _loc8_ = var_29.assets.getAssetByName("color_chooser_cell") as XmlAsset;
            var_1638 = var_29.windowManager.buildFromXML(_loc8_.content as XML) as IWindowContainer;
         }
         var_347 = new Timer(1000);
         var_347.addEventListener(TimerEvent.TIMER,onUpdate);
         if(param4 == null)
         {
            param4 = var_1051;
         }
         for each(_loc6_ in param4)
         {
            var_1047.push(_loc6_);
         }
         createWindow(param5);
      }
      
      public function hide() : void
      {
         _window.visible = false;
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.type == WindowEvent.const_60)
         {
            _loc3_ = param2.name;
            Logger.log("Select tab: " + _loc3_);
            if(_loc3_ != var_260)
            {
               var_29.toggleAvatarEditorPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "save":
                  if(var_29.hasInvalidClubItems())
                  {
                     displayStripClubDialog();
                     return;
                  }
                  _loc4_ = var_29.figureData.getFigureString();
                  var_29.saveCurrentSelection();
                  var_1648 = new Date().valueOf();
                  var_1522 = false;
                  var_347.start();
                  _window.findChildByName("save").disable();
                  var_29.events.dispatchEvent(new AvatarEditorSavedEvent(_loc4_));
                  break;
               case "cancel":
                  var_29.close();
                  break;
               case "wardrobe":
                  toggleWardrobe();
            }
            if(param2.name == "header_button_close")
            {
               hide();
            }
         }
      }
      
      private function openCatalogClubPage() : void
      {
         if(_catalog)
         {
            _catalog.openCatalogPage(CatalogPageName.const_237,true);
         }
      }
      
      public function update() : void
      {
         var _loc1_:IWindowContainer = var_29.figureData.view.window;
         var _loc2_:IWindowContainer = _window.findChildByName("figureContainer") as IWindowContainer;
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         if(_loc2_ != null)
         {
            _loc2_.addChild(_loc1_);
         }
         var _loc3_:IContainerButtonWindow = _window.findChildByName("wardrobe") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.visible = var_29.sessionData.hasUserRight("fuse_use_wardrobe") && var_29.isWardrobeAllowed();
         }
         var _loc4_:String = "null";
         if(var_29.sessionData.hasUserRight("fuse_use_wardrobe") && (var_1521 == AvatarEditorSideCategory.const_99 || var_1952))
         {
            if(var_29.isWardrobeAllowed())
            {
               _loc4_ = "null";
            }
         }
         if(var_29.isClubTryoutAllowed() && true)
         {
            _loc4_ = "null";
         }
         setSideContent(_loc4_);
         setViewToCategory(var_260);
      }
      
      public function toggle() : void
      {
         _window.visible = true;
         if(false)
         {
            var_347.start();
         }
         else
         {
            var_347.stop();
         }
      }
      
      private function attachImages() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:Array = var_1051;
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = _window.findChildByName(_loc2_) as IWindowContainer;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.findChildByTag("BITMAP") as IBitmapWrapperWindow;
               if(_loc4_ != null)
               {
                  _loc5_ = var_29.assets.getAssetByName("ae_tabs_" + _loc2_) as BitmapDataAsset;
                  _loc6_ = (_loc5_.content as BitmapData).clone();
                  _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
                  _loc7_ = (_loc4_.width - _loc6_.width) / 2;
                  _loc8_ = (_loc4_.height - _loc6_.height) / 2;
                  _loc4_.bitmap.copyPixels(_loc6_,_loc6_.rect,new Point(_loc7_,_loc8_));
               }
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_347 != null)
         {
            var_347.stop();
            var_347.removeEventListener(TimerEvent.TIMER,onUpdate);
            var_347 = null;
         }
         if(_window != null)
         {
            _loc1_ = _window.findChildByName("figureContainer") as IWindowContainer;
            if(_loc1_ != null)
            {
               while(_loc1_.numChildren > 0)
               {
                  _loc1_.removeChildAt(0);
               }
            }
            _loc2_ = _window.findChildByName("contentArea") as IWindowContainer;
            if(_loc2_ != null)
            {
               while(_loc2_.numChildren > 0)
               {
                  _loc2_.removeChildAt(0);
               }
            }
            _loc3_ = _window.findChildByName("sideContainer") as IWindowContainer;
            if(_loc3_ != null)
            {
               while(_loc3_.numChildren > 0)
               {
                  _loc3_.removeChildAt(0);
               }
            }
            _window.dispose();
            _window = null;
         }
      }
      
      private function displayStripClubDialog() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_518)
         {
            _loc1_ = var_29.assets.getAssetByName("StripClubItemsInfo");
            if(!_loc1_)
            {
               throw new Error("Failed to initialize strip club info dialog; missing asset!");
            }
            _loc2_ = _loc1_.content as XML;
            var_518 = _windowManager.buildFromXML(_loc2_,2) as IFrameWindow;
            var_518.procedure = stripClubDialogEventProc;
            var_518.center();
         }
         else
         {
            var_518.visible = true;
            var_518.center();
         }
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      private function createWindow(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(_window == null)
         {
            if(param1)
            {
               _window = _windowManager.buildFromXML((var_29.assets.getAssetByName("AvatarEditor") as XmlAsset).content as XML) as IWindowContainer;
            }
            else
            {
               _window = _windowManager.buildFromXML((var_29.assets.getAssetByName("AvatarEditorSimple") as XmlAsset).content as XML) as IWindowContainer;
            }
            _loc3_ = _windowManager.buildFromXML((var_29.assets.getAssetByName("AvatarEditorContent") as XmlAsset).content as XML) as IWindowContainer;
            _window.addChild(_loc3_);
         }
         _window.procedure = windowEventProc;
         var_519 = _window.findChildByName("mainTabs") as ITabSelectorWindow;
         var _loc2_:int = -1;
         while(_loc2_ >= 0)
         {
            _loc4_ = var_519.getSelectableAt(_loc2_);
            if(_loc4_ != null && var_1047.indexOf(_loc4_.name) < 0)
            {
               _loc5_ = var_519.removeSelectable(_loc4_);
               _loc6_ = _loc2_ + 1;
               while(_loc6_ < var_519.numSelectables)
               {
                  var_519.getSelectableAt(_loc6_).x = var_519.getSelectableAt(_loc6_).x - _loc5_.width;
                  _loc6_++;
               }
            }
            _loc2_--;
         }
         attachImages();
         update();
      }
      
      private function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1648 > 5000;
      }
      
      public function method_5(param1:Array) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return method_5(var_1051);
         }
         if(param1.length != var_1047.length)
         {
            return false;
         }
         for each(_loc2_ in param1)
         {
            if(var_1047.indexOf(_loc2_) < 0)
            {
               return false;
            }
         }
         return true;
      }
      
      private function stripClubDialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "header_button_close":
                  var_518.visible = false;
                  break;
               case "strip_button_ok":
                  if(var_29)
                  {
                     var_29.stripClubItems();
                  }
                  var_518.visible = false;
                  break;
               case "strip_button_club_info":
                  openCatalogClubPage();
                  var_518.visible = false;
            }
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(canChangeOutfit())
         {
            var_1522 = canChangeOutfit();
            var_347.stop();
            if(_window)
            {
               _window.findChildByName("save").enable();
            }
         }
      }
      
      private function setSideContent(param1:String) : void
      {
         var _loc2_:IWindowContainer = _window.findChildByName("sideContainer") as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarEditorSideCategory.const_618:
               break;
            case AvatarEditorSideCategory.const_471:
               _loc3_ = var_29.getSideContentWindowContainer(AvatarEditorSideCategory.const_471);
               break;
            case AvatarEditorSideCategory.const_99:
               _loc3_ = var_29.getSideContentWindowContainer(AvatarEditorSideCategory.const_99);
         }
         _loc2_.removeChildAt(0);
         _loc2_.invalidate();
         if(_loc3_)
         {
            _loc2_.addChild(_loc3_);
            _loc3_.visible = true;
            _loc2_.width = _loc3_.width;
         }
         else
         {
            _loc2_.width = 0;
         }
         var_1521 = param1;
      }
      
      private function toggleWardrobe() : void
      {
         if(var_1521 == AvatarEditorSideCategory.const_99)
         {
            var_1952 = false;
            setSideContent(AvatarEditorSideCategory.const_618);
         }
         else
         {
            setSideContent(AvatarEditorSideCategory.const_99);
         }
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = false) : void
      {
         if(!param2)
         {
         }
         setViewToCategory(param1);
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         var _loc2_:IWindowContainer = _window.findChildByName("contentArea") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.getChildAt(0) as IWindowContainer;
         _loc2_.removeChild(_loc3_);
         _loc2_.invalidate();
         var _loc4_:IWindowContainer = var_29.getCategoryWindowContainer(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.visible = true;
         _loc2_.addChild(_loc4_);
         var_260 = param1;
         var_519.setSelected(var_519.getSelectableByName(param1));
         _window.invalidate();
      }
      
      public function show() : void
      {
         _window.visible = true;
      }
   }
}
