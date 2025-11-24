function scr_manage_enemy_flow() {
    var next_enemy = scr_get_next_enemy();
    
    switch (next_enemy) {
        case "enemy1":
            // Activar opener del enemy1
            break;
        case "enemy2":
            // Activar opener del enemy2
            break;
        case "enemy3":
            // Activar opener del enemy3
            break;
        case "all_defeated":
            // ¡Todos derrotados! Mostrar texto final
            var final_text = instance_create_depth(0, 0, -9998, obj_TextBox);
            final_text.text[0] = "¡Felicidades! Has derrotado a todos los enemigos.";
            final_text.battle_on_end = false;
            break;
    }
}