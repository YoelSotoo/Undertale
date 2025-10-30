// Movimiento básico
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Comportamientos especiales por patrón
switch (pattern) {
    case "spiral":
        // Las balas espiral siguen girando
        direction += 2;
        break;
        
    case "homing":
        // Perseguir al alma (suave)
        if (instance_exists(global.soul_id)) {
            var target_dir = point_direction(x, y, global.soul_id.x, global.soul_id.y);
            direction = lerp(direction, target_dir, 0.05);
        }
        break;
}

// Destruir si sale de la room
if (x < -100 || x > room_width + 100 || y < -100 || y > room_height + 100) {
    instance_destroy();
}