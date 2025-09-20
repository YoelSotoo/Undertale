confirm_key = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
skip_key = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);	

textbox_x = camera_get_view_x(view_camera[0])+ 20;
textbox_y = camera_get_view_y(view_camera[0]) + 154;

//setup
if(setup == false) {
	
	setup = true;
	
	obj_Player.can_move = false;
	
	draw_set_font(fnt_tutorial);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//pages
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++;){
		
		text_length[p] = string_length(text[p]);
		
		//personaje
		text_x_offset[p] = 78;
		portrait_x_offsetp[p] = 42;
		line_width = textbox_width - border*2 - text_x_offset[p];
		//texto normal
		if speaker_sprite[0] == noone{
		
			text_x_offset[p] = 17;
			line_width = textbox_width - border*2;
		
		}
		
		
	}
	
}

//typing text
if draw_char < text_length[page]{
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0,text_length[page]);
}


if confirm_key{
	if draw_char == text_length[page]{
		if page < page_number-1{
			page++
			draw_char = 0;
		}
		else
		{
			obj_Player.can_move = true;
			instance_destroy();
		}
	}
	
}else if skip_key and draw_char != text_length[page] {
	
	draw_char = text_length[page];
	
}

//textbox
txtb_image += txtb_image_spd;
txtb_sprite_w = sprite_get_width(txtb_sprite);
txtb_sprite_h = sprite_get_height(txtb_sprite);

draw_sprite_ext(txtb_sprite,txtb_image,textbox_x ,textbox_y,textbox_width/txtb_sprite_w, textbox_height/txtb_sprite_h,0,c_white,1);


// dibuja personaje text
if speaker_sprite[0] != noone{
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] {image_index = 0};
	var _speaker_x = textbox_x + portrait_x_offsetp[page];
	
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_width + (textbox_height/2), 55/sprite_width, 55/sprite_height,0,c_white,1);
}

//back of the textbox


// draw textbox
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);








