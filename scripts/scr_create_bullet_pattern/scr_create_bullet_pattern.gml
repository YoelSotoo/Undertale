function scr_create_bullet_pattern(_battle, _pattern, _pattern_timer) {
    if (!instance_exists(_battle)) return;
    
    switch (_pattern) {
        case "basic_5":
            for (var i = 0; i < 5; i++) {
                var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 3;
                b.direction = point_direction(_battle.enemy_x, _battle.enemy_y, room_width/2, room_height/2);
                b.pattern = "basic";
                b.alarm[0] = i * 15;
            }
            break;
            
        case "circle":
            var num_bullets = 8;
            for (var i = 0; i < num_bullets; i++) {
                var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 2.5;
                b.direction = (360 / num_bullets) * i;
                b.pattern = "circle";
                b.alarm[0] = i * 5;
            }
            break;
            
        case "spiral":
            for (var i = 0; i < 2; i++) {
                var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 2;
                b.direction = (_pattern_timer * 3) + (180 * i);
                b.pattern = "spiral";
            }
            break;
            
        case "rain":
            for (var i = 0; i < 4; i++) {
                var start_x = random_range(global.LeftEdge, global.RightEdge);
                var b = instance_create_layer(start_x, global.TopEdge - 20, "Instances", obj_proyectil_enemy);
                b.damage = _battle.enemy_bullet_damage;
                b.speed = 2.5;
                b.direction = 90;
                b.pattern = "basic";
                b.alarm[0] = i * 20;
            }
            break;
            
        default: // "basic" y cualquier otro
            var b = instance_create_layer(_battle.enemy_x, _battle.enemy_y, "Instances", obj_proyectil_enemy);
            b.damage = _battle.enemy_bullet_damage;
            b.speed = 3;
            b.direction = point_direction(_battle.enemy_x, _battle.enemy_y, room_width/2, room_height/2);
            b.pattern = "basic";
            break;
    }
}