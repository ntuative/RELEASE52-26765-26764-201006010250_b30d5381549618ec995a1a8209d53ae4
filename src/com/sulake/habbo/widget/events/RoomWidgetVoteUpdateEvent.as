package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_129:String = "RWPUE_VOTE_RESULT";
      
      public static const const_124:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1349:int;
      
      private var var_1071:String;
      
      private var var_689:Array;
      
      private var var_1061:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1071 = param2;
         var_1061 = param3;
         var_689 = param4;
         if(var_689 == null)
         {
            var_689 = [];
         }
         var_1349 = param5;
      }
      
      public function get votes() : Array
      {
         return var_689.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1349;
      }
      
      public function get question() : String
      {
         return var_1071;
      }
      
      public function get choices() : Array
      {
         return var_1061.slice();
      }
   }
}
