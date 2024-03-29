package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_678:String = "Rectangle";
      
      public static const const_61:String = "Boolean";
      
      public static const const_602:String = "Number";
      
      public static const const_66:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_690:String = "Point";
      
      public static const const_904:String = "Array";
      
      public static const const_1033:String = "uint";
      
      public static const const_457:String = "hex";
      
      public static const const_881:String = "Map";
       
      
      private var var_624:String;
      
      private var var_178:Object;
      
      private var var_2368:Boolean;
      
      private var _type:String;
      
      private var var_2105:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_624 = param1;
         var_178 = param2;
         _type = param3;
         var_2105 = param4;
         var_2368 = param3 == const_881 || param3 == const_904 || param3 == const_690 || param3 == const_678;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_457:
               return "0x" + uint(var_178).toString(16);
            case const_61:
               return Boolean(var_178) == true ? "HabboNavigatorCom_ros_flat_controller_xml" : "false";
            case const_690:
               return "Point(" + Point(var_178).x + ", " + Point(var_178).y + ")";
            case const_678:
               return "Rectangle(" + Rectangle(var_178).x + ", " + Rectangle(var_178).y + ", " + Rectangle(var_178).width + ", " + Rectangle(var_178).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_881:
               _loc3_ = var_178 as Map;
               _loc1_ = "<var key=\"" + var_624 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_904:
               _loc4_ = var_178 as Array;
               _loc1_ = "<var key=\"" + var_624 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_690:
               _loc5_ = var_178 as Point;
               _loc1_ = "<var key=\"" + var_624 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_66 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_66 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_678:
               _loc6_ = var_178 as Rectangle;
               _loc1_ = "<var key=\"" + var_624 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_66 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_66 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_66 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_66 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_457:
               _loc1_ = "<var key=\"" + var_624 + "\" value=\"" + "0x" + uint(var_178).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_624 + "\" value=\"" + var_178 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_178;
      }
      
      public function get valid() : Boolean
      {
         return var_2105;
      }
      
      public function get key() : String
      {
         return var_624;
      }
   }
}
