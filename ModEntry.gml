execute_string(get_external("Mods/Editor/ModInit.gml"))

execute_string(get_external("Mods/Editor/Classes/Undel.gml"))
execute_string(get_external("Mods/Editor/Classes/EditorRoom.gml"))

execute_string(get_external("Mods/Editor/Classes/ObjectSelector.gml"))

execute_string(get_external("Mods/Editor/Objects/PlayerPreview.gml"))

execute_string(get_external("Mods/Editor/Objects/Buttons/EditorLGUIButtons.gml"))


execute_string(get_external("Mods/Editor/Objects/Core.gml"))


//DONT MIND THIS; IS JUST FOR TESTING
room_instance_add(rm_editor, 0, 0, obj_ground1)
room_instance_add(rm_editor, 0, 0, obj_ground2)
room_instance_add(rm_editor, 0, 0, core)