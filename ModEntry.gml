execute_string(get_external("Mods/Editor/Classes/EditorRoom.gml"))
execute_string(get_external("Mods/Editor/Objects/PreviewPlayer.gml"))
execute_string(get_external("Mods/Editor/Objects/Core.gml"))


//DONT MIND THIS; IS JUST FOR TESTING
room_instance_add(rm_editor, 0, 0, obj_ground1)
room_instance_add(rm_editor, 31, 541, _obj_prev_Player)
room_instance_add(rm_editor, 0, 0, core)