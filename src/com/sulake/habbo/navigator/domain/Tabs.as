package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_621:int = 6;
      
      public static const const_236:int = 5;
      
      public static const const_721:int = 2;
      
      public static const const_343:int = 9;
      
      public static const const_319:int = 4;
      
      public static const const_282:int = 2;
      
      public static const const_598:int = 4;
      
      public static const const_238:int = 8;
      
      public static const const_570:int = 7;
      
      public static const const_279:int = 3;
      
      public static const const_338:int = 1;
      
      public static const const_235:int = 5;
      
      public static const const_472:int = 12;
      
      public static const const_342:int = 1;
      
      public static const const_594:int = 11;
      
      public static const const_543:int = 3;
      
      public static const const_1551:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_420:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_420 = new Array();
         var_420.push(new Tab(_navigator,const_338,const_472,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_390));
         var_420.push(new Tab(_navigator,const_282,const_342,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_390));
         var_420.push(new Tab(_navigator,const_319,const_594,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_1048));
         var_420.push(new Tab(_navigator,const_279,const_236,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_390));
         var_420.push(new Tab(_navigator,const_235,const_238,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_628));
         setSelectedTab(const_338);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_420)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_420)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_420)
         {
            _loc1_.selected = false;
         }
      }
      
      public function include() : Boolean
      {
         return this.getSelected().id == const_319;
      }
      
      public function get tabs() : Array
      {
         return var_420;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
