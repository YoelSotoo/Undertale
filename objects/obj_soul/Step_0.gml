// Controlar parpadeo por daño
if (flash_timer > 0) flash_timer--;

// MOVIMIENTO - Usar global.turn_state
if (global.turn_state == "ENEMY_TURN" || global.turn_state == "ENEMY_ATTACKING") {
    
    // 1. CAPTURAR INPUTS (Teclado)
    var k_right = keyboard_check(vk_right);
    var k_left = keyboard_check(vk_left);
    var k_down = keyboard_check(vk_down);
    var k_up = keyboard_check(vk_up);
    
    // 2. INTEGRAR INPUTS TÁCTILES
    var touch = instance_find(obj_touch_controls, 0);
    if (instance_exists(touch)) {
        k_right = k_right || touch.right_pressed;
        k_left = k_left || touch.left_pressed;
        k_down = k_down || touch.down_pressed;
        k_up = k_up || touch.up_pressed;
    }
    
    // 3. CALCULAR MOVIMIENTO (Evitamos sumar velocidad doble)
    var move_x = k_right - k_left; // 1, -1 o 0
    var move_y = k_down - k_up;    // 1, -1 o 0
    
    var xspd = move_x * global.soul_spd;
    var yspd = move_y * global.soul_spd;
    
    // 4. APLICAR
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