// Evento CREATE de obj_battle_controller

// ================== VARIABLES DE ESTADO Y CONTROL ==================
state = "PLAYER_TURN";         // El estado inicial de la batalla es el turno del jugador.
player_has_control = true;     // El jugador tiene el control al empezar.
image_speed = 0.1;             // Velocidad de animación para los sprites que dibuje este objeto.

// ================== VARIABLES DEL MENÚ ==================
selected_button = 0;           // Empezamos seleccionando el primer botón (FIGHT).
button_count = 3;              // El número total de botones del menú.

// Lista de coordenadas para cada botón (Método Directo)
button_pos_x = [32, 71, 110];
button_pos_y = [352, 352, 352];

// ================== CREACIÓN DE INSTANCIAS DE BATALLA ==================

// --- 1. Creamos al Enemigo ---
enemy_instance_id = noone;
switch (global.current_enemy) {
    case obj_Enemy: // Reemplaza obj_Enemy por el nombre de tu objeto enemigo (ej. obj_dummy)
        // Creamos la instancia VISUAL del enemigo.
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
// Leemos la posición del primer botón de nuestra lista.
cursor_id.x = button_pos_x[0];
cursor_id.y = button_pos_y[0];