package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1779:int;
      
      private var var_451:String;
      
      private var var_1690:int;
      
      private var var_1775:int;
      
      private var var_1772:int;
      
      private var var_1774:int;
      
      private var _nutrition:int;
      
      private var var_1181:int;
      
      private var var_1776:int;
      
      private var var_1778:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1773:int;
      
      private var var_1777:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1690;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1774;
      }
      
      public function flush() : Boolean
      {
         var_1181 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1776;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1778;
      }
      
      public function get maxNutrition() : int
      {
         return var_1777;
      }
      
      public function get figure() : String
      {
         return var_451;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1775;
      }
      
      public function get petId() : int
      {
         return var_1181;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1181 = param1.readInteger();
         _name = param1.readString();
         var_1690 = param1.readInteger();
         var_1776 = param1.readInteger();
         var_1772 = param1.readInteger();
         var_1778 = param1.readInteger();
         _energy = param1.readInteger();
         var_1774 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1777 = param1.readInteger();
         var_451 = param1.readString();
         var_1775 = param1.readInteger();
         var_1773 = param1.readInteger();
         var_1779 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1772;
      }
      
      public function get ownerId() : int
      {
         return var_1773;
      }
      
      public function get age() : int
      {
         return var_1779;
      }
   }
}
