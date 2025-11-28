
if (!variable_instance_exists(id, "enemy_req")) {
    enemy_req = "enemy1"; // Por defecto
}

// --- VARIABLES DE DESAPARICIÓN ---
is_fading = false;
alpha_level = 1;

// --- VARIABLES DEL MENSAJE PROPIO ---
msg_active = false;      // ¿Dibujar el cuadro?
msg_timer = 0;           // Tiempo que dura en pantalla
msg_text = "";           // Texto a mostrar

// --- ESTILO VISUAL (Copiado de obj_TextBox) ---
box_width = 286;
box_height = 82;
border = 8;
// Fuente (Asegúrate de tener esta fuente o cámbiala por la que uses)
my_font = fnt_tutorial;