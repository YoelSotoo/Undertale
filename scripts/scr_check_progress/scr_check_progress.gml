function scr_check_progress(enemy_name) {
    // Abrir archivo de guardado
    ini_open("savegame.ini");
    
    // Leer si el enemigo ya fue derrotado (0 = no, 1 = sí)
    var defeated = ini_read_real("progress", enemy_name, 0);
    
    // Cerrar archivo
    ini_close();
    
    return defeated;
}