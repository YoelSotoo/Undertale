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