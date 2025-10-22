var battle = instance_find(obj_battle_controller, 0);
if (instance_exists(battle)) {
    var st = battle.state;
    if (st == "ENEMY_TURN" || st == "ENEMY_ATTACKING") {
        var xspd = (keyboard_check(vk_right) - keyboard_check(vk_left)) * global.soul_spd;
        var yspd = (keyboard_check(vk_down)  - keyboard_check(vk_up))  * global.soul_spd;
        x += xspd; y += yspd;
    }
}

// parpadeo breve cuando recibe daño
if (flash_timer > 0) flash_timer--;

// Encerrar dentro del cuadro
if (variable_global_exists("LeftEdge")) {
    x = clamp(x, global.LeftEdge,  global.RightEdge);
    y = clamp(y, global.TopEdge,   global.BottomEdge);
}
