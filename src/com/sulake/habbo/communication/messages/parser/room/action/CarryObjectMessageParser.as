package com.sulake.habbo.communication.messages.parser.room.action
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CarryObjectMessageParser implements IMessageParser
   {
       
      
      private var _userId:int = 0;
      
      private var var_1072:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1306:String;
      
      public function CarryObjectMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         _userId = param1.readInteger();
         var_1072 = param1.readInteger();
         if(var_1072 > 0)
         {
            var_1306 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         _roomId = 0;
         _roomCategory = 0;
         _userId = 0;
         var_1072 = 0;
         var_1306 = "";
         return true;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get itemType() : int
      {
         return var_1072;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get itemName() : String
      {
         return var_1306;
      }
   }
}
