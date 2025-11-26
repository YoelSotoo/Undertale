// parámetros
textbox_width = 286;
textbox_height = 82;
border = 8;
line_sep = 15;
line_width = textbox_width - border*2;
txtb_sprite =  spr_TextBox;
txtb_image = 0;
txtb_image_spd = 0; 
txtb_snd = snd_text; 

// text - SOLO inicializar si no viene con datos
page = 0;
if (!variable_instance_exists(id, "text") || array_length(text) == 0) {
    text = ["text"];  // fallback real
}

page_number = array_length(text);

// preparar arrays de largo correcto
for (var i = 0; i < page_number; i++) {
    text_length[i] = string_length(text[i]);
}

draw_char = 0;
old_draw_char = 0;
text_speed = 1;

setup = false;

speaker_sprite[0] = noone;

// battle
battle_on_end = false;
enemy_to_battle = noone;
