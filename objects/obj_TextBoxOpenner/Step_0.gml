// Evento STEP de obj_TextOpener

if place_meeting(x,y,obj_Player) and obj_Player.can_move && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))){
	var instantiated = instance_create_depth(0,0,-9998, obj_TextBox);
	instantiated.text = text;
	instantiated.speaker_sprite = speaker_sprite;
	instantiated.txtb_snd = txtb_snd;
    
    // --- LÍNEAS NUEVAS ---
    // Pasa la nueva información al cuadro de texto
	instantiated.battle_on_end = battle_on_end;
	instantiated.enemy_to_battle = enemy_to_battle;
}