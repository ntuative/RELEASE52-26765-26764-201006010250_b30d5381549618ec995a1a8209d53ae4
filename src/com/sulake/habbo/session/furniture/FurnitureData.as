package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1524:String = "e";
      
      public static const const_1548:String = "i";
      
      public static const const_1564:String = "s";
       
      
      private var _id:int;
      
      private var var_1920:String;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1922:int;
      
      private var var_1184:Array;
      
      private var var_1923:int;
      
      private var var_1921:int;
      
      private var var_1919:int;
      
      private var _name:String;
      
      private var var_1924:int;
      
      private var var_1236:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1922 = param4;
         var_1924 = param5;
         var_1923 = param6;
         var_1921 = param7;
         var_1919 = param8;
         var_1184 = param9;
         _title = param10;
         var_1236 = param11;
         var_1920 = param12;
      }
      
      public function get tileSizeY() : int
      {
         return var_1921;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1919;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get adUrl() : String
      {
         return var_1920;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1924;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1922;
      }
      
      public function get tileSizeX() : int
      {
         return var_1923;
      }
      
      public function get colours() : Array
      {
         return var_1184;
      }
      
      public function get description() : String
      {
         return var_1236;
      }
   }
}
