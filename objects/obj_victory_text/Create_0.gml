// Texto que se mostrará
// Mensaje más feliz
var messages = [
    "¡Oo me derrotaste!",
    "¡Eres increíble!",
    "¡Qué batalla más divertida!",
    "¡Me encantó pelear contigo!",
    "¡Eres mi héroe!"
];
message = messages[irandom(array_length(messages) - 1)];
text_timer = 0;
text_speed = 2; // Velocidad de aparición del texto
current_text = "";
text_index = 0;

// Posición (arriba del enemigo)
var battle = instance_find(obj_battle_controller, 0);
if (instance_exists(battle)) {
    x = battle.enemy_x;
    y = battle.enemy_y - 80;
} else {
    x = room_width / 2;
    y = 150;
}

// Tiempo de vida del texto
life_timer = 180; // 3 segundos