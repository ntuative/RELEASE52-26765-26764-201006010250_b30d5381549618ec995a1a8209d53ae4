package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1241:int;
      
      private var var_1548:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1241 = param1;
         var_1548 = param2;
         Logger.log("READ NODE: " + var_1241 + ", " + var_1548);
      }
      
      public function get nodeName() : String
      {
         return var_1548;
      }
      
      public function get nodeId() : int
      {
         return var_1241;
      }
   }
}
