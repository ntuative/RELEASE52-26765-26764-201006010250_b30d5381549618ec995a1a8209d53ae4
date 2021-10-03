package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1536:GarbageMonitor = null;
      
      private var var_1285:int = 0;
      
      private var var_1321:Boolean = false;
      
      private var var_1989:String = "";
      
      private var var_1537:String = "";
      
      private var var_351:Number = 0;
      
      private var var_1284:int = 10;
      
      private var var_2360:Array;
      
      private var var_666:int = 0;
      
      private var var_1283:int = 60;
      
      private var var_1059:int = 0;
      
      private var var_1060:int = 0;
      
      private var var_2100:String = "";
      
      private var var_1988:Number = 0;
      
      private var var_1281:int = 1000;
      
      private var var_1992:Boolean = true;
      
      private var var_1990:Number = 0.15;
      
      private var var_151:IHabboConfigurationManager = null;
      
      private var var_1991:String = "";
      
      private var var_1282:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2360 = [];
         super();
         var_1537 = Capabilities.version;
         var_1989 = Capabilities.os;
         var_1321 = Capabilities.isDebugger;
         var_1991 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1536 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1285 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1536.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1536.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_351;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1283 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1537;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1060;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1281)
         {
            ++var_1059;
            _loc3_ = true;
         }
         else
         {
            ++var_666;
            if(var_666 <= 1)
            {
               var_351 = param1;
            }
            else
            {
               _loc4_ = Number(var_666);
               var_351 = var_351 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1285 > var_1283 * 1000 && var_1282 < var_1284)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_351);
            _loc5_ = true;
            if(var_1992 && var_1282 > 0)
            {
               _loc6_ = differenceInPercents(var_1988,var_351);
               if(_loc6_ < var_1990)
               {
                  _loc5_ = false;
               }
            }
            var_1285 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1988 = var_351;
               if(sendReport())
               {
                  ++var_1282;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1284 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1281 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1991,var_1537,var_1989,var_2100,var_1321,_loc4_,_loc3_,var_1060,var_351,var_1059);
            _connection.send(_loc1_);
            var_1060 = 0;
            var_351 = 0;
            var_666 = 0;
            var_1059 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_151 = param1;
         var_1283 = int(var_151.getKey("performancetest.interval","60"));
         var_1281 = int(var_151.getKey("performancetest.slowupdatelimit","1000"));
         var_1284 = int(var_151.getKey("performancetest.reportlimit","10"));
         var_1990 = Number(var_151.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1992 = Boolean(int(var_151.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
