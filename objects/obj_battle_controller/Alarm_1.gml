//-------------------------------------
// EVENTO ALARM[1] - obj_battle_controller
//-------------------------------------

// Crear una bala enemiga simple (ataque de prueba)
var bx = 545;
var by = 256;
instance_create_layer(bx, by, "Instances", obj_enemy_bullet);

// Cambiar al estado de ataque
state = "ENEMY_ATTACKING";

// Esperar 1.5 segundos antes de devolver el turno al jugador
alarm[0] = room_speed * 1.5;
