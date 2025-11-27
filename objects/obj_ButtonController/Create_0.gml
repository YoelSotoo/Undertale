// --- POSICIÓN DE LOS BOTONES ---
ButtonPositions_X[0] = 32;
ButtonPositions_X[1] = 71;
ButtonPositions_X[2] = 110;

// --- SPRITES DE LOS BOTONES ---
ButtonSprites[0] = spr__btn_fight; 
ButtonSprites[1] = spr_btn_actuar;
ButtonSprites[2] = spr_btn_item;   

button_count = 3;

// --- VARIABLES DE CONTROL ---
Dir = 0;
MonsterReferenceNum = 0; 
BelowUIReferenceNum = 0; 

// --- RECOMPENSA ---
CurrentEXP = global.player_exp; 
CurrentGOL = 0; 

// --- FIN DE BATALLA ---
WinText = noone;   
BattleWon = false; 

// --- GLOBALES ---
if (!variable_global_exists("BattleMenu")) { global.BattleMenu = 0; }
if (!variable_global_exists("UISelectionMenu")) { global.UISelectionMenu = 0; }
if (!variable_global_exists("Monsters")) { global.Monsters = 0; }
if (!variable_global_exists("Monster")) { global.Monster = [noone, noone, noone]; }

// --- SISTEMA DE ACTs ---
act_menu_visible = false;
act_options = ["Provocar", "Meditar", "Rezar"];
current_act_selection = 0;
act_description = "";

// --- VARIABLES DE MEMORIA TÁCTIL (Para evitar rebotes) ---
last_t_l = false; last_t_r = false; last_t_u = false; last_t_d = false;
last_t_z = false; last_t_x = false;