// movement

right_key = keyboard_check(vk_right);
up_key = keyboard_check(vk_up)
down_key = keyboard_check(vk_down);
left_key = keyboard_check(vk_left)


//
xspd = (right_key -  left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;
//colision
if place_meeting(x+xspd, y, obj_Wall){
	xspd = 0;
}
if place_meeting(x, y+ yspd,  obj_Wall){
	yspd = 0;
}

//correr
if keyboard_check(vk_shift) || keyboard_check(ord("C")){
	move_spd = run_spd;

}else{
	move_spd = walk_spd;	
}

if(can_move ){
	//animacion
	if xspd > 0 {
		sprite_index = spr_Player_L
	} else if xspd < 0{
		sprite_index = spr_Player_R 
	}

	if yspd > 0 {
		sprite_index = spr_Player_D
	} else if yspd < 0{
		sprite_index = spr_Player_U 
	}

	if (xspd !=0 or yspd !=0){
		image_speed = 1;
	} else{
		image_speed = 0;
		image_index = 0; 
	}
}
x += xspd;
y += yspd; 