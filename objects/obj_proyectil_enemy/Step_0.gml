//-------------------------------------
// STEP EVENT
//-------------------------------------

// Movimiento del proyectil
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Se destruye si sale del room o pasa mucho tiempo
life_timer--;
if (life_timer <= 0 || x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Colisión manual con el alma
if (instance_exists(global.soul_id) && global.inv_frames <= 0) {
    var dist = point_distance(x, y, global.soul_id.x, global.soul_id.y);
    if (dist < 10) { // rango de impacto
        global.player_hp -= damage;
        global.inv_frames = room_speed / 2; // medio segundo de invulnerabilidad

        with (obj_battle_controller) {
            enemy_flash_timer = 5;
        }

        instance_destroy();
    }
}
