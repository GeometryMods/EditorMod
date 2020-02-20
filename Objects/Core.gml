globalvar core;
core = object_add()

object_set_parent(core, undel)
object_event_add(core, ev_create, 0, '

depth = -1
instance_create(0, 0, obj_camera)

room_speed = 60

downx=0
downy=0
drag_x=0
drag_y=0
timedown=0
dragging=false

global.toput=noone
global.selected_obj=noone
global.selected_mode=0 //0 - build, 1 - edit, 2 - delete
global.playing = false

global.ground=0
global.background=0

global.intab =0
global.levelspeed=1

global.wallx = 0
room_set_width(rm_editor, 5000)

alarm[0] = 60

/*
 * TODO: Move all of this to a different object (or script)
 */

plusxx = 200
plusyy = 670

buildBtn = instance_create(74, 627, obj_buildBtn)
buildBtn.plusx = 74
buildBtn.plusy = 650

editBtn = instance_create(74, 627, obj_editBtn)
editBtn.plusx = 74
editBtn.plusy = sprite_get_height(edBtn_edit0) + 650

for(i = 0; i < global.objects; i+=1) {
	obj = instance_create(0,0,obj_ed_obj)
	obj.plusx = plusxx
	obj.plusy = plusyy
	obj.obj = global.object[i]
	obj.depth = -2
	plusxx += ((31 * 2) + 10)

	if i > 11 && i < 13 {
		plusyy += 62
		plusxx = 200
	}
}

')

object_event_add(core, ev_step, 0, '

	if dragging {
		if !global.playing {
			view_xview = view_xview + drag_x - mouse_x
			view_yview = view_yview + drag_y - mouse_y
		}
	}

	if keyboard_check_released(vk_enter) {
		global.playing = !global.playing

		instance_create(31, global.g1y - 31, _player_prev)
	}

	if global.playing {
		if undel.visible {
			undel.visible = false
		}
	} else {
		if !undel.visible {
			undel.visible = true
			with(_player_prev) {
				instance_destroy()
			}
		}
	}

')

object_event_add(core, ev_mouse, ev_global_left_release, '
	//Build
	if global.toput != noone && !global.playing && mouse_x > 0 && global.selected_mode == 0
	&& timedown < 0.3 && global.toput != object0 && !position_meeting(mouse_x, mouse_y, undel)
	{
		boj = instance_create(mouse_x, mouse_y, global.toput)
		with(boj) {
			move_snap(30.5, 30.5)
		}
		if boj.x > global.wallx {
			global.wallx = boj.x
		}
	}

	if dragging {
		timedown = 0
		dragging = false
	}
')

object_event_add(core, ev_mouse, ev_global_left_button, '
	timedown+=0.05
')

object_event_add(core, ev_mouse, ev_global_left_press, '
	down_x = mouse_x
	down_y = mouse_y
	dragging=true
	drag_x=mouse_x
	drag_y=mouse_y
')

object_event_add(core, ev_draw, 0, '
	execute_file("Mods/Editor/Scripts/scr_grid.gml", 61, 61)
	draw_sprite_ext(spr_editBg, 0, view_xview, (view_yview+(sprite_get_height(spr_editBg)+100)), 1, 0.5, 0, c_white, 1)
')

object_event_add(core, ev_alarm, 0, '
	if room_width < global.wallx + 600 {
		room_set_width(rm_editor, global.wallx + 600)
	}
	alarm[0] = 60
')