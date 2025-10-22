if (global.inv_frames <= 0) {
    global.player_hp -= damage;
    global.inv_frames = 30;
    instance_destroy(); // se destruye al golpear
}
