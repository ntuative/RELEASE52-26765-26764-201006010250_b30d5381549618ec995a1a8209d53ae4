package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomObjectVisualizationEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_813:Number = 1.5;
       
      
      private var var_344:Vector3d = null;
      
      private var _selected:Boolean = false;
      
      public function AvatarLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_389,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         var_344 = null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(var_344 == null || var_344.x != _loc2_.x || var_344.y != _loc2_.y || var_344.z != _loc2_.z)
               {
                  if(var_344 == null)
                  {
                     var_344 = new Vector3d();
                  }
                  var_344.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_407,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_211,_loc6_,_loc7_);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc2_ = param1 as RoomObjectMoveUpdateMessage;
            if(_loc2_ != null && targetIsWarping(_loc2_.realTargetLoc))
            {
               Logger.log("Target warp warning!");
               _loc3_ = new AvatarWalkWarpingWarningEvent();
               eventDispatcher.dispatchEvent(_loc3_);
            }
         }
         super.processUpdateMessage(param1);
         if(object != null)
         {
            _loc4_ = object.getModelController();
            if(object.getType() == RoomObjectVisualizationEnum.const_137 || object.getType() == RoomObjectVisualizationEnum.BOT)
            {
               if(param1 is RoomObjectAvatarUpdateMessage)
               {
                  _loc5_ = param1 as RoomObjectAvatarUpdateMessage;
                  if(_loc5_ != null)
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_310,_loc5_.dirHead);
                  }
               }
               if(param1 is RoomObjectAvatarWaveUpdateMessage)
               {
                  _loc6_ = param1 as RoomObjectAvatarWaveUpdateMessage;
                  if(_loc6_.isWaving)
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_311,getTimer());
                  }
                  else
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_311,-1);
                  }
               }
               if(param1 is RoomObjectAvatarTypingUpdateMessage)
               {
                  _loc7_ = param1 as RoomObjectAvatarTypingUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_975,Number(_loc7_.isTyping));
               }
               if(param1 is RoomObjectAvatarFigureUpdateMessage)
               {
                  _loc8_ = param1 as RoomObjectAvatarFigureUpdateMessage;
                  _loc9_ = _loc4_.getString(RoomObjectVariableEnum.const_184);
                  _loc10_ = _loc8_.figure;
                  _loc11_ = _loc8_.gender;
                  if(_loc9_ != null && _loc9_.indexOf(".bds-") != -1)
                  {
                     _loc10_ += _loc9_.substr(_loc9_.indexOf(".bds-"));
                  }
                  _loc4_.setString(RoomObjectVariableEnum.const_184,_loc10_);
                  _loc4_.setString(RoomObjectVariableEnum.const_859,_loc11_);
               }
               if(param1 is RoomObjectAvatarDanceUpdateMessage)
               {
                  _loc12_ = param1 as RoomObjectAvatarDanceUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_941,_loc12_.danceStyle);
               }
               if(param1 is RoomObjectAvatarSleepUpdateMessage)
               {
                  _loc13_ = param1 as RoomObjectAvatarSleepUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_434,Number(_loc13_.isSleeping));
               }
               if(param1 is RoomObjectAvatarEffectUpdateMessage)
               {
                  _loc14_ = param1 as RoomObjectAvatarEffectUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_972,_loc14_.effect);
               }
               if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
               {
                  _loc15_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_551,_loc15_.itemType);
                  if(_loc15_.itemType > 0)
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_681,getTimer());
                  }
                  else
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_681,-1);
                  }
               }
               if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
               {
                  _loc16_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_1019,_loc16_.itemType);
               }
               if(param1 is RoomObjectAvatarGestureUpdateMessage)
               {
                  _loc17_ = param1 as RoomObjectAvatarGestureUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_383,_loc17_.gesture);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_429,getTimer());
               }
               if(param1 is RoomObjectAvatarChatUpdateMessage)
               {
                  _loc18_ = param1 as RoomObjectAvatarChatUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_558,_loc18_.numberOfWords);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_726,getTimer());
               }
               if(param1 is RoomObjectAvatarSignUpdateMessage)
               {
                  _loc19_ = param1 as RoomObjectAvatarSignUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_971,_loc19_.signType);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_878,getTimer());
               }
               if(param1 is RoomObjectAvatarPostureUpdateMessage)
               {
                  _loc20_ = param1 as RoomObjectAvatarPostureUpdateMessage;
                  _loc4_.setString(RoomObjectVariableEnum.const_272,_loc20_.postureType);
                  _loc4_.setString(RoomObjectVariableEnum.const_769,_loc20_.parameter);
               }
               if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
               {
                  _loc21_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
                  _loc4_.setString(RoomObjectVariableEnum.const_610,_loc21_.rawData);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_1239,Number(_loc21_.isAdmin));
               }
               if(param1 is RoomObjectAvatarSelectedMessage)
               {
                  _loc22_ = param1 as RoomObjectAvatarSelectedMessage;
                  _selected = _loc22_.selected;
                  var_344 = null;
               }
            }
         }
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_813 || Math.abs(_loc2_.y - param1.y) > const_813)
         {
            return true;
         }
         return false;
      }
   }
}
