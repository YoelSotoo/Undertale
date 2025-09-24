// Código de Creación de Instancia para el maniquí

text[0] = "Holaaaaa";
text[1] = "te odio";
speaker_sprite[0] = spr_IDEL;
speaker_sprite[1] = spr_fury;
txtb_snd = snd_maniqui;

// --- ACTIVAMOS LA BATALLA ---
battle_on_end = true;          // ¡Sí, queremos una batalla al final!
enemy_to_battle = obj_Enemy;   // Y queremos que sea contra el objeto del maniquí.