package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2357:Boolean;
      
      private var var_2356:int;
      
      private var var_2354:Boolean;
      
      private var var_1435:String;
      
      private var var_1190:String;
      
      private var var_1962:int;
      
      private var var_1693:String;
      
      private var var_2355:String;
      
      private var var_1694:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1962 = param1.readInteger();
         this.var_1435 = param1.readString();
         this.var_1693 = param1.readString();
         this.var_2357 = param1.readBoolean();
         this.var_2354 = param1.readBoolean();
         param1.readString();
         this.var_2356 = param1.readInteger();
         this.var_1694 = param1.readString();
         this.var_2355 = param1.readString();
         this.var_1190 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1190;
      }
      
      public function get avatarName() : String
      {
         return this.var_1435;
      }
      
      public function get avatarId() : int
      {
         return this.var_1962;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2357;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2355;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1694;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2354;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1693;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2356;
      }
   }
}
