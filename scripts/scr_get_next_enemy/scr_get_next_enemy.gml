function scr_get_next_enemy() {
    // Abrir archivo de guardado
    ini_open("savegame.ini");
    
    // Verificar progreso de todos los enemigos
    var enemy1 = ini_read_real("progress", "enemy1", 0);
    var enemy2 = ini_read_real("progress", "enemy2", 0);
    var enemy3 = ini_read_real("progress", "enemy3", 0);
    
    ini_close();
    
    show_debug_message("📊 Progreso - E1:" + string(enemy1) + " E2:" + string(enemy2) + " E3:" + string(enemy3));
    
    // Decidir qué enemigo mostrar según progreso
    if (enemy1 == 0) {
        return "enemy1"; // Primer enemigo (aún no derrotado)
    } else if (enemy2 == 0) {
        return "enemy2"; // Segundo enemigo (aún no derrotado)
    } else if (enemy3 == 0) {
        return "enemy3"; // Tercer enemigo (aún no derrotado)
    } else {
        return "all_defeated"; // ¡Todos derrotados!
    }
}