if (keyboard_check_pressed(ord("R")) && keyboard_check(vk_control)) {
    scr_reset_save();
}

// =================== 1. CAPTURAR INPUTS ===================
var right_key = keyboard_check(vk_right);
var left_key = keyboard_check(vk_left);
var up_key = keyboard_check(vk_up);
var down_key = keyboard_check(vk_down);
var run_key = keyboard_check(vk_shift); 
var interact_key = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
var menu_key = keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control);

// --- CONTROLES TÁCTILES ---
var touch = instance_find(obj_touch_controls, 0);

// Variables de memoria para el jugador
if (!variable_instance_exists(id, "pl_last_z")) pl_last_z = false;
if (!variable_instance_exists(id, "pl_last_c")) pl_last_c = false;

if (instance_exists(touch)) {
    // Movimiento
    right_key = right_key || touch.right_pressed;
    left_key  = left_key  || touch.left_pressed;
    up_key    = up_key    || touch.up_pressed;
    down_key  = down_key  || touch.down_pressed;
    
    // Correr (X mantenido)
    run_key = run_key || touch.x_pressed;
    
    // Interactuar (Z presionado una vez)
    if (touch.z_pressed && !pl_last_z) interact_key = true;
    
    // Inventario (C presionado una vez)
    if (touch.c_pressed && !pl_last_c) menu_key = true;
    
    // Actualizar estados
    pl_last_z = touch.z_pressed;
    pl_last_c = touch.c_pressed;
}

// =================== LOGICA JUEGO ===================

// INVENTARIO
if (menu_key && !global.dialogue_active) {
    global.inventory_open = !global.inventory_open;
}

if (global.inventory_open) {
    can_move = false;
    exit; 
} else {
    can_move = true;
}

// MOVIMIENTO
if (!can_move || global.dialogue_active) {
    xspd = 0; yspd = 0;
} else {
    if (run_key) move_spd = run_spd;
    else move_spd = walk_spd;

    var move_x = right_key - left_key;
    var move_y = down_key - up_key;

    if (move_x != 0 || move_y != 0) {
        var dir = point_direction(0, 0, move_x, move_y);
        xspd = lengthdir_x(move_spd, dir);
        yspd = lengthdir_y(move_spd, dir);
        if (move_x != 0) image_xscale = sign(move_x);
    } else {
        xspd = 0; yspd = 0;
    }
    
    // INTERACCIÓN
    if (interact_key) {
        var check_x = x + lengthdir_x(20, direction);
        var npc = instance_place(x + xspd * 2, y + yspd * 2, obj_TextBoxOpenner);
        // Aquí iría tu script de activar texto
    }
}

// COLISIONES
if (place_meeting(x + xspd, y, obj_Wall)) {
    while (!place_meeting(x + sign(xspd), y, obj_Wall)) x += sign(xspd);
    xspd = 0;
}
if (place_meeting(x, y + yspd, obj_Wall)) {
    while (!place_meeting(x, y + sign(yspd), obj_Wall)) y += sign(yspd);
    yspd = 0;
}

// APLICAR
x += xspd;
y += yspd;

// ANIMACIÓN
image_xscale = 1;
if (xspd != 0 || yspd != 0) {
    image_speed = 1;
    if (yspd < 0) sprite_index = spr_Player_U;
    else if (yspd > 0) sprite_index = spr_Player_D;
    else if (xspd < 0) sprite_index = spr_Player_R;
    else if (xspd > 0) sprite_index = spr_Player_L;
} else {
    image_speed = 0;
    image_index = 0;
}

if (room = rm_labFinal){
global.roomcarro = rm46enemy3;
}
else if(room = rm33){
global.roomcarro = rm41;
}