// Evento CREATE de obj_battle_controller (CORREGIDO)

// ================== VARIABLES DE ESTADO Y CONTROL ==================
state = "PLAYER_TURN";
player_has_control = true;
image_speed = 0.1;

// ================== VARIABLES DEL MENÚ ==================
selected_button = 0;
button_count = 3;

// ================== CREACIÓN DE INSTANCIAS DE BATALLA ==================

// --- 1. Creamos al Enemigo ---
enemy_instance_id = noone;
switch (global.current_enemy) {
    case obj_Enemy:
        enemy_instance_id = instance_create_depth(512, 300, 0, obj_rb_dummy);
        break;
}

// --- 2. Creamos los Botones del Menú ---
instance_create_depth(32, 352, -100, obj_btn_fight);
instance_create_depth(71, 352, -100, obj_btn_actuar);
instance_create_depth(110, 352, -100, obj_btn_item);

// --- 3. Creamos el Cursor y el Alma ---
cursor_id = instance_create_depth(0, 0, -90, obj_menu_cursor);
global.soul_id = instance_create_depth(400, 300, -100, obj_soul);
global.soul_id.visible = false;

// --- 4. POSICIONAMOS EL CURSOR INMEDIATAMENTE ---
var first_button = instance_find(obj_button_parent, 0);
if (instance_exists(first_button)) {
    cursor_id.x = first_button.x;
    cursor_id.y = first_button.y;
}