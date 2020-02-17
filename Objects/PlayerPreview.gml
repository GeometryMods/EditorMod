globalvar _player_prev;
_player_prev = object_add()
object_set_sprite(_player_prev, spr_player_a)

object_event_add(_player_prev, ev_create, 0, '
		
	if(instance_exists(obj_player)) {
		with(obj_camera) {instance_destroy()}
		with(obj_player) {instance_destroy()}
		core.visible = true
		obj_ed_obj.visible = true
	}
')

object_event_add(_player_prev, ev_step, 0, '
	if global.playing {

		core.visible = false
		obj_ed_obj.visible = false

		instance_create(x, y, obj_player)
		instance_create(0, 0, obj_camera)
		instance_destroy()
	}
')