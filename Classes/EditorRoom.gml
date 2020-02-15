globalvar rm_editor;
rm_editor = room_add()

room_set_width(rm_editor, 1280)
room_set_height(rm_editor, 773)
room_set_caption(rm_editor, "GeometryMod Editor")

room_set_view_enabled(rm_editor, true)
room_set_view(rm_editor,0,true,0,0,1280,773,0,0,1280,720,0,0,0,0,0)

room_goto(rm_editor)