package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.avatar.enum.AvatarEditorEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.generic.BodyModel;
   import com.sulake.habbo.avatar.head.HeadModel;
   import com.sulake.habbo.avatar.hotlooks.HotLooksModel;
   import com.sulake.habbo.avatar.legs.LegsModel;
   import com.sulake.habbo.avatar.promo.ClubPromoModel;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.torso.TorsoModel;
   import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboAvatarEditor extends Component implements IHabboAvatarEditor
   {
      
      private static const const_1114:String = "hr-100.hd-180-7.ch-215-66.lg-270-79.sh-305-62.ha-1002-70.wa-2007";
      
      private static const const_1116:String = "hr-515-33.hd-600-1.ch-635-70.lg-716-66-62.sh-735-68";
       
      
      private var _view:AvatarEditorView;
      
      private var var_867:AvatarEditorHandler;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_231:IWindowContainer;
      
      private var var_616:ISessionDataManager;
      
      private var var_600:IAvatarRenderManager;
      
      private var var_90:Map;
      
      private var var_1041:int = 0;
      
      private var var_167:Boolean = false;
      
      private var var_516:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private const const_1115:int = 2;
      
      private var _catalog:IHabboCatalog;
      
      private var var_11:IHabboInventory;
      
      private var var_640:String;
      
      private var var_1513:Boolean;
      
      private var var_1042:IHabboAvatarEditorDataSaver = null;
      
      private var var_1514:Boolean = false;
      
      private var var_151:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_721:IFigureData;
      
      private var var_422:Map;
      
      public function HabboAvatarEditor(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_640 = FigureData.const_77;
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
      }
      
      public function getFigureSetType(param1:String) : ISetType
      {
         if(var_721 == null)
         {
            return null;
         }
         return var_721.getSetType(param1);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
      }
      
      public function useClubClothing() : void
      {
         if(var_90 == null)
         {
            return;
         }
         if(var_1513)
         {
            return;
         }
         var_1513 = true;
         update();
      }
      
      public function close() : void
      {
         if(var_231 != null)
         {
            var_231.visible = false;
         }
         else
         {
            this.events.dispatchEvent(new AvatarEditorClosedEvent());
         }
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = param2 as IHabboCatalog;
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_151 = param2 as IHabboConfigurationManager;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return var_616;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_90)
         {
            _loc1_.reset();
         }
         for each(_loc2_ in var_422)
         {
            _loc2_.reset();
         }
         if(_view)
         {
            _view.update();
         }
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_167)
         {
            var_516 = new Dictionary();
            var_516["null"] = new FigureData(this);
            var_516["null"] = new FigureData(this);
            _loc1_ = var_516["null"];
            _loc2_ = var_516["null"];
            _loc1_.loadAvatarData(const_1114,FigureData.const_77);
            _loc2_.loadAvatarData(const_1116,FigureData.const_76);
            var_90 = new Map();
            var_422 = new Map();
            var_90.add(AvatarEditorFigureCategory.const_660,new BodyModel(this));
            var_90.add(AvatarEditorFigureCategory.const_47,new HeadModel(this));
            var_90.add(AvatarEditorFigureCategory.const_221,new TorsoModel(this));
            var_90.add(AvatarEditorFigureCategory.const_733,new LegsModel(this));
            var_90.add(AvatarEditorFigureCategory.HOTLOOKS,new HotLooksModel(this));
            var_422.add(AvatarEditorSideCategory.const_99,new WardrobeModel(this));
            var_422.add(AvatarEditorSideCategory.const_471,new ClubPromoModel(this));
            var_167 = true;
         }
      }
      
      public function set gender(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_640 == param1)
         {
            return;
         }
         var_640 = param1;
         for each(_loc2_ in var_90)
         {
            _loc2_.reset();
         }
         if(_view != null)
         {
            _view.update();
         }
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_616 = param2 as ISessionDataManager;
      }
      
      private function orderByClub(param1:AvatarEditorGridPartItem, param2:AvatarEditorGridPartItem) : Number
      {
         var _loc3_:Number = param1.partSet == null ? -1 : Number(Number(param1.partSet.clubLevel));
         var _loc4_:Number = param2.partSet == null ? -1 : Number(Number(param2.partSet.clubLevel));
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partSet.id < param2.partSet.id)
         {
            return -1;
         }
         if(param1.partSet.id > param2.partSet.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _localization;
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function hasInvalidClubItems() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc1_:Boolean = false;
         for each(_loc2_ in var_90)
         {
            _loc3_ = _loc2_.hasClubItemsOverLevel(clubMemberLevel);
            if(_loc3_)
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(var_151 != null)
         {
            var_151.release(new IIDHabboConfigurationManager());
            var_151 = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_localization != null)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_600 != null)
         {
            var_600.release(new IIDAvatarRenderManager());
            var_600 = null;
         }
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(var_11 != null)
         {
            var_11.release(new IIDHabboInventory());
            var_11 = null;
         }
         if(var_90 != null)
         {
            for each(_loc1_ in var_90)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_90 = null;
         }
         if(var_422 != null)
         {
            for each(_loc2_ in var_422)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
            var_422 = null;
         }
         if(var_231 != null)
         {
            var_231.dispose();
            var_231 = null;
         }
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         if(var_867 != null)
         {
            var_867.dispose();
            var_867 = null;
         }
         var_721 = null;
         var_516 = null;
         var_1042 = null;
         super.dispose();
      }
      
      public function saveCurrentSelection() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(var_1042 != null)
         {
            _loc1_ = figureData.getFigureString();
            _loc2_ = "null";
            var_1042.saveFigure(_loc1_,_loc2_);
         }
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function getDefaultColour(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:ISetType = getFigureSetType(param1);
         if(_loc2_ != null)
         {
            _loc3_ = getPalette(_loc2_.paletteID);
            for each(_loc4_ in _loc3_.colors)
            {
               if(_loc4_.isSelectable && var_1041 >= _loc4_.clubLevel)
               {
                  return _loc4_.id;
               }
            }
         }
         return -1;
      }
      
      public function get figureData() : FigureData
      {
         return var_516[var_640];
      }
      
      public function generateDataContent(param1:IAvatarEditorCategoryModel, param2:String) : CategoryData
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:Boolean = false;
         var _loc14_:* = null;
         var _loc15_:* = false;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:Boolean = false;
         var _loc22_:* = null;
         if(!param1)
         {
            return null;
         }
         if(!param2)
         {
            return null;
         }
         var _loc3_:* = [];
         var _loc4_:Array = new Array();
         _loc5_ = 0;
         while(_loc5_ < const_1115)
         {
            _loc4_.push(new Array());
            _loc5_++;
         }
         var _loc9_:Boolean = false;
         _loc8_ = getFigureSetType(param2);
         if(!_loc8_)
         {
            return null;
         }
         switch(param2)
         {
            case FigureData.const_149:
            case FigureData.const_167:
            case FigureData.const_173:
            case FigureData.const_174:
            case FigureData.const_185:
            case FigureData.const_166:
            case FigureData.CHEST_ACCESSORIES:
            case FigureData.CHEST_PRINTS:
            case FigureData.const_177:
            case FigureData.const_170:
               _loc9_ = true;
         }
         if(_loc8_ != null)
         {
            _loc10_ = getPalette(_loc8_.paletteID);
            if(!_loc10_)
            {
               return null;
            }
            _loc11_ = figureData.getColourIds(param2);
            if(!_loc11_)
            {
               _loc11_ = new Array();
            }
            _loc12_ = new Array(_loc11_.length);
            _loc13_ = isClubTryoutAllowed() && var_1513;
            for each(_loc14_ in _loc10_.colors)
            {
               if(_loc14_.isSelectable && (_loc13_ || var_1041 >= _loc14_.clubLevel))
               {
                  _loc16_ = 0;
                  while(_loc16_ < const_1115)
                  {
                     _loc17_ = new AvatarEditorGridColorItem(AvatarEditorView.var_1638.clone() as IWindowContainer,param1,_loc14_);
                     _loc4_[_loc16_].push(_loc17_);
                     _loc16_++;
                  }
                  if(param2 != FigureData.FACE)
                  {
                     _loc18_ = 0;
                     while(_loc18_ < _loc11_.length)
                     {
                        if(_loc14_.id == _loc11_[_loc18_])
                        {
                           _loc12_[_loc18_] = _loc14_;
                        }
                        _loc18_++;
                     }
                  }
               }
            }
            if(_loc9_)
            {
               _loc19_ = _assets.getAssetByName("removeSelection") as BitmapDataAsset;
               if(_loc19_)
               {
                  _loc20_ = (_loc19_.content as BitmapData).clone();
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1410.clone() as IWindowContainer,param1,null,null,false);
                  _loc7_.iconImage = _loc20_;
                  _loc3_.push(_loc7_);
               }
            }
            _loc15_ = param2 != FigureData.FACE;
            for each(_loc6_ in _loc8_.partSets)
            {
               _loc21_ = false;
               if(_loc6_.gender == FigureData.const_1338)
               {
                  _loc21_ = true;
               }
               else if(_loc6_.gender == gender)
               {
                  _loc21_ = true;
               }
               if(_loc6_.isSelectable && _loc21_ && (_loc13_ || var_1041 >= _loc6_.clubLevel))
               {
                  _loc7_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1410.clone() as IWindowContainer,param1,_loc6_,_loc12_,_loc15_);
                  _loc3_.push(_loc7_);
               }
            }
         }
         _loc3_.sort(orderByClub);
         _loc5_ = 0;
         while(_loc5_ < const_1115)
         {
            _loc22_ = _loc4_[_loc5_] as Array;
            _loc22_.sort(orderPaletteByClub);
            _loc5_++;
         }
         return new CategoryData(_loc3_,_loc4_);
      }
      
      public function get wardrobe() : WardrobeModel
      {
         if(!var_167)
         {
            init();
         }
         return var_422.getValue(AvatarEditorSideCategory.const_99);
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _communication = param2 as IHabboCommunicationManager;
         var_867 = new AvatarEditorHandler(this,_communication);
      }
      
      public function getPalette(param1:int) : IPalette
      {
         if(var_721 == null)
         {
            return null;
         }
         return var_721.getPalette(param1);
      }
      
      public function get gender() : String
      {
         return var_640;
      }
      
      public function get handler() : AvatarEditorHandler
      {
         return var_867;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function isWardrobeAllowed() : Boolean
      {
         return !var_1514;
      }
      
      public function isClubTryoutAllowed() : Boolean
      {
         var _loc1_:String = configuration.getKey("avatareditor.allowclubtryout");
         return _loc1_ == "1" && !var_1514;
      }
      
      public function toggleAvatarEditorPage(param1:String) : void
      {
         _view.toggleCategoryView(param1,false);
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return var_600;
      }
      
      public function getSideContentWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:ISideContentModel = var_422.getValue(param1) as ISideContentModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      public function openEditor(param1:IWindowContainer = null, param2:IHabboAvatarEditorDataSaver = null, param3:Array = null, param4:Boolean = false) : Boolean
      {
         if(!var_167)
         {
            init();
         }
         var_1514 = param4;
         if(_view != null)
         {
            if(!_view.method_5(param3))
            {
               _view.dispose();
               _view = null;
            }
         }
         if(_view == null)
         {
            _view = new AvatarEditorView(this,_windowManager,_catalog,param3,!param4);
         }
         if(param1 != null)
         {
            param1.addChild(_view.window);
         }
         else
         {
            if(var_231 == null)
            {
               var_231 = _windowManager.createWindow("avatarEditorContainer","",HabboWindowType.const_57,HabboWindowStyle.const_43,0 | 0,new Rectangle(0,0,2,2),null,0) as IWindowContainer;
               var_231.addChild(_view.window);
               var_231.center();
               var_231.visible = false;
            }
            var_231.visible = true;
         }
         _view.show();
         if(param3 != null && param3.length > 0)
         {
            toggleAvatarEditorPage(param3[0]);
         }
         else
         {
            toggleAvatarEditorPage(AvatarEditorFigureCategory.const_660);
         }
         var_1042 = param2;
         return true;
      }
      
      private function onAvatarRendererReady(param1:Event = null) : void
      {
         var_721 = var_600.getFigureData(AvatarType.const_104);
         this.events.dispatchEvent(new Event(AvatarEditorEvent.AVATAR_EDITOR_READY));
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_600 = param2 as IAvatarRenderManager;
         (var_600 as Component).events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY,onAvatarRendererReady);
      }
      
      public function getCategoryWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IAvatarEditorCategoryModel = var_90.getValue(param1) as IAvatarEditorCategoryModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_11 = param2 as IHabboInventory;
      }
      
      public function loadAvatarInEditor(param1:String, param2:String, param3:int = 0) : void
      {
         var _loc5_:* = null;
         switch(param2)
         {
            case FigureData.const_77:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.const_76:
            case "f":
            case "F":
               param2 = "null";
         }
         var_1041 = param3;
         var _loc4_:FigureData = var_516[param2];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.loadAvatarData(param1,param2);
         if(param2 != this.gender)
         {
            this.gender = param2;
         }
         if(var_90)
         {
            for each(_loc5_ in var_90)
            {
               _loc5_.reset();
            }
         }
         if(_view != null)
         {
            _view.update();
         }
      }
      
      public function get windowContext() : IWindowContainer
      {
         return var_231;
      }
      
      public function stripClubItems() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_90)
         {
            _loc1_.stripClubItemsOverLevel(clubMemberLevel);
         }
      }
      
      public function get clubMemberLevel() : int
      {
         return var_1041;
      }
      
      private function orderPaletteByClub(param1:AvatarEditorGridColorItem, param2:AvatarEditorGridColorItem) : Number
      {
         var _loc3_:Number = param1.method_2 == null ? -1 : Number(param1.method_2.clubLevel as Number);
         var _loc4_:Number = param2.method_2 == null ? -1 : Number(param2.method_2.clubLevel as Number);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.method_2.index < param2.method_2.index)
         {
            return -1;
         }
         if(param1.method_2.index > param2.method_2.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_151;
      }
   }
}
