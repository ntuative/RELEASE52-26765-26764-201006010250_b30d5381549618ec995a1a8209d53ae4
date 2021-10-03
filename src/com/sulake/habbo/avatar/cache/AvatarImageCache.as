package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
   import com.sulake.habbo.avatar.AvatarImagePartContainer;
   import com.sulake.habbo.avatar.AvatarStructure;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.AnimationLayerData;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarBodyPartType;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.GeometryType;
   import com.sulake.habbo.avatar.palette.PaletteMap;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class AvatarImageCache
   {
      
      private static const const_1464:int = 60000;
       
      
      private var var_134:Map;
      
      private var var_146:String;
      
      private var _assets:AssetAliasCollection;
      
      private var var_615:String;
      
      private var var_79:AvatarStructure;
      
      private var var_869:IAvatarImage;
      
      public function AvatarImageCache(param1:AvatarStructure, param2:IAvatarImage, param3:AssetAliasCollection, param4:String)
      {
         super();
         var_79 = param1;
         var_869 = param2;
         _assets = param3;
         var_146 = param4;
         var_134 = new Map();
      }
      
      private function updateBodyPartCache(param1:String, param2:AvatarImageBodyPartCache) : void
      {
         if(var_134 == null)
         {
            var_134 = new Map();
         }
         var_134.add(param1,param2);
      }
      
      public function setGeometryType(param1:String) : void
      {
         if(var_615 == param1 || var_615 == GeometryType.const_908 && param1 == GeometryType.const_848 || param1 == GeometryType.const_908 && var_615 == GeometryType.const_848)
         {
            var_615 = param1;
            return;
         }
         disposeInactiveActions(0);
         var_615 = param1;
      }
      
      public function getAnimationDataInFrame(param1:String, param2:int) : AnimationLayerData
      {
         var _loc5_:* = null;
         var _loc3_:AvatarImageBodyPartCache = getBodyPartCache(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:IActiveActionData = _loc3_.getAction();
         if(_loc4_ == null || !_loc4_.definition.isAnimation)
         {
            return null;
         }
         return var_79.getBodyPartData(_loc4_.definition.state + "." + _loc4_.actionParameter,param2,param1);
      }
      
      public function getBodyPartCache(param1:String) : AvatarImageBodyPartCache
      {
         if(var_134 == null)
         {
            var_134 = new Map();
         }
         var _loc2_:AvatarImageBodyPartCache = var_134.getValue(param1) as AvatarImageBodyPartCache;
         if(_loc2_ == null)
         {
            _loc2_ = new AvatarImageBodyPartCache();
            var_134.add(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function getImageContainer(param1:String, param2:int) : AvatarImageBodyPartContainer
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc3_:AvatarImageBodyPartCache = getBodyPartCache(param1);
         if(_loc3_ == null)
         {
            debugInfo("[CacheMiss (getBodyPartCache)] [AvatarImageCache.getImageContainer] bodyPartId: " + param1);
            _loc3_ = new AvatarImageBodyPartCache();
            updateBodyPartCache(param1,_loc3_);
         }
         var _loc4_:int = _loc3_.getDirection();
         var _loc5_:IActiveActionData = _loc3_.getAction();
         var _loc6_:IActiveActionData = _loc5_;
         var _loc7_:Boolean = false;
         var _loc8_:int = _loc4_;
         var _loc9_:Point = new Point(0,0);
         var _loc12_:int = param2;
         var _loc13_:* = [];
         var _loc14_:Dictionary = new Dictionary();
         if(!_loc5_ || !_loc5_.definition)
         {
            debugInfo("Action not found!");
         }
         else if(_loc5_.definition.isAnimation)
         {
            _loc17_ = var_79.getAnimation(_loc5_.definition.state + "." + _loc5_.actionParameter);
            if(_loc17_ != null)
            {
               _loc18_ = _loc17_.getLayerData(param2,param1);
               if(_loc18_ != null)
               {
                  _loc8_ = _loc4_ + _loc18_.directionOffset;
                  if(_loc18_.directionOffset < 0)
                  {
                     if(_loc8_ < 0)
                     {
                        _loc8_ = 8 + _loc8_;
                     }
                     if(_loc8_ > 7)
                     {
                        _loc8_ = 8 - _loc8_;
                     }
                  }
                  else
                  {
                     if(_loc8_ < 0)
                     {
                        _loc8_ += 8;
                     }
                     if(_loc8_ > 7)
                     {
                        _loc8_ -= 8;
                     }
                  }
                  if(var_146 == AvatarScaleType.SMALL)
                  {
                     _loc9_.x = _loc18_.dx / 2;
                     _loc9_.y = _loc18_.dy / 2;
                  }
                  else
                  {
                     _loc9_.x = _loc18_.dx;
                     _loc9_.y = _loc18_.dy;
                  }
                  _loc12_ = _loc18_.animationFrame;
                  if(_loc18_.action != null)
                  {
                     _loc5_ = _loc18_.action;
                  }
                  if(_loc18_.type == AnimationLayerData.const_624)
                  {
                     if(_loc18_.action != null)
                     {
                        _loc6_ = _loc18_.action;
                     }
                     _loc4_ = _loc8_;
                  }
                  else if(_loc18_.type == AnimationLayerData.const_379)
                  {
                     _loc4_ = _loc8_;
                  }
                  _loc7_ = true;
               }
               _loc13_ = _loc17_.removeData;
               _loc14_ = _loc18_.items;
            }
         }
         var _loc15_:AvatarImageActionCache = _loc3_.getActionCache(_loc6_);
         if(_loc15_ == null)
         {
            debugInfo("[CacheMiss (bodyPartCache.getActionCache)] [AvatarImageCache.getImageContainer] action.id: " + [param1,_loc5_.id]);
            _loc15_ = new AvatarImageActionCache();
            _loc3_.updateActionCache(_loc6_,_loc15_);
         }
         var _loc16_:AvatarImageDirectionCache = _loc15_.getDirectionCache(_loc4_);
         if(_loc16_ == null)
         {
            debugInfo("[CacheMiss (actionCache.getDirectionCache)] [AvatarImageCache.getImageContainer] direction: " + [param1,_loc4_]);
            _loc10_ = var_79.getParts(param1,var_869.getFigure(),_loc6_,var_615,_loc4_,_loc13_,_loc14_);
            _loc16_ = new AvatarImageDirectionCache(_loc10_);
            _loc15_.updateDirectionCache(_loc4_,_loc16_);
         }
         _loc11_ = _loc16_.getImageContainer(_loc12_);
         if(_loc11_ == null)
         {
            debugInfo("[ImageContainer (" + _loc5_.id + " " + _loc5_.definition + " type: " + _loc5_.actionType + ")]");
            _loc19_ = _loc16_.getPartList();
            _loc11_ = renderBodyPart(_loc4_,_loc19_,_loc12_,_loc5_);
            if(_loc11_ != null)
            {
               debugInfo("[ImageContainer creation (" + _loc5_.id + " " + _loc5_.definition + " type: " + _loc5_.actionType + ")]");
               _loc16_.updateImageContainer(_loc11_,_loc12_);
            }
            else
            {
               debugInfo("[ImageContainer was null: " + param1 + "]");
            }
         }
         if(_loc11_ != null)
         {
            _loc11_.offset = _loc9_;
         }
         return _loc11_;
      }
      
      public function dispose() : void
      {
         debugInfo("[AvatarImageCache dispose]");
         var_79 = null;
         var_869 = null;
         _assets = null;
         if(var_134 != null)
         {
            var_134.dispose();
         }
      }
      
      private function debugInfo(param1:String) : void
      {
      }
      
      private function createUnionImage(param1:Array, param2:Boolean) : ImageData
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc5_:Rectangle = new Rectangle();
         for each(_loc6_ in param1)
         {
            _loc5_ = _loc5_.union(_loc6_.offsetRect);
         }
         _loc4_ = new Point(-_loc5_.left,-_loc5_.top);
         _loc3_ = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
         for each(_loc6_ in param1)
         {
            _loc7_ = _loc4_.subtract(_loc6_.regpoint);
            _loc3_.copyPixels(_loc6_.bitmap,_loc6_.bitmap.rect,_loc7_,null,null,true);
         }
         return new ImageData(_loc3_,_loc4_,param2,false);
      }
      
      private function renderBodyPart(param1:int, param2:Array, param3:int, param4:IActiveActionData) : AvatarImageBodyPartContainer
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         var _loc18_:int = 0;
         var _loc20_:* = null;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:* = null;
         var _loc36_:* = NaN;
         var _loc37_:* = null;
         if(param2 == null)
         {
            return null;
         }
         if(param2.length == 0)
         {
            return null;
         }
         var _loc5_:AvatarCanvas = var_79.getCanvas(var_146,var_615);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc17_:Boolean = false;
         var _loc19_:Boolean = false;
         var _loc21_:Point = new Point(0,_loc5_.height - int(_loc5_.width / 4));
         var _loc22_:Array = new Array();
         var _loc23_:int = param2.length - 1;
         while(_loc23_ >= 0)
         {
            _loc7_ = param2[_loc23_] as AvatarImagePartContainer;
            _loc18_ = param1;
            _loc6_ = _loc7_.bodyPartId;
            _loc7_ = param2[_loc23_];
            _loc10_ = _loc7_.partType;
            _loc11_ = _loc7_.partId;
            _loc12_ = _loc7_.getFrameIndex(param3);
            _loc13_ = _loc7_.color;
            _loc15_ = _loc7_.action;
            _loc16_ = _loc7_.isColorable;
            _loc19_ = _loc7_.isBlendable;
            _loc20_ = _loc7_.blendTransform;
            if(_loc10_ == "ey")
            {
               _loc16_ = false;
            }
            _loc28_ = param4.definition.assetPartDefinition;
            _loc29_ = param4.definition.state;
            if(AvatarDirectionAngle.const_1275[param1])
            {
               if(!((_loc10_ == "lh" || _loc10_ == "ls" || _loc10_ == "lc" || _loc10_ == "lhs") && _loc28_ == "wav"))
               {
                  if(!((_loc10_ == "rh" || _loc10_ == "rs" || _loc10_ == "rc" || _loc10_ == "rhs") && _loc28_ == "drk"))
                  {
                     if(!(_loc10_ == "rhs" && _loc28_ == "crr"))
                     {
                        if(_loc10_ != "ri")
                        {
                           if(_loc10_ != "cp")
                           {
                              _loc17_ = true;
                              if(param1 == 4)
                              {
                                 _loc18_ = 2;
                              }
                              else if(param1 == 5)
                              {
                                 _loc18_ = 1;
                              }
                              else if(param1 == 6)
                              {
                                 _loc18_ = 0;
                              }
                              if(_loc7_.flippedPartType != _loc10_)
                              {
                                 _loc10_ = _loc7_.flippedPartType;
                              }
                           }
                        }
                     }
                  }
               }
            }
            _loc9_ = var_146 + "_" + _loc15_.assetPartDefinition + "_" + _loc10_ + "_" + _loc11_ + "_" + _loc18_ + "_" + _loc12_;
            _loc14_ = _assets.getAssetByName(_loc9_) as BitmapDataAsset;
            if(_loc14_ == null)
            {
               _loc9_ = var_146 + "_std_" + _loc10_ + "_" + _loc11_ + "_" + _loc18_ + "_0";
               _loc14_ = _assets.getAssetByName(_loc9_) as BitmapDataAsset;
            }
            if(!(!_loc14_ || !_loc14_.content))
            {
               if(_loc7_.paletteMapId > -1)
               {
                  _loc31_ = var_79.renderManager.paletteManager.getPalette(_loc7_.paletteMapId);
                  _loc32_ = (_loc14_.content as BitmapData).clone();
                  if(_loc32_ != null && _loc31_ != null)
                  {
                     _loc33_ = _loc32_.getPixels(_loc32_.rect);
                     _loc34_ = _loc31_.colorize(_loc33_);
                     _loc8_ = new BitmapData(_loc32_.width,_loc32_.height);
                     _loc8_.setPixels(_loc8_.rect,_loc34_);
                  }
                  else
                  {
                     _loc8_ = (_loc14_.content as BitmapData).clone();
                  }
               }
               else
               {
                  _loc8_ = (_loc14_.content as BitmapData).clone();
               }
               debugInfo("Render part: " + _loc9_);
               if(_loc8_ == null)
               {
                  return null;
               }
               if((_loc29_ == AvatarAction.const_994 || _loc29_ == AvatarAction.const_393) && (_loc6_ == AvatarBodyPartType.const_221 || _loc6_ == AvatarBodyPartType.const_1344 || _loc6_ == AvatarBodyPartType.const_1360) && _loc7_.color != null)
               {
                  _loc35_ = _loc7_.color.colorTransform;
                  _loc36_ = 0.7;
                  _loc37_ = new ColorTransform(_loc35_.redMultiplier * _loc36_,_loc35_.greenMultiplier * _loc36_ + 0.3,_loc35_.blueMultiplier * _loc36_ + 0.3,_loc35_.alphaMultiplier,0,0,20);
                  _loc8_.colorTransform(_loc8_.rect,_loc37_);
               }
               else if(_loc16_ && _loc7_.color != null)
               {
                  _loc8_.colorTransform(_loc8_.rect,_loc7_.color.colorTransform);
               }
               if(_loc19_)
               {
                  _loc8_.colorTransform(_loc8_.rect,_loc20_);
               }
               _loc30_ = new ImageData(_loc8_,_loc14_.offset,false,false);
               _loc22_.push(_loc30_);
            }
            _loc23_--;
         }
         if(_loc22_ == null || _loc22_.length == 0)
         {
            return null;
         }
         var _loc24_:ImageData = createUnionImage(_loc22_,_loc17_);
         var _loc25_:Point = new Point(-_loc24_.regpoint.x,_loc21_.y - _loc24_.regpoint.y);
         if(_loc17_)
         {
            if(var_146 == AvatarScaleType.const_55)
            {
               _loc25_.x += 67;
            }
            else
            {
               _loc25_.x += 31;
            }
         }
         for each(_loc26_ in _loc22_)
         {
            if(_loc26_)
            {
               _loc26_.dispose();
            }
         }
         _loc27_ = new AvatarImageBodyPartContainer(_loc24_.bitmap.clone(),_loc25_);
         _loc24_.dispose();
         return _loc27_;
      }
      
      public function setAction(param1:IActiveActionData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:Array = var_79.getActiveBodyPartIds(param1);
         var _loc5_:int = getTimer();
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = getBodyPartCache(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.setAction(param1,_loc5_);
            }
         }
      }
      
      public function disposeInactiveActions(param1:int = 60000) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_134 != null)
         {
            _loc2_ = var_134.getKeys();
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = var_134.getValue(_loc3_) as AvatarImageBodyPartCache;
               if(_loc4_ != null)
               {
                  _loc4_.disposeActions(param1);
               }
            }
         }
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = var_79.getBodyPartsUnordered(param1);
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = getBodyPartCache(_loc4_);
            if(_loc5_ != null)
            {
               _loc5_.setDirection(param2);
            }
         }
      }
      
      public function resetBodyPartCache(param1:IActiveActionData) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(var_134 != null)
         {
            _loc2_ = var_134.getKeys();
            _loc3_ = getTimer();
            for each(_loc4_ in _loc2_)
            {
               _loc5_ = var_134.getValue(_loc4_) as AvatarImageBodyPartCache;
               if(_loc5_ != null)
               {
                  _loc5_.setAction(param1,_loc3_);
               }
            }
         }
      }
   }
}
