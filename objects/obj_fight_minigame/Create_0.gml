// --- Posición del minijuego ---
x = room_width / 2;
y = 350; // Ajusta si quieres moverlo

// --- Variables del cursor ---
cursor_speed = 4;
cursor_pos_relative = -50;
max_offset = 60;

input_delay = 3;
can_press = true;
damage_text = "";

hit_anim_frame = -1;
hit_anim_speed = 0.25;

// --- Control del flujo de turnos ---
enemy_turn = false;

depth = -50; // se dibuja delante del enemigo y la UI
