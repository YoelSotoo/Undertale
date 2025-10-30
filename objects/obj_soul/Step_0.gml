// Controlar parpadeo por daño
if (flash_timer > 0) flash_timer--;

// MOVIMIENTO - Usar global.turn_state
if (global.turn_state == "ENEMY_TURN" || global.turn_state == "ENEMY_ATTACKING") {
    var xspd = (keyboard_check(vk_right) - keyboard_check(vk_left)) * global.soul_spd;
    var yspd = (keyboard_check(vk_down) - keyboard_check(vk_up)) * global.soul_spd;
    
    x += xspd;
    y += yspd;
    
    // Encerrar dentro del cuadro de batalla
    x = clamp(x, global.LeftEdge, global.RightEdge);
    y = clamp(y, global.TopEdge, global.BottomEdge);
}

// Invulnerabilidad después de recibir daño
if (global.inv_frames > 0) {
    global.inv_frames--;
}