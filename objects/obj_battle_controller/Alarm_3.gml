// Cambiar a room original
if (variable_global_exists("battle_previous_room")) {
    obj_Player.can_move = true;
    obj_Player.visible = true;
	room_goto(global.battle_previous_room);
	instance_destroy();
}