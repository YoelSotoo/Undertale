// === REINICIO DE VARIABLES ===
text[0] = "text";  // Forzar reinicio
speaker_sprite[0] = noone;
txtb_snd = snd_text;

battle_on_end = false;
enemy_to_battle = noone;

// Sistema de guardado
enemy_id = "enemy1"; // Valor por defecto
check_progress = false;

show_debug_message("TextBoxOpener reiniciado - Enemy: " + string(enemy_id));

