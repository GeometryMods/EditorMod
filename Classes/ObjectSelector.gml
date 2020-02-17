globalvar spr_ed_obj, obj_ed_obj;

spr_ed_obj = sprite_add("Mods/Editor/Objects/spr_ed_obj.png", 1, false, false, 31, 31)
obj_ed_obj = object_add()
object_set_parent(obj_ed_obj, undel)
object_set_sprite(obj_ed_obj, spr_ed_obj)

object_event_add(obj_ed_obj, ev_create, 0, '

	plusx = 0
	plusy = 0

	//Page0
	obj = 0
	pos = 0

')

object_event_add(obj_ed_obj, ev_step, ev_step_end, '
	x = view_xview + plusx
	y = view_yview + plusy
')

object_event_add(obj_ed_obj, ev_mouse, ev_left_release, '
	if global.selected_mode == 0 {
		global.toput = obj
	}
')

object_event_add(obj_ed_obj, ev_draw, 0, '
	if global.selected_mode == 0 {
		draw_sprite(spr_ed_obj, 0, x, y)

		obj_spr = object_get_sprite(obj)
		scale = .5
		draw_sprite_ext(obj_spr, 0, x, y, scale, scale, 0, c_white, 1)

	}
')