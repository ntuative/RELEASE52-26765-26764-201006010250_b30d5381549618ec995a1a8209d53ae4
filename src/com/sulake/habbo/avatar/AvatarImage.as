package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarImage implements IAvatarImage, IDisposable
   {
      
      private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
      
      private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
      
      private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
      
      private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
      
      private static const CHANNELS_RED:String = "CHANNELS_RED";
      
      private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
      
      private static const const_1063:int = 2;
      
      private static const const_1064:String = AvatarSetType.const_40;
      
      private static const const_1062:String = "Default";
       
      
      private var var_451:AvatarFigureContainer;
      
      private var var_987:Array;
      
      protected var _isDisposed:Boolean;
      
      private var var_169:Array;
      
      private var var_808:Boolean = false;
      
      private var var_1689:String;
      
      protected var var_146:String;
      
      private var var_2408:int;
      
      private var _image:BitmapData;
      
      private var var_134:AvatarImageCache;
      
      private var var_392:Boolean;
      
      private var var_393:Boolean;
      
      private var _assets:AssetAliasCollection;
      
      private var var_469:IAvatarDataContainer;
      
      private var var_548:int = 0;
      
      private var var_2409:int;
      
      private var var_1158:int = 0;
      
      private var var_986:Boolean;
      
      private var var_189:Array;
      
      protected var var_91:int;
      
      private var var_671:String;
      
      private var var_567:Array;
      
      private var var_807:IActiveActionData;
      
      protected var var_250:IActiveActionData;
      
      protected var var_79:AvatarStructure;
      
      private var var_336:Map;
      
      public function AvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String, param4:String, param5:String = null)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var_189 = [];
         var_567 = new Array();
         super();
         var_392 = true;
         var_79 = param1;
         _assets = param2;
         var_146 = param4;
         if(var_146 == null)
         {
            var_146 = AvatarScaleType.const_55;
         }
         if(param3 == null || param3 == "")
         {
            param3 = "hr-893-45.hd-180-2.ch-210-66.lg-270-82.sh-300-91.wa-2007-.ri-1-";
            Logger.log("Using default avatar figure");
         }
         var_451 = new AvatarFigureContainer(param3);
         if(param5)
         {
            _loc6_ = var_79.getMandatorySetTypeIds();
            if(_loc6_)
            {
               _loc7_ = var_79.figureData;
               for each(_loc8_ in _loc6_)
               {
                  if(!var_451.hasPartType(_loc8_))
                  {
                     _loc9_ = var_79.getDefaultPartSet(_loc8_,param5);
                     if(_loc9_)
                     {
                        var_451.updatePart(_loc8_,_loc9_.id,[0]);
                     }
                  }
                  else
                  {
                     _loc10_ = _loc7_.getSetType(_loc8_);
                     _loc11_ = _loc10_.getPartSet(var_451.getPartSetId(_loc8_));
                     if(!_loc11_)
                     {
                        _loc12_ = var_79.getDefaultPartSet(_loc8_,param5);
                        var_451.updatePart(_loc8_,_loc12_.id,[0]);
                     }
                  }
               }
            }
         }
         var_134 = new AvatarImageCache(var_79,this,_assets,var_146);
         setDirection(const_1064,const_1063);
         var_189 = new Array();
         var_807 = new ActiveActionData(AvatarAction.const_464);
         var_807.definition = var_79.getActionDefinition(const_1062);
         resetActions();
         var_336 = new Map();
      }
      
      private function logThis(param1:String) : void
      {
      }
      
      public function getCanvasOffsets() : Array
      {
         return var_567;
      }
      
      public function getSprites() : Array
      {
         return var_169;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_isDisposed)
         {
            var_79 = null;
            _assets = null;
            var_134 = null;
            var_250 = null;
            var_451 = null;
            var_469 = null;
            var_189 = null;
            if(_image)
            {
               _image.dispose();
            }
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            if(var_336)
            {
               for each(_loc2_ in var_336)
               {
                  _loc2_.dispose();
               }
               var_336.dispose();
               var_336 = null;
            }
            _image = null;
            var_567 = null;
            _isDisposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getAsset(param1:String) : BitmapDataAsset
      {
         return _assets.getAssetByName(param1) as BitmapDataAsset;
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         param2 += var_1158;
         if(param2 < AvatarDirectionAngle.const_909)
         {
            param2 = AvatarDirectionAngle.const_256 + (param2 + 1);
         }
         if(param2 > AvatarDirectionAngle.const_256)
         {
            param2 -= NaN;
         }
         if(var_79.isMainAvatarSet(param1))
         {
            var_91 = param2;
         }
         getCache().setDirection(param1,param2);
         var_392 = true;
      }
      
      public function get avatarSpriteData() : IAvatarDataContainer
      {
         return var_469;
      }
      
      public function initActionAppends() : void
      {
         var_189 = new Array();
         var_808 = false;
         var_671 = "";
         var_986 = false;
      }
      
      public function isAnimating() : Boolean
      {
         return var_393;
      }
      
      public function endActionAppends() : void
      {
         sortActions();
         resetActions();
         setActionsToParts();
      }
      
      private function setActionsToParts() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_987)
         {
            if(!(!_loc1_ || !_loc1_.definition))
            {
               if(_loc1_.definition.isAnimation && _loc1_.actionParameter == "")
               {
                  _loc1_.actionParameter = "1";
               }
               setActionToParts(_loc1_);
               if(_loc1_.definition.isAnimation)
               {
                  var_393 = true;
                  _loc2_ = var_79.getAnimation(_loc1_.definition.state + "." + _loc1_.actionParameter);
                  if(_loc2_ != null)
                  {
                     var_169 = var_169.concat(_loc2_.spriteData);
                     if(_loc2_.hasDirectionData())
                     {
                        var_1158 = _loc2_.directionData.offset;
                     }
                     if(_loc2_.hasAvatarData())
                     {
                        var_469 = _loc2_.avatarData;
                     }
                  }
               }
               if(_loc1_.actionType == AvatarAction.const_393)
               {
                  var_393 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_274)
               {
                  var_393 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_290)
               {
                  var_393 = true;
               }
            }
         }
      }
      
      public function getSubType() : int
      {
         return -1;
      }
      
      private function sortActions() : void
      {
         var_808 = true;
         if(var_1689 == var_671)
         {
            return;
         }
         var_1689 = var_671;
         var_987 = var_79.sortActions(var_189);
         if(var_987 == null)
         {
            var_567 = new Array(0,0,0);
         }
         else
         {
            var_567 = var_79.getCanvasOffsets(var_987,var_146,var_91);
         }
      }
      
      private function addActionData(param1:String, param2:String = "") : void
      {
         var _loc3_:* = null;
         if(var_189 == null)
         {
            var_189 = new Array();
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_189.length)
         {
            _loc3_ = var_189[_loc4_];
            if(_loc3_.actionType == param1 && _loc3_.actionParameter == param2)
            {
               return;
            }
            _loc4_++;
         }
         var_189.push(new ActiveActionData(param1,param2));
      }
      
      public function getPartColor(param1:String) : IPartColor
      {
         return var_79.getPartColor(var_451,param1);
      }
      
      public function getCroppedImage(param1:String) : BitmapData
      {
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(var_250 == null)
         {
            return null;
         }
         var _loc2_:AvatarImageCache = getCache();
         var _loc3_:AvatarCanvas = var_79.getCanvas(var_146,var_250.definition.geometryType);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         var _loc5_:Array = var_79.getBodyParts(param1,var_250.definition,var_91);
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc9_ = _loc5_[_loc7_];
            _loc10_ = _loc2_.getImageContainer(_loc9_,var_548);
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.image;
               if(_loc11_ == null)
               {
                  _loc4_.dispose();
                  return null;
               }
               _loc12_ = _loc10_.regPoint.clone();
               _loc4_.copyPixels(_loc11_,_loc11_.rect,_loc12_,null,null,true);
               _loc13_ = new Rectangle(_loc12_.x,_loc12_.y,_loc11_.width,_loc11_.height);
               if(_loc6_ == null)
               {
                  _loc6_ = _loc13_;
               }
               else
               {
                  _loc6_ = _loc6_.union(_loc13_);
               }
            }
            _loc7_--;
         }
         if(_loc6_ == null)
         {
            _loc6_ = new Rectangle(0,0,0,0);
         }
         var _loc8_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         _loc8_.copyPixels(_loc4_,_loc6_,new Point(0,0),null,null,true);
         _loc4_.dispose();
         return _loc8_;
      }
      
      public function getScale() : String
      {
         return var_146;
      }
      
      public function get petBreed() : int
      {
         return -1;
      }
      
      public function setDirectionAngle(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param2 / 45;
         setDirection(param1,_loc3_);
      }
      
      public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(!var_392)
         {
            return _image;
         }
         if(var_250 == null)
         {
            return null;
         }
         if(!var_808)
         {
            endActionAppends();
         }
         var _loc3_:String = var_91 + var_671 + var_548 % 4;
         if(var_986 && false)
         {
            if(false)
            {
               if(param2)
               {
                  return (var_336[_loc3_] as BitmapData).clone();
               }
               _image.fillRect(_image.rect,16777215);
               _image.copyPixels(var_336[_loc3_] as BitmapData,(var_336[_loc3_] as BitmapData).rect,new Point(0,0),null,null,true);
               return _image;
            }
         }
         var _loc4_:AvatarImageCache = getCache();
         var _loc5_:AvatarCanvas = var_79.getCanvas(var_146,var_250.definition.geometryType);
         if(_image == null || _loc5_ != null && (_image.width != _loc5_.width || _image.height != _loc5_.height))
         {
            _loc5_ = var_79.getCanvas(var_146,var_250.definition.geometryType);
            if(_loc5_ == null)
            {
               return null;
            }
            _image = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
         }
         var _loc6_:Array = var_79.getBodyParts(param1,var_250.definition,var_91);
         _image.lock();
         _image.fillRect(_image.rect,16777215);
         var _loc7_:Point = _loc5_.offset;
         if(_loc7_ == null)
         {
            _loc7_ = new Point(0,0);
         }
         var _loc8_:int = _loc6_.length - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = _loc6_[_loc8_];
            _loc10_ = _loc4_.getImageContainer(_loc9_,var_548);
            if(_loc10_ && _loc10_.image && _loc10_.regPoint)
            {
               _loc11_ = _loc10_.image;
               _loc12_ = _loc10_.regPoint.clone();
               _image.copyPixels(_loc11_,_loc11_.rect,_loc12_.add(_loc7_),null,null,true);
            }
            _loc8_--;
         }
         _image.unlock();
         var_392 = false;
         if(var_469 != null)
         {
            if(false)
            {
               _loc13_ = convertToGrayscale(_image);
               if(_image)
               {
                  _image.dispose();
               }
               _image = _loc13_;
               _image.paletteMap(_image,_image.rect,new Point(0,0),var_469.reds,[],[]);
            }
            else
            {
               _image.copyChannel(_image,_image.rect,new Point(0,0),2,8);
            }
         }
         if(var_986 && false)
         {
            var_336.add(_loc3_,_image.clone());
         }
         if(_image && param2)
         {
            return _image.clone();
         }
         return _image;
      }
      
      private function resetActions() : Boolean
      {
         var_393 = false;
         var_169 = [];
         var_469 = null;
         var_1158 = 0;
         var_79.removeDynamicItems();
         var_250 = var_807;
         var_250.definition = var_807.definition;
         setActionToParts(var_807);
         getCache().resetBodyPartCache(var_807);
         return true;
      }
      
      public function updateAnimationByFrames(param1:int = 1) : void
      {
         var_548 += param1;
         var_392 = true;
      }
      
      private function errorThis(param1:String) : void
      {
         Logger.log("[AvatarImageError] " + param1);
      }
      
      private function getCache() : AvatarImageCache
      {
         if(var_134 == null)
         {
            var_134 = new AvatarImageCache(var_79,this,_assets,var_146);
         }
         return var_134;
      }
      
      private function setActionToParts(param1:IActiveActionData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            var_250 = param1;
            getCache().setGeometryType(param1.definition.geometryType);
         }
         getCache().setAction(param1);
         var_392 = true;
      }
      
      private function convertToGrayscale(param1:BitmapData, param2:String = "CHANNELS_EQUAL") : BitmapData
      {
         var _loc3_:* = 0.33;
         var _loc4_:* = 0.33;
         var _loc5_:* = 0.33;
         switch(param2)
         {
            case "CHANNELS_UNIQUE":
               _loc3_ = 0.3;
               _loc4_ = 0.59;
               _loc5_ = 0.11;
               break;
            case "CHANNELS_RED":
               _loc3_ = 1;
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case "CHANNELS_GREEN":
               _loc3_ = 0;
               _loc4_ = 1;
               _loc5_ = 0;
               break;
            case "CHANNELS_BLUE":
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 1;
               break;
            case "CHANNELS_DESATURATED":
               _loc3_ = 0.3086;
               _loc4_ = 0.6094;
               _loc5_ = 0.082;
         }
         var _loc7_:Array = [_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,0,0,0,1,0];
         var _loc8_:ColorMatrixFilter = new ColorMatrixFilter(_loc7_);
         var _loc9_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent,4294967295);
         _loc9_.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
         _loc9_.applyFilter(_loc9_,_loc9_.rect,new Point(0,0),_loc8_);
         return _loc9_;
      }
      
      public function getFigure() : AvatarFigureContainer
      {
         return var_451;
      }
      
      public function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData
      {
         return var_79.getBodyPartData(param1.animation.id,var_548,param1.id);
      }
      
      public function getDirection() : int
      {
         return var_91;
      }
      
      public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_808 = false;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         var_671 = var_671 + param1 + _loc3_;
         switch(param1)
         {
            case AvatarAction.const_415:
               switch(_loc3_)
               {
                  case AvatarAction.const_891:
                     if(var_91 == 0)
                     {
                        setDirection(AvatarSetType.const_40,4);
                     }
                     else
                     {
                        setDirection(AvatarSetType.const_40,2);
                     }
                  case AvatarAction.const_540:
                     var_986 = true;
                  case AvatarAction.const_464:
                  case AvatarAction.const_994:
                  case AvatarAction.const_393:
                  case AvatarAction.const_886:
                  case AvatarAction.const_600:
                     addActionData(_loc3_);
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN POSTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_291:
               switch(_loc3_)
               {
                  case AvatarAction.const_545:
                  case AvatarAction.const_377:
                  case AvatarAction.const_664:
                     addActionData(_loc3_);
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN GESTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_1010:
            case AvatarAction.const_290:
            case AvatarAction.const_274:
            case AvatarAction.const_397:
            case AvatarAction.const_413:
            case AvatarAction.const_912:
               addActionData(param1,_loc3_);
               break;
            case AvatarAction.const_931:
            case AvatarAction.const_880:
               _loc4_ = var_79.getActionDefinitionWithState(param1);
               if(_loc4_ != null)
               {
                  logThis("appendAction:" + [_loc3_,"->",_loc4_.getParameterValue(_loc3_)]);
                  _loc3_ = _loc4_.getParameterValue(_loc3_);
               }
               addActionData(param1,_loc3_);
               break;
            default:
               errorThis("appendAction() >> UNKNOWN ACTION TYPE: " + param1);
         }
         return true;
      }
      
      public function get petType() : int
      {
         return -1;
      }
   }
}
