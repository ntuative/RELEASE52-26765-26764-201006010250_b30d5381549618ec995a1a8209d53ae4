package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1810:Boolean;
      
      private var var_1474:Array;
      
      private var var_1811:Boolean;
      
      private var var_1809:Boolean;
      
      private var var_1807:Boolean;
      
      private var var_156:Array;
      
      private var var_1805:Boolean;
      
      private var var_1804:Boolean;
      
      private var var_1475:Array;
      
      private var var_1808:Boolean;
      
      private var var_1806:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1806;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1810;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1811;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1805;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1804;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1474;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_156 = [];
         var_1474 = [];
         _roomMessageTemplates = [];
         var_1475 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_156.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1474.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1475.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1805 = param1.readBoolean();
         var_1807 = param1.readBoolean();
         var_1811 = param1.readBoolean();
         var_1809 = param1.readBoolean();
         var_1806 = param1.readBoolean();
         var_1804 = param1.readBoolean();
         var_1810 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1808 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1809;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1475;
      }
      
      public function get issues() : Array
      {
         return var_156;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1808;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1807;
      }
   }
}
