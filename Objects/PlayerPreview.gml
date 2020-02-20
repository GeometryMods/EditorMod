globalvar _player_prev;
_player_prev = object_add()
object_set_sprite(_player_prev, spr_player_a)

object_event_add(_player_prev, ev_create, 0, '

	sprite_set_offset(spr_player_a, 30, 30)
	sprite_set_offset(spr_player_b, 30, 30)

	if(instance_exists(obj_player)) {
		with(obj_player) {instance_destroy()}
	}

	if global.playing && instance_number(obj_player) < 1 {
		instance_create(x, y, obj_player)
		instance_destroy()
	}

')