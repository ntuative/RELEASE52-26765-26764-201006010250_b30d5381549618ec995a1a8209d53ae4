package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_121:DisplayObject;
      
      private var var_2351:uint;
      
      private var var_857:IWindowToolTipAgentService;
      
      private var var_858:IWindowMouseScalingService;
      
      private var var_231:IWindowContext;
      
      private var var_855:IWindowFocusManagerService;
      
      private var var_854:IWindowMouseListenerService;
      
      private var var_856:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2351 = 0;
         var_121 = param2;
         var_231 = param1;
         var_856 = new WindowMouseDragger(param2);
         var_858 = new WindowMouseScaler(param2);
         var_854 = new WindowMouseListener(param2);
         var_855 = new FocusManager(param2);
         var_857 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_858;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_855;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_857;
      }
      
      public function dispose() : void
      {
         if(var_856 != null)
         {
            var_856.dispose();
            var_856 = null;
         }
         if(var_858 != null)
         {
            var_858.dispose();
            var_858 = null;
         }
         if(var_854 != null)
         {
            var_854.dispose();
            var_854 = null;
         }
         if(var_855 != null)
         {
            var_855.dispose();
            var_855 = null;
         }
         if(var_857 != null)
         {
            var_857.dispose();
            var_857 = null;
         }
         var_231 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_854;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_856;
      }
   }
}
