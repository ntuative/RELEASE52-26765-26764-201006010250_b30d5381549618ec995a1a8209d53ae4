package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1384:int = 4;
      
      public static const const_574:int = 3;
      
      public static const const_552:int = 2;
      
      public static const const_998:int = 1;
       
      
      private var var_1969:String;
      
      private var _disposed:Boolean;
      
      private var var_1954:int;
      
      private var var_1971:Boolean;
      
      private var var_892:String;
      
      private var var_878:PublicRoomData;
      
      private var var_1967:int;
      
      private var _index:int;
      
      private var var_1970:String;
      
      private var _type:int;
      
      private var var_1893:String;
      
      private var var_877:GuestRoomData;
      
      private var var_1968:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1969 = param1.readString();
         var_1968 = param1.readString();
         var_1971 = param1.readInteger() == 1;
         var_1970 = param1.readString();
         var_892 = param1.readString();
         var_1967 = param1.readInteger();
         var_1954 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_998)
         {
            var_1893 = param1.readString();
         }
         else if(_type == const_574)
         {
            var_878 = new PublicRoomData(param1);
         }
         else if(_type == const_552)
         {
            var_877 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1967;
      }
      
      public function get popupCaption() : String
      {
         return var_1969;
      }
      
      public function get userCount() : int
      {
         return var_1954;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1971;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_998)
         {
            return 0;
         }
         if(this.type == const_552)
         {
            return this.var_877.maxUserCount;
         }
         if(this.type == const_574)
         {
            return this.var_878.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1968;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_877 != null)
         {
            this.var_877.dispose();
            this.var_877 = null;
         }
         if(this.var_878 != null)
         {
            this.var_878.dispose();
            this.var_878 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_877;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1970;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_878;
      }
      
      public function get picRef() : String
      {
         return var_892;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1893;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
