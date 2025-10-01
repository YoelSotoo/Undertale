// Evento CREATE de obj_ButtonController

// --- POSICIÓN DE LOS BOTONES ---
// Coordenadas X para cada uno de los 4 botones del menú
ButtonPositions_X[0] = 32;
ButtonPositions_X[1] = 71;
ButtonPositions_X[2] = 110;


// --- SPRITES DE LOS BOTONES ---
// ¡IMPORTANTE! Reemplaza los nombres de la derecha con los nombres de TUS sprites.
// Cada sprite debe tener 2 frames: (0 = normal, 1 = seleccionado)
ButtonSprites[0] = spr__btn_fight;  // Reemplaza por tu sprite de LUCHA
ButtonSprites[1] = spr_btn_actuar; // Reemplaza por tu sprite de ACTUAR
ButtonSprites[2] = spr_btn_item;   // Reemplaza por tu sprite de OBJETO


button_count = 3;
// --- VARIABLES DE CONTROL DEL MENÚ ---
Dir = 0; // Variable de dirección para la navegación
MonsterReferenceNum = 0; // Guarda el enemigo seleccionado
BelowUIReferenceNum = 0; // Guarda la opción del menú principal seleccionada

// --- VARIABLES DE RECOMPENSA DE BATALLA ---
// Guarda el EXP y Oro iniciales para calcular la ganancia al final
CurrentEXP = global.player_exp; // Usa tu variable global de EXP
CurrentGOL = 0; // Reemplaza con tu variable global de Oro	 si la tienes

// --- VARIABLES DE FIN DE BATALLA ---
WinText = noone;   // Para guardar el objeto de texto de victoria
BattleWon = false; // Para saber si la batalla ya se ganó

// --- INICIALIZACIÓN DE VARIABLES GLOBALES ---
// Este código las necesita para funcionar. Ponlas en tu obj_Params si no existen.
if (!variable_global_exists("BattleMenu")) { global.BattleMenu = 0; }
if (!variable_global_exists("UISelectionMenu")) { global.UISelectionMenu = 0; }
if (!variable_global_exists("Monsters")) { global.Monsters = 0; }
if (!variable_global_exists("Monster")) { global.Monster = [noone, noone, noone]; }