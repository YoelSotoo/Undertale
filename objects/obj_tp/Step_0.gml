if (active && place_meeting(x, y, obj_Player)) {

    global.prev_x = obj_Player.x;
    global.prev_y = obj_Player.y;

    if (block_player) obj_Player.can_move = false;

    // Crear transición
    if (!instance_exists(obj_transcision)) {
        var t = instance_create_layer(0, 0, "Trans", obj_transcision);
        t.target_room = target_rm;
        t.maintain_pos = maintain_pos;
        t.target_x = target_x;
        t.target_y = target_y;
    }

    //active = false; // evitar doble activación
}
