// 1. LÓGICA DE DESAPARICIÓN (Si ya se abrió)
if (is_fading) {
    alpha_level -= 0.05; 
    if (alpha_level <= 0) instance_destroy();
    return;
}

// 2. DETECTAR COLISIÓN
if (place_meeting(x, y, obj_Player)) {
    
    var derrotado = scr_check_progress(enemy_req);
    
    // A) PUERTA CERRADA (No has ganado)
    if (derrotado == 0) {
        
        // --- 1. ACTIVAR EL MENSAJE PROPIO ---
        msg_active = true;
        msg_timer = 120; // 2 segundos visible
        
        // Definir texto según la puerta
        if (enemy_req == "enemy1") msg_text = "Cerrado.\nVence al Jefe primero.";
        else if (enemy_req == "enemy2") msg_text = "Bloqueado.\nVence al Jefe primero.";
        else msg_text = "Vence al Jefe primero.";

        // --- 2. EMPUJAR AL JUGADOR (REBOTE) ---
        var push_dir = point_direction(x, y, obj_Player.x, obj_Player.y);
        with (obj_Player) {
            x += lengthdir_x(4, push_dir); 
            y += lengthdir_y(4, push_dir);
        }
    }
    
    // B) PUERTA ABIERTA (Ya ganaste)
    else {
        if (!is_fading) is_fading = true; 
    }
}

// 3. TEMPORIZADOR DEL MENSAJE
if (msg_timer > 0) {
    msg_timer--;
    if (msg_timer <= 0) msg_active = false;
}