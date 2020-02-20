globalvar _player_prev;
_player_prev = object_add()
object_set_sprite(_player_prev, spr_player_a)

object_event_add(_player_prev, ev_create, 0, '

	if global.playing {
		if(instance_number(obj_player) < 1) {
			instance_create(x, y, obj_player)
			instance_destroy()
		}
	} else {
		execute_file("Mods/Editor/Scripts/stop_playing.gml")
	}

')