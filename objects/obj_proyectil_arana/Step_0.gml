// Rotación continua para efecto de telaraña
image_angle += 5;

// Verificar si sale de pantalla
if (x < -50 || x > room_width + 50 || y < -50 || y > room_height + 50) {
    instance_destroy();
}

// Colisión con el alma (soul)
if (place_meeting(x, y, global.soul_id)) {
    // Aplicar daño al player
    global.player_hp -= damage;
    
    // Efecto de hit al player
    var controller = instance_find(obj_battle_controller, 0);
    if (instance_exists(controller)) {
        controller.is_player_hit = true;
        controller.hit_timer = 0;
    }
    
    instance_destroy();
}