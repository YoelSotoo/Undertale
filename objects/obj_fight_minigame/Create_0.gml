// Evento CREATE de obj_fight_minigame

// --- Posición del minijuego ---
// Lo centraremos en la pantalla (ajusta Y si es necesario)
x = room_width / 2;
y = 350; // Ajusta esta altura para que quede bien sobre el cuadro de batalla

// --- Variables del cursor de la barra ---
cursor_speed = 4;        // Velocidad con la que se mueve el cursor
cursor_pos_relative = -50; // Posición inicial del cursor (relativa al centro de la barra)
                           // -50 = izquierda, 0 = centro, 50 = derecha
max_offset = 60;         // Distancia máxima que el cursor se aleja del centro de la barra
                         // Asegúrate que cubra las zonas de tu spr_barra_f

input_delay = 3; 

can_press = true;        // Solo se puede presionar la tecla una vez
damage_text = ""; // 

target_enemy_id = noone; // Aquí guardaremos el ID del enemigo a atacar
hit_anim_frame = -1; // El frame actual de la animación. -1 significa "no se está reproduciendo".
hit_anim_speed = 0.25; // Más lento para que se note el golpe
