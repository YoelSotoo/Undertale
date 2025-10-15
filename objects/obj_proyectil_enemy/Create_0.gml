speed = 4;

// Apuntar hacia el alma
if (instance_exists(obj_soul)) {
    direction = point_direction(x, y, obj_soul.x, obj_soul.y);
}
