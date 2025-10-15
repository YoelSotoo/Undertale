// Movimiento
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Colisión con el alma
if (instance_exists(obj_soul) && place_meeting(x, y, obj_soul)) {

    if (global.inv_frames <= 0) {
        global.player_hp -= 3;
        if (global.player_hp < 0) global.player_hp = 0;

        global.inv_frames = 40;
        with (obj_soul) {
            flash_timer = 10;
        }
    }

    instance_destroy();
}

// Si sale del room, destruir
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
