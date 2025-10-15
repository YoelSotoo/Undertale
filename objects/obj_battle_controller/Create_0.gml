//-------------------------------------
// EVENTO CREATE - obj_battle_controller
//-------------------------------------

// 1. Inicia el estado de la batalla y la animación
state = "PLAYER_TURN";
image_speed = 0.1;

// 2. Decide qué SPRITE de enemigo se usará en esta batalla
enemy_sprite = noone;
switch (global.current_enemy) {
    case obj_Enemy:
        enemy_sprite = spr_Enemy_fury;
        break;
    // Aquí puedes añadir más 'case' para otros enemigos
}

// --- 3. Crea el alma del jugador centrada en el cuadro de batalla ---
var soul_center_x = room_width / 2;
var soul_center_y = room_height / 2;

global.soul_id = instance_create_depth(soul_center_x, soul_center_y, -1000, obj_soul);
global.soul_id.visible = false; // ❗ Solo se mostrará durante el turno enemigo

// --- Variables globales del jugador ---
global.player_hp = 20;
global.player_max_hp = 20;
global.soul_spd = 4;
global.inv_frames = 0;

// --- Efectos visuales del enemigo ---
enemy_shake_timer = 0;
enemy_shake_intensity = 10;
enemy_flash_timer = 0;

// --- Confirmación ---
if (instance_exists(global.soul_id)) {
    show_debug_message("✅ El alma se creó correctamente en el centro (" 
        + string(soul_center_x) + ", " + string(soul_center_y) + ")");
} else {
    show_debug_message("❌ No se pudo crear el alma");
}
