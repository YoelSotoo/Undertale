right_key = keyboard_check(vk_right);
up_key = keyboard_check(vk_up); 
left_key = keyboard_check(vk_left);
down_key = keyboard_check(vk_down);



xspd = (right_key - left_key) * global.soul_spd;
yspd = (down_key - up_key) * global.soul_spd;


x += xspd;
y += yspd;
if global.inv_frames > 0 { 
	global. inv_frames -= 1;
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}

// Evento STEP de obj_soul

// Solo permite el movimiento libre si NO es el turno del jugador
if (instance_exists(obj_battle_controller) && obj_battle_controller.state != "PLAYER_TURN") {
    // Aquí va tu código de movimiento normal para esquivar
    // x += hsp;
    // y += vsp;
}