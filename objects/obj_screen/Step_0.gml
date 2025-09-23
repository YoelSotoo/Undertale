if keyboard_check_pressed(vk_alt){
	room_goto(rm_Battle);
	obj_Player.visible = false;
	obj_Player.x = 0;
	obj_Player.y = 0;
	obj_Player.can_move = false;
}


if keyboard_check_pressed(vk_f4){
	if window_get_fullscreen(){
		window_set_fullscreen(false);
	}else {
		window_set_fullscreen(true);
	}
}