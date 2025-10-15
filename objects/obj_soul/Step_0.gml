//-------------------------------------
// EVENTO STEP - obj_soul
//-------------------------------------

var battle = instance_find(obj_battle_controller, 0);

if (instance_exists(battle)) {
    var st = battle.state;

    // Permitir movimiento solo si es turno enemigo o mientras ataca
    if (st == "ENEMY_TURN" || st == "ENEMY_ATTACKING") {
        var right_key = keyboard_check(vk_right);
        var up_key = keyboard_check(vk_up);
        var left_key = keyboard_check(vk_left);
        var down_key = keyboard_check(vk_down);

        var xspd = (right_key - left_key) * global.soul_spd;
        var yspd = (down_key - up_key) * global.soul_spd;

        x += xspd;
        y += yspd;
    }
}

// Reducir parpadeo si está activo
if (flash_timer > 0) flash_timer--;
