if state == "fade_out" {
    alpha += fade_speed;
    if alpha >= 1 {
        alpha = 1;

        // Cambiar de room
        room_goto(target_room);

        // Mover al player según maintain_pos
        if maintain_pos {
            obj_Player.x = global.prev_x;
            obj_Player.y = global.prev_y + 10;
        } else {
            obj_Player.x = target_x;
            obj_Player.y = target_y;
        }

        state = "fade_in";
    }
} else if state == "fade_in" {
    alpha -= fade_speed;
    if alpha <= 0 {
        alpha = 0;
        instance_destroy(); // destruir transición cuando termine
        obj_Player.can_move = true; // desbloquear player
    }
}
