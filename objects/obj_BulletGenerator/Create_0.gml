// Temporizador del ataque
attack_duration = 180;
attack_timer = attack_duration;

// Obtener patrón ALEATORIO con PESOS
current_pattern = scr_get_weighted_pattern();

// Debug: mostrar patrón elegido (opcional)
show_debug_message("Patrón enemigo: " + current_pattern);

bullets_created = false;
bullet_count = 0;
max_bullets = 5;
pattern_timer = 0;
wave_count = 0;