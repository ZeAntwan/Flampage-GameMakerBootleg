/// @description Fetch all sprites

// Player
sprite_array[1] = spr_player_idle;
sprite_array[2] = spr_player_death;
sprite_array[3] = spr_player_run_r;
sprite_array[4] = spr_player_run_r_arm;
sprite_array[5] = spr_player_aim_r;
sprite_array[6] = spr_player_dash_r;
sprite_array[7] = spr_player_run_r_arm;

// Flan
sprite_array[8] = spr_flan_1_idle;
sprite_array[9] = spr_flan_2_idle;
sprite_array[10] = spr_flan_3_idle;
sprite_array[11] = spr_flan_1_heal;
sprite_array[12] = spr_flan_2_heal;
sprite_array[13] = spr_flan_3_heal;
sprite_array[14] = spr_flan_1_dmg;
sprite_array[15] = spr_flan_2_dmg;
sprite_array[16] = spr_flan_3_dmg;

// Enemies
sprite_array[17] = spr_commis_r;
sprite_array[18] = spr_commis_atk_r;

sprite_array[19] = spr_gordon_r;
// Gordon ATK

sprite_array[20] = spr_gourmand_r;
sprite_array[21] = spr_gourmand_atk_r;

sprite_array[22] = spr_plongeur_r;
sprite_array[23] = spr_plongeur_atk_r;

// Bullets 
sprite_array[24] = spr_bullet;
sprite_array[25] = spr_chou;
sprite_array[26] = spr_chou_mini;
sprite_array[27] = spr_sniper_bullet;
sprite_array[28] = spr_flan_bullet;

sprite_prefetch_multi(sprite_array);

alarm[1] = 2;

