//-------------------------------------
// EVENTO STEP - obj_battle_controller
//-------------------------------------

switch (state) {

    //---------------------------------
    // 1️⃣ Turno del jugador
    //---------------------------------
    case "PLAYER_TURN":
        // Espera acción (por ahora sin botones)
        break;


    //---------------------------------
    // 2️⃣ Minijuego de ataque (FIGHT)
    //---------------------------------
    case "FIGHT_MINIGAME":
        // Si aún no existe el minijuego, créalo
        if (!instance_exists(obj_fight_minigame)) {
            var mini = instance_create_layer(0, 0, "Instances", obj_fight_minigame);
            mini.controller_id = id;
        }

        // 💡 Si el minijuego ya fue destruido (terminó el ataque)
        if (!instance_exists(obj_fight_minigame)) {
            state = "ENEMY_TURN";
        }
    break;


    //---------------------------------
    // 3️⃣ Turno del enemigo (inicio del ataque)
    //---------------------------------
    case "ENEMY_TURN":
        if (instance_exists(global.soul_id)) {
            global.soul_id.visible = true; // Mostrar el alma
        }

        // ⚡ Espera 1 frame antes de lanzar el ataque (permite mover el alma)
        alarm[1] = 1;
    break;


    //---------------------------------
    // 4️⃣ Mientras el enemigo ataca
    //---------------------------------
    case "ENEMY_ATTACKING":
        // No hacemos nada, solo esperamos que la alarma termine
        break;
}
