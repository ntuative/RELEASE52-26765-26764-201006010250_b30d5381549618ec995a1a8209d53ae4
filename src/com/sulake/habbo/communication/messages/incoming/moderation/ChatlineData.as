package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1622:String;
      
      private var var_1889:int;
      
      private var var_1887:int;
      
      private var var_1888:int;
      
      private var var_1890:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1889 = param1.readInteger();
         var_1888 = param1.readInteger();
         var_1887 = param1.readInteger();
         var_1890 = param1.readString();
         var_1622 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1622;
      }
      
      public function get hour() : int
      {
         return var_1889;
      }
      
      public function get minute() : int
      {
         return var_1888;
      }
      
      public function get chatterName() : String
      {
         return var_1890;
      }
      
      public function get chatterId() : int
      {
         return var_1887;
      }
   }
}
