globalvar _player_prev;
_player_prev = object_add()
object_set_sprite(_player_prev, spr_player_a)

object_event_add(_player_prev, ev_create, 0, '
		
	if(instance_exists(obj_player)) {
		with(obj_player) {instance_destroy()}
	}
')

object_event_add(_player_prev, ev_step, 0, '
	if global.playing {
		instance_create(x, y, obj_player)
		instance_destroy()
	}
')