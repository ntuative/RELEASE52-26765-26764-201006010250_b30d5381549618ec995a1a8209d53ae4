package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_653:int = 2;
      
      public static const const_857:int = 6;
      
      public static const const_717:int = 1;
      
      public static const const_599:int = 3;
      
      public static const const_844:int = 4;
      
      public static const const_659:int = 5;
       
      
      private var var_1903:String;
      
      private var var_1107:int;
      
      private var var_1771:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1107 = param2;
         var_1771 = param3;
         var_1903 = param4;
      }
      
      public function get time() : String
      {
         return var_1903;
      }
      
      public function get senderId() : int
      {
         return var_1107;
      }
      
      public function get messageText() : String
      {
         return var_1771;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
