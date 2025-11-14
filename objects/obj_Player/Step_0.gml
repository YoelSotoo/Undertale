// =================== 1. CAPTURAR INPUTS ===================
var right_key = keyboard_check(vk_right);
var left_key = keyboard_check(vk_left);
var up_key = keyboard_check(vk_up);
var down_key = keyboard_check(vk_down);

// Solo se puede mover si can_move es true
if (!can_move) {
    xspd = 0;
    yspd = 0;
} else {
    // =================== 2. DETERMINAR VELOCIDAD (CORRER/CAMINAR) ===================
    if (keyboard_check(vk_shift) || keyboard_check(ord("C"))) {
        move_spd = run_spd;
    } else {
        move_spd = walk_spd;
    }

    // =================== 3. CALCULAR VECTOR DE MOVIMIENTO ===================
    var move_x = right_key - left_key; // -1 para izquierda, 1 para derecha, 0 si no se mueve
    var move_y = down_key - up_key;   // -1 para arriba, 1 para abajo, 0 si no se mueve

    // --- Normalización para evitar velocidad extra en diagonal ---
    if (move_x != 0 || move_y != 0) {
        var dir = point_direction(0, 0, move_x, move_y);
        xspd = lengthdir_x(move_spd, dir);
        yspd = lengthdir_y(move_spd, dir);
    } else {
        xspd = 0;
        yspd = 0;
    }
}

// =================== 4. COLISIONES ===================
if (place_meeting(x + xspd, y, obj_Wall)) {
    xspd = 0;
}
if (place_meeting(x, y + yspd, obj_Wall)) {
    yspd = 0;
}

// =================== 5. APLICAR MOVIMIENTO ===================
x += xspd;
y += yspd;

// =================== 6. ANIMACIÓN ===================

// Nos aseguramos de que la escala del sprite no esté invertida
image_xscale = 1;

// Si el jugador se está moviendo
if (xspd != 0 || yspd != 0) {
    image_speed = 1;

    // --- Lógica de prioridad para asignar el sprite correcto ---
    // Le damos prioridad a los sprites verticales (arriba/abajo).
    // Esto evita que al moverse en diagonal se vea el sprite de lado.
    if (yspd < 0) {
        sprite_index = spr_Player_U;
    } 
    else if (yspd > 0) {
        sprite_index = spr_Player_D;
    }
    // Si NO hay movimiento vertical, entonces usamos los sprites horizontales.
    else if (xspd < 0) {
        sprite_index = spr_Player_R;
    } 
    else if (xspd > 0) {
        sprite_index = spr_Player_L;
    }
}
// Si el jugador está quieto
else {
    image_speed = 0; // Detenemos la animación
    image_index = 0; // La reiniciamos al primer frame
}

if (global.inventory_open) {
    can_move = false;
    exit;
}
can_move = true;