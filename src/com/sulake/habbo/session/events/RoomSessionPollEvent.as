package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_135:String = "RSPE_POLL_CONTENT";
      
      public static const const_121:String = "RSPE_POLL_OFFER";
      
      public static const const_70:String = "RSPE_POLL_ERROR";
       
      
      private var var_1048:Array = null;
      
      private var var_1264:String = "";
      
      private var var_1260:String;
      
      private var var_1265:String = "";
      
      private var var_1049:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
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
