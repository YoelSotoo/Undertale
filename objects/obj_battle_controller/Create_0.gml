// Evento CREATE de obj_battle_controller

// 1. Inicia el estado de la batalla y la animación
state = "PLAYER_TURN";
image_speed = 0.1;

// 2. Decide qué SPRITE de enemigo se usará en esta batalla
enemy_sprite = noone;
switch (global.current_enemy) {
    case obj_Enemy:
        enemy_sprite = spr_Enemy_fury;
        break;
    // Aquí puedes añadir más 'case' para otros enemigos
}

// 3. Crea el alma del jugador (será necesaria en el turno del enemigo)
global.soul_id = instance_create_depth(400, 300, -100, obj_soul);
global.soul_id.visible = false;