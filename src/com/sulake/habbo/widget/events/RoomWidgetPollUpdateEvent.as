package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_135:String = "RWPUW_CONTENT";
      
      public static const const_121:String = "RWPUW_OFFER";
      
      public static const const_70:String = "RWPUW_ERROR";
       
      
      private var var_1048:Array = null;
      
      private var var_1264:String = "";
      
      private var var_1260:String;
      
      private var var_1265:String = "";
      
      private var var_1049:int = 0;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         _id = param1;
         super(param2,param3,param4);
      }
      
      public function get questionArray() : Array
      {
         return var_1048;
      }
      
      public function get startMessage() : String
      {
         return var_1264;
      }
      
      public function get summary() : String
      {
         return var_1260;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1264 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1049 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1260 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1049;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1265 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1265;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1048 = param1;
      }
   }
}
