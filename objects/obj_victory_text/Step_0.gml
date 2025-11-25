// Animación de texto tipo máquina de escribir
if (text_index < string_length(message)) {
    text_timer++;
    if (text_timer >= text_speed) {
        text_timer = 0;
        current_text += string_char_at(message, text_index + 1);
        text_index++;
        
        // Sonido de texto (opcional)
        // audio_play_sound(snd_text, 1, false);
    }
} else {
    current_text = message; // Texto completo
}

// Destruir después del tiempo
life_timer--;
if (life_timer <= 0) {
	//pa q se pueda mober el player otra vez y umm ah q se vea otra ve
    instance_destroy();
	room_goto(Rm_Ruins_Tutorial);
	obj_Player.visible = true;
	obj_Player.can_move = true;
}