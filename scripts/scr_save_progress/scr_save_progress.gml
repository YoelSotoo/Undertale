function scr_save_progress(enemy_name) {
    // Abrir archivo de guardado
    ini_open("savegame.ini");
    
    // Marcar este enemigo como derrotado
    ini_write_real("progress", enemy_name, 1);
    
    // Cerrar archivo
    ini_close();
}