// Crear proyectil desde la posición real del enemigo
var b = instance_create_layer(enemy_x, enemy_y, "Instances", obj_proyectil_enemy);
b.damage  = enemy_bullet_damage; // pasamos daño
b.pattern = enemy_pattern;       // por si quieres variar comportamiento

state = "ENEMY_ATTACKING";
alarm[0] = room_speed * 1.5; // duración del ataque
