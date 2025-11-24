function scr_reset_save() {
    ini_open("savegame.ini");
    ini_write_real("progress", "enemy1", 0);
    ini_write_real("progress", "enemy2", 0);
    ini_write_real("progress", "enemy3", 0);
    ini_close();
    show_debug_message("🔄 Save file reseteado");
}