package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1849:Number;
      
      private var var_593:Number = 0;
      
      private var var_1848:Number;
      
      private var var_594:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1849 = param1;
         var_1848 = param2;
      }
      
      public function update() : void
      {
         var_594 += var_1848;
         var_593 += var_594;
         if(var_593 > 0)
         {
            var_593 = 0;
            var_594 = var_1849 * -1 * var_594;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_594 = param1;
         var_593 = 0;
      }
      
      public function get location() : Number
      {
         return var_593;
      }
   }
}
