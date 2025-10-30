function scr_create_bullet_pattern(_battle, _pattern, _pattern_timer) {
    if (!instance_exists(_battle)) return;
    
    switch (_pattern) {
        case "basic_5":
            // 5 BALAS EN LÍNEA con delays
            for (var i = 0; i < 5; i++) {
                var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 3;
                b.direction = point_direction(_battle.enemy_x, _battle.enemy_y, room_width/2, room_height/2);
                b.alarm[0] = i * 15; // Delay escalonado
				b.pattern = "basic_5";
            }
            break;
            
        case "circle":
            // CÍRCULO de 8 balas
            var num_bullets = 8;
            for (var i = 0; i < num_bullets; i++) {
                var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 2.5;
                b.direction = (360 / num_bullets) * i;
                b.alarm[0] = i * 5;
				b.pattern = "circle";
            }
            break;
            
        case "spiral":
            // ESPIRAL - 2 balas en direcciones opuestas
            for (var i = 0; i < 2; i++) {
                var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 2;
                b.direction = (_pattern_timer * 3) + (180 * i); // Giran en espiral
                b.pattern = "spiral";
            }
            break;
            
        case "rain":
            // LLUVIA desde arriba
            for (var i = 0; i < 4; i++) {
                var start_x = random_range(global.LeftEdge, global.RightEdge);
                var b = instance_create_layer(start_x, global.TopEdge - 20, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 2.5;
                b.direction = 90; // Hacia abajo
                b.alarm[0] = i * 20;
				b.pattern = "rain";
            }
            break;
            
        default: // "basic" original
            var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
            b.damage = _battle.enemy_bullet_damage;
            b.speed = 3;
            b.direction = point_direction(_battle.enemy_x, _battle.enemy_y, room_width/2, room_height/2);
            break;
    }
}