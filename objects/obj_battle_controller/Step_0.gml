switch (state) {
    case "PLAYER_TURN": break;

    case "FIGHT_MINIGAME":
        if (!instance_exists(obj_fight_minigame)) {
            var mini = instance_create_layer(0, 0, "Instances", obj_fight_minigame);
            mini.controller_id = id; // MUY IMPORTANTE para que el minijuego lea enemy_x/y
        }
        if (!instance_exists(obj_fight_minigame)) {
            state = "ENEMY_TURN";
        }
    break;

    case "ENEMY_TURN":
        if (instance_exists(global.soul_id)) global.soul_id.visible = true;
        alarm[1] = 1; // damos 1 frame para que el alma "vea" ENEMY_TURN
    break;

    case "ENEMY_ATTACKING":
        // esperar alarm[0]
    break;
}
