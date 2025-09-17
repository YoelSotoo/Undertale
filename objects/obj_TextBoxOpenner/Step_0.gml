if place_meeting(x,y,obj_Player) and obj_Player.can_move && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))){
	var instantiated = instance_create_depth(0,0,-9998, obj_TextBox);
	instantiated.text = text;
}