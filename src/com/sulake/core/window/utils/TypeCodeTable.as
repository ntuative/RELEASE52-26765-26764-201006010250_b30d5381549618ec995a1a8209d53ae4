package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_740;
         param1["bitmap"] = const_727;
         param1["border"] = const_679;
         param1["border_notify"] = const_1412;
         param1["button"] = const_468;
         param1["button_thick"] = const_765;
         param1["button_icon"] = const_1243;
         param1["button_group_left"] = const_569;
         param1["button_group_center"] = const_694;
         param1["button_group_right"] = const_699;
         param1["canvas"] = const_680;
         param1["checkbox"] = const_677;
         param1["closebutton"] = const_873;
         param1["container"] = const_304;
         param1["container_button"] = const_634;
         param1["display_object_wrapper"] = const_538;
         param1["dropmenu"] = const_408;
         param1["dropmenu_item"] = const_492;
         param1["frame"] = const_326;
         param1["frame_notify"] = const_1217;
         param1["header"] = const_723;
         param1["icon"] = const_953;
         param1["itemgrid"] = const_949;
         param1["itemgrid_horizontal"] = const_412;
         param1["itemgrid_vertical"] = const_715;
         param1["itemlist"] = const_934;
         param1["itemlist_horizontal"] = const_356;
         param1["itemlist_vertical"] = const_361;
         param1["maximizebox"] = const_1225;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1368;
         param1["submenu"] = const_1008;
         param1["minimizebox"] = const_1223;
         param1["notify"] = const_1398;
         param1["ICipher"] = const_625;
         param1["password"] = const_654;
         param1["radiobutton"] = const_539;
         param1["region"] = const_487;
         param1["restorebox"] = const_1415;
         param1["scaler"] = const_596;
         param1["scaler_horizontal"] = const_1369;
         param1["scaler_vertical"] = const_1318;
         param1["scrollbar_horizontal"] = const_416;
         param1["scrollbar_vertical"] = const_636;
         param1["scrollbar_slider_button_up"] = const_853;
         param1["scrollbar_slider_button_down"] = const_959;
         param1["scrollbar_slider_button_left"] = const_1013;
         param1["scrollbar_slider_button_right"] = const_842;
         param1["scrollbar_slider_bar_horizontal"] = const_989;
         param1["scrollbar_slider_bar_vertical"] = const_895;
         param1["scrollbar_slider_track_horizontal"] = const_884;
         param1["scrollbar_slider_track_vertical"] = const_915;
         param1["scrollable_itemlist"] = const_1326;
         param1["scrollable_itemlist_vertical"] = const_467;
         param1["scrollable_itemlist_horizontal"] = const_896;
         param1["selector"] = const_644;
         param1["selector_list"] = const_705;
         param1["submenu"] = const_1008;
         param1["tab_button"] = const_632;
         param1["tab_container_button"] = const_1028;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_1021;
         param1["tab_selector"] = const_748;
         param1["text"] = const_719;
         param1["input"] = const_662;
         param1["toolbar"] = const_1184;
         param1["tooltip"] = const_300;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
