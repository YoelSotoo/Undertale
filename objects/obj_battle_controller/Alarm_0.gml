// Crear primer proyectil
var b = instance_create_layer(enemy_x, enemy_y, "Instances", obj_proyectil_enemy);
b.damage = enemy_bullet_damage;
b.pattern = enemy_pattern;

// Cambiar a estado de ataque
global.turn_state = "ENEMY_ATTACKING";

// Programar fin del turno enemigo
alarm[1] = enemy_attack_duration;