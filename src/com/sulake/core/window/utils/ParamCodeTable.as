package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["ICipher"] = const_138;
         param1["bound_to_parent_rect"] = const_92;
         param1["child_window"] = const_1053;
         param1["embedded_controller"] = const_305;
         param1["resize_to_accommodate_children"] = const_67;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_614;
         param1["mouse_dragging_target"] = const_208;
         param1["mouse_dragging_trigger"] = const_333;
         param1["mouse_scaling_target"] = const_251;
         param1["mouse_scaling_trigger"] = const_448;
         param1["horizontal_mouse_scaling_trigger"] = const_207;
         param1["vertical_mouse_scaling_trigger"] = const_215;
         param1["observe_parent_input_events"] = const_981;
         param1["optimize_region_to_layout_size"] = const_463;
         param1["parent_window"] = const_906;
         param1["relative_horizontal_scale_center"] = const_164;
         param1["relative_horizontal_scale_fixed"] = const_131;
         param1["relative_horizontal_scale_move"] = const_322;
         param1["relative_horizontal_scale_strech"] = const_268;
         param1["relative_scale_center"] = const_835;
         param1["relative_scale_fixed"] = const_603;
         param1["relative_scale_move"] = const_920;
         param1["relative_scale_strech"] = const_1002;
         param1["relative_vertical_scale_center"] = const_180;
         param1["relative_vertical_scale_fixed"] = const_143;
         param1["relative_vertical_scale_move"] = const_344;
         param1["relative_vertical_scale_strech"] = const_278;
         param1["on_resize_align_left"] = const_692;
         param1["on_resize_align_right"] = const_420;
         param1["on_resize_align_center"] = const_476;
         param1["on_resize_align_top"] = const_597;
         param1["on_resize_align_bottom"] = const_493;
         param1["on_resize_align_middle"] = const_436;
         param1["on_accommodate_align_left"] = const_1020;
         param1["on_accommodate_align_right"] = const_435;
         param1["on_accommodate_align_center"] = const_607;
         param1["on_accommodate_align_top"] = const_1024;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_541;
         param1["route_input_events_to_parent"] = const_375;
         param1["use_parent_graphic_context"] = const_35;
         param1["draggable_with_mouse"] = const_1005;
         param1["scalable_with_mouse"] = const_889;
         param1["reflect_horizontal_resize_to_parent"] = const_387;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_267;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
