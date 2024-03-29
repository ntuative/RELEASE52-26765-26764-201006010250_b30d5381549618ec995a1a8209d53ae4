package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class FurnitureCuboidVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private var var_1508:int = 0;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_104:Array;
      
      private var var_1900:Boolean = false;
      
      public function FurnitureCuboidVisualization()
      {
         var_104 = [];
         super();
      }
      
      protected function updatePlanes(param1:IRoomGeometry, param2:int) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null || _assetLibrary == null)
         {
            return;
         }
         ++var_1508;
         var _loc4_:int = param2;
         var _loc5_:int = 0;
         while(_loc5_ < var_104.length)
         {
            _loc6_ = false;
            _loc7_ = "plane " + _loc5_ + " " + param1.scale;
            _loc8_ = _assetLibrary.getAssetByName(_loc7_) as BitmapDataAsset;
            if(_loc8_ == null)
            {
               _loc8_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
               _assetLibrary.setAsset(_loc7_,_loc8_);
            }
            _loc9_ = var_104[_loc5_] as FurniturePlane;
            if(_loc9_ != null)
            {
               _loc11_ = _loc3_.getDirection().x;
               if(_loc11_ / 45 == 2 || _loc11_ / 45 == 6)
               {
                  _loc9_.setRotation(true);
               }
               else
               {
                  _loc9_.setRotation(false);
               }
               if(_loc9_.update(param1,_loc4_))
               {
                  _loc12_ = _loc9_.bitmapData;
                  _loc13_ = _loc8_.content as BitmapData;
                  if(_loc12_ == null)
                  {
                     _loc8_ = null;
                  }
                  else if(_loc13_ != _loc12_)
                  {
                     if(_loc13_ != null)
                     {
                        _loc13_.dispose();
                     }
                     _loc8_.setUnknownContent(_loc12_);
                  }
                  _loc6_ = true;
               }
            }
            else
            {
               _loc8_ = null;
            }
            _loc10_ = getSprite(_loc5_);
            if(_loc10_ != null)
            {
               if(_loc9_ != null)
               {
                  _loc14_ = _loc9_.offset;
                  _loc10_.offsetX = -_loc14_.x;
                  _loc10_.offsetY = -_loc14_.y;
                  _loc10_.color = _loc9_.color;
                  _loc10_.visible = _loc9_.visible;
               }
               else
               {
                  _loc10_.visible = false;
               }
               if(_loc8_ != null)
               {
                  _loc10_.asset = _loc8_.content as BitmapData;
               }
               else
               {
                  _loc10_.asset = null;
               }
               if(_loc6_)
               {
                  _loc10_.assetName = _loc7_ + "_" + _loc3_.getInstanceId() + "_" + var_1508;
               }
               _loc10_.relativeDepth = _loc9_.relativeDepth;
            }
            _loc5_++;
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         super.dispose();
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         if(var_104 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_104.length)
            {
               _loc2_ = var_104[_loc1_] as FurniturePlane;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_104 = null;
         }
      }
      
      protected function initializePlanes() : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(var_1900)
         {
            return;
         }
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc3_:Number = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_336);
         var _loc4_:Number = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_405);
         var _loc5_:Number = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_619);
         if(isNaN(_loc3_) || isNaN(_loc4_) || isNaN(_loc5_))
         {
            return;
         }
         var _loc6_:Vector3d = new Vector3d(_loc3_,0,0);
         var _loc7_:Vector3d = new Vector3d(0,_loc4_,0);
         var _loc8_:Vector3d = new Vector3d(-0.5,-0.5,0);
         if(_loc8_ != null && _loc6_ != null && _loc7_ != null)
         {
            _loc9_ = Vector3d.crossProduct(_loc6_,_loc7_);
            _loc10_ = new FurniturePlane(_loc8_,_loc6_,_loc7_);
            _loc10_.color = 16776960;
            var_104.push(_loc10_);
            var_1900 = true;
            defineSprites();
            return;
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(_assetLibrary == null)
         {
            _assetLibrary = new AssetLibrary("furniture cuboid visualization - " + _loc3_.getInstanceId());
         }
         if(param1 == null)
         {
            return;
         }
         initializePlanes();
         updatePlanes(param1,param2);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         return true;
      }
      
      protected function defineSprites() : void
      {
         createSprites(1);
      }
   }
}
