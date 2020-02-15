globalvar core;
core = object_add()

object_event_add(core, ev_create, 0, '
downx=0
downy=0
drag_x=0
drag_y=0
timedown=0
dragging=false

global.toput=obj_wall
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

')

object_event_add(core, ev_step, 0, '
	if dragging {

		if !global.playing {
			view_xview = view_xview + drag_x - mouse_x
			view_yview = view_yview + drag_y - mouse_y
		}

	}
')

object_event_add(core, ev_mouse, ev_global_left_release, '
	//Build
	if global.toput != noone && !global.playing && mouse_x > 0 && global.selected_mode == 0
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
		dragging = false
	}
')

object_event_add(core, ev_mouse, ev_global_left_press, '
	dragging=true
	drag_x=mouse_x
	drag_y=mouse_y
')

object_event_add(core, ev_draw, 0, '
	execute_file("Mods/Editor/Scripts/scr_grid.gml", 61, 61)
')

object_event_add(core, ev_alarm, 0, '
	if room_width < global.wallx + 600 {
		room_set_width(rm_editor, global.wallx + 600)
	}
	alarm[0] = 60
')