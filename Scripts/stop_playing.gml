if instance_exists(obj_player) && !global.playing {
	with(obj_player) {
		instance_destroy()
	}
	instance_create(0,0,obj_restart)
}

global.spdboost = global.levelspeed
global.gravdir = 1
global.pause = 0
global.pulse = 0
global.g2y = 0

sprite_set_offset(spr_player_a, 30, 30)
sprite_set_offset(spr_player_b, 30, 30)