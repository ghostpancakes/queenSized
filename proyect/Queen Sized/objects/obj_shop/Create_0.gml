global.canPurchase = false;
alarm[1] = 30; //Purchasing cooldown

instance_deactivate_object(obj_stats);

if(instance_exists(obj_enemy))
{
	xx = obj_enemy.x;
	yy = obj_enemy.y;
	_depth = obj_enemy.depth;
	instance_destroy(obj_enemy);
};

instance_deactivate_object(obj_uiAttack);
instance_deactivate_object(obj_uiGuard);
instance_deactivate_object(obj_uiSkills);
instance_deactivate_object(obj_uiSpecial);
instance_deactivate_object(obj_pause);
vendor = global.stage;

if(obj_player.playerSelected = enemy.rat_king)
{
	poolsRat();
};
else
{
	pools();
};

for(i=0; i < array_length(arr_poolTable[global.stage]); i++)
{
	arr_pool[i] = arr_poolTable[global.stage, i];
};

screenshake(10, 5, .05);

//Arrow to go OUT
instance_create_depth(550, room_height/2, -10, obj_arrow)

//Create Items
var _items = choose(3, 4, 5);

//There's allways two instant bubbles
instance_create_depth(160, 100,depth-1, obj_shopBubble);
instance_create_depth(60, 140,depth-1, obj_shopSkill);

//The rest of drops are random
_arr[0, 0] = 160;	_arr[1, 0] = 60;	_arr[2, 0] = 260;
_arr[0, 1] = 200;	_arr[1, 1] = 240;	_arr[2, 1] = 140;

//If playing as tito/bondiola, add a switch button
if(global.player = enemy.tito) or (global.player = enemy.bondiola)
{
	instance_create_depth(ROOMWIDTH-50, room_height-20,depth-1, obj_shopSwitch);
};

for(i = 0; i < _items-2; i++)
{
	var _type = choose(obj_shopBubble, obj_shopSkill);
	instance_create_depth(_arr[i, 0], _arr[i, 1], depth-1, _type);
};
//if playing as pillow and the reroll skill is unlocked, spawn that

var _rerollUnlocked;
ini_open("unlocks.ini");
	_rerollUnlocked = ini_read_real("unlocks", "2", false);
ini_close();

if(global.player = enemy.pillow) and (_rerollUnlocked)
{
	instance_create_depth(ROOMWIDTH-50, room_height-20,depth-1, obj_shopReroll);
};

canChangeText = 0;
with(obj_player)
{
	if(global.player = enemy.tito) or (global.player = enemy.bondiola)
	{
		if(obj_player.playerSelected = enemy.tito)
		{
			ini_open("tempBONDIOLA.ini")
		}
		else
		{
			ini_open("tempTITO.ini")
		};
			var _hp = ini_read_real("stats", "hp", maxHp)
			ini_write_real("stats", "hp", _hp+maxHp/4);
			
			ini_close();
	};
	
	hp += maxHp/4;
	hp = clamp(hp, 0, maxHp);
};
arr_shopText[0] ="WELCOME TO THE SHOP"; //CITY
arr_shopText[1] ="WOOF WOOF!! SHOP!!"; //TUNNEL
arr_shopText[2] ="WELCOME TO THE LEMONADE STAND"; //LEMON
arr_shopText[3] ="AAA... WELCOME TO THE SHOP..."; //SHORTCUT
arr_shopText[4] ="WELCOME TO THE FLAMING SHOP"; //INCINERATOR
arr_shopText[5] ="WAWAAA, BUYYY!!"; //SEWER
arr_shopText[6] ="COME ON... BUY SOMETHING..."; //CIRCUS
arr_shopText[7] ="BUY MY JUNK, FELLOW STRANGER"; //SHAFT
arr_shopText[8] ="WELCOME TO THE ASHTRAY"; //ASHTRAY
arr_shopText[9] ="BUY E - MARKET NOW!!"; //CLOUD
arr_shopText[10] ="B   Y ERKET   NOW !!! 102601"; //BREACH
arr_shopText[11] ="QUE BUSCAS PIBE?"; //STRIP
arr_shopText[12] ="WANT SOME SECRET BOOKS?"; // COUNCIL
arr_shopText[13] ="BRRR.... BUY SOMETHING COLD!"; //FRIDGE

global.text = arr_shopText[global.stage];
global.textPrev = global.text;