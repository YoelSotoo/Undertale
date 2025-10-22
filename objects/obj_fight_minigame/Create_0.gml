//-------------------------------------
// CREATE - obj_fight_minigame
//-------------------------------------

// --- Posición del minijuego ---
x = room_width / 2;
y = 350;

// --- Variables del cursor ---
cursor_speed = 4;
cursor_pos_relative = -50;
max_offset = 60;

input_delay = 3;
can_press = true;

// Texto del daño
damage_text = "";

// Animación del golpe
hit_anim_frame = -1;
hit_anim_speed = 0.25;

// Referencia al controlador
controller_id = noone;

// Para saber si ya se ejecutó el ataque
attack_done = false;
depth = -1000; // para que esté frente a todo
