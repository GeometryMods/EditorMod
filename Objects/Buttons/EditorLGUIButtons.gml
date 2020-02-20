//Editor Left Gui Buttons

globalvar edBtn_build0, edBtn_build1, edBtn_delete0, edBtn_delete1, edBtn_edit0, edBtn_edit1;
globalvar obj_buildBtn, obj_editBtn, obj_deleteBtn;

//Sprite loading
edBtn_build0 = sprite_add("Mods/Editor/Objects/Buttons/spr_build0.png", 1, false, false, 74, 25)
edBtn_build1 = sprite_add("Mods/Editor/Objects/Buttons/spr_build1.png", 1, false, false, 74, 25)

edBtn_edit0 = sprite_add("Mods/Editor/Objects/Buttons/spr_edit0.png", 1, false, false, 74, 25)
edBtn_edit1 = sprite_add("Mods/Editor/Objects/Buttons/spr_edit1.png", 1, false, false, 74, 25)

//Object creating
obj_buildBtn = object_add()
obj_editBtn = object_add()
obj_deleteBtn = object_add()

object_set_parent(obj_buildBtn, undel)
object_set_parent(obj_editBtn, undel)
object_set_parent(obj_deleteBtn, undel)

//Lastly, set the objects sprite
object_set_sprite(obj_buildBtn, edBtn_build0)
object_set_sprite(obj_editBtn, edBtn_edit0)

/*
 * Build Btn
 */

object_event_add(obj_buildBtn, ev_create, 0, '
	plusx = 0
	plusy = 0

	depth = -2
')

object_event_add(obj_buildBtn, ev_step, ev_step_end, '
	x = view_xview + plusx
	y = view_yview + plusy

	if global.selected_mode == 0 {
		sprite_index = edBtn_build1
	} else {
		sprite_index = edBtn_build0
	}
')

object_event_add(obj_buildBtn, ev_mouse, ev_left_release, '
	global.selected_mode = 0
')

/*
 * Edit btn
 */
object_event_add(obj_editBtn, ev_create, 0, '
	plusx = 0
	plusy = 0

	depth = -2
')

object_event_add(obj_editBtn, ev_step, ev_step_end, '
	x = view_xview + plusx
	y = view_yview + plusy

	if global.selected_mode == 1 {
		sprite_index = edBtn_edit1
	} else {
		sprite_index = edBtn_edit0
	}
')

object_event_add(obj_editBtn, ev_mouse, ev_left_release, '
	global.selected_mode = 1
')
