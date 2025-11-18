//-------------------------------------
// CREATE EVENT
//-------------------------------------


speed = 4;              // velocidad de movimiento
depth = -50;            // que se vea por encima del cuadro
image_blend = c_white;
pattern = "basic";      // ← ¡ESTA LÍNEA FALTABA!

// Calcular dirección hacia el alma
if (instance_exists(global.soul_id)) {
    var sx = global.soul_id.x;
    var sy = global.soul_id.y;
    direction = point_direction(x, y, sx, sy);
} else {
    direction = 180; // si no hay alma, va a la izquierda
}

// Tiempo de vida (3 segundos)
life_timer = room_speed * 3;

// Daño con reducción por efectos de ACTs
var battle = instance_find(obj_battle_controller, 0);
if (instance_exists(battle)) {
    var base_damage = battle.enemy_bullet_damage;
    damage = round(base_damage * battle.enemy_damage_reduction);
    
    // Marcar que el jugador recibió daño (para efecto de rezar)
    battle.prayer_damage_taken = true;
} else {
    damage = 5;
}	