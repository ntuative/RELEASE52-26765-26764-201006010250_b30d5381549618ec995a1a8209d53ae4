package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_129:String = "RSPE_VOTE_RESULT";
      
      public static const const_124:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1349:int = 0;
      
      private var var_1071:String = "";
      
      private var var_689:Array;
      
      private var var_1061:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1061 = [];
         var_689 = [];
         super(param1,param2,param7,param8);
         var_1071 = param3;
         var_1061 = param4;
         var_689 = param5;
         if(var_689 == null)
         {
            var_689 = [];
         }
         var_1349 = param6;
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
