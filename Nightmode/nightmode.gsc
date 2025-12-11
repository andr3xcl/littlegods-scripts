#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_perks;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\gametypes_zm\spawnlogic;
#include maps\mp\gametypes_zm\_hostmigration;


replace_string(str, find, replace)
{
    result = "";
    for (i = 0; i < str.size; i++)
    {
        char = str[i];
        if (char == find)
            result += replace;
        else
            result += char;
    }
    return result;
}

init_lang_texts()
{
    
    level.lang_texts[1] = [];
    level.lang_texts[1]["FOG_ACTIVATED"] = "Fog activated";
    level.lang_texts[1]["FOG_DISABLED"] = "Fog disabled";
    level.lang_texts[1]["EXECUTE_NIGHT_ON"] = "Execute the command #night on";
    level.lang_texts[1]["DARKNESS_ADJUSTED"] = "The darkness has been adjusted ";
    level.lang_texts[1]["VALID_CONFIG_RANGE"] = "The valid configuration is from 4.5 to 10";
    level.lang_texts[1]["FILTER_ACTIVATED"] = "Filter activated: ";
    level.lang_texts[1]["AVAILABLE_FILTERS"] = "Available filters from 0 to 36";
    level.lang_texts[1]["DYNAMIC_MODE"] = "Dynamic Night Mode activated";
    level.lang_texts[1]["NIGHT_MODE_ACTIVATED"] = "Night mode activated";
    level.lang_texts[1]["LANG_SET_ENGLISH"] = "Language set to: English";
    level.lang_texts[1]["LANG_SET_SPANISH"] = "Language set to: Spanish";
    level.lang_texts[1]["LANG_SET_PORTUGUESE"] = "Language set to: Portuguese";
    level.lang_texts[1]["AVAILABLE_LANGUAGES"] = "Available languages: 1 - English, 2 - Spanish, 3 - Portuguese";
    level.lang_texts[1]["WAIT_COMMANDS"] = "Wait for the commands to finish displaying";
    level.lang_texts[1]["INVALID_MODE"] = "Invalid night mode: ";
    level.lang_texts[1]["HELP_COMMAND_TITLE"] = "^7Help command";
    level.lang_texts[1]["HELP_NIGHT_ON"] = "^3#^4night on ^7<- Activate Night mode, default filter ^20";
    level.lang_texts[1]["HELP_NIGHT_DISABLE"] = "^3#^4night d or disable ^7<- disable night";
    level.lang_texts[1]["HELP_FILTER"] = "^3#^4filter ^20^7 to ^236 ^7<- activate filter";
    level.lang_texts[1]["HELP_VALUE_NIGHT"] = "^3#^4vanight ^7or ^3#^4valuenight ^24.5 ^7or ^210 ^7<- adjust night dvar";
    level.lang_texts[1]["HELP_FOG"] = "^3#^4fog ^7<- disable or activate fog";
    level.lang_texts[1]["HELP_LANG"] = "^3#^4lang ^71^7,^72^7,^73 ^7<- change language (1-English, 2-Spanish, 3-Portuguese)";

    
    level.lang_texts[2] = [];
    level.lang_texts[2]["FOG_ACTIVATED"] = "Niebla activada";
    level.lang_texts[2]["FOG_DISABLED"] = "Niebla desactivada";
    level.lang_texts[2]["EXECUTE_NIGHT_ON"] = "Ejecute el comando #night on";
    level.lang_texts[2]["DARKNESS_ADJUSTED"] = "La oscuridad ha sido ajustada ";
    level.lang_texts[2]["VALID_CONFIG_RANGE"] = "La configuración válida es de 4.5 a 10";
    level.lang_texts[2]["FILTER_ACTIVATED"] = "Filtro activado: ";
    level.lang_texts[2]["AVAILABLE_FILTERS"] = "Filtros disponibles del 0 al 36";
    level.lang_texts[2]["DYNAMIC_MODE"] = "Modo Noche Dinámico activado";
    level.lang_texts[2]["NIGHT_MODE_ACTIVATED"] = "Modo noche activado";
    level.lang_texts[2]["LANG_SET_ENGLISH"] = "Idioma establecido: Inglés";
    level.lang_texts[2]["LANG_SET_SPANISH"] = "Idioma establecido: Español";
    level.lang_texts[2]["LANG_SET_PORTUGUESE"] = "Idioma establecido: Portugués";
    level.lang_texts[2]["AVAILABLE_LANGUAGES"] = "Idiomas disponibles: 1 - Inglés, 2 - Español, 3 - Portugués";
    level.lang_texts[2]["WAIT_COMMANDS"] = "Espere a que los comandos terminen de mostrarse";
    level.lang_texts[2]["INVALID_MODE"] = "Modo de noche inválido: ";
    level.lang_texts[2]["HELP_COMMAND_TITLE"] = "^7Comandos de ayuda";
    level.lang_texts[2]["HELP_NIGHT_ON"] = "^3#^4night on ^7<- Activar Modo Noche, filtro por defecto ^20";
    level.lang_texts[2]["HELP_NIGHT_DISABLE"] = "^3#^4night d o disable ^7<- desactivar noche";
    level.lang_texts[2]["HELP_FILTER"] = "^3#^4filter ^20^7 al ^236 ^7<- activar filtro";
    level.lang_texts[2]["HELP_VALUE_NIGHT"] = "^3#^4vanight ^7o ^3#^4valuenight ^24.5 ^7a ^210 ^7<- ajustar dvar noche";
    level.lang_texts[2]["HELP_FOG"] = "^3#^4fog ^7<- desactivar o activar niebla";
    level.lang_texts[2]["HELP_LANG"] = "^3#^4lang ^71^7,^72^7,^73 ^7<- cambiar idioma (1-Inglés, 2-Español, 3-Portugués)";

    
    level.lang_texts[3] = [];
    level.lang_texts[3]["FOG_ACTIVATED"] = "Névoa ativada";
    level.lang_texts[3]["FOG_DISABLED"] = "Névoa desativada";
    level.lang_texts[3]["EXECUTE_NIGHT_ON"] = "Execute o comando #night on";
    level.lang_texts[3]["DARKNESS_ADJUSTED"] = "A escuridão foi ajustada ";
    level.lang_texts[3]["VALID_CONFIG_RANGE"] = "A configuração válida é de 4.5 a 10";
    level.lang_texts[3]["FILTER_ACTIVATED"] = "Filtro ativado: ";
    level.lang_texts[3]["AVAILABLE_FILTERS"] = "Filtros disponíveis de 0 a 36";
    level.lang_texts[3]["DYNAMIC_MODE"] = "Modo Noturno Dinâmico ativado";
    level.lang_texts[3]["NIGHT_MODE_ACTIVATED"] = "Modo noturno ativado";
    level.lang_texts[3]["LANG_SET_ENGLISH"] = "Idioma definido: Inglês";
    level.lang_texts[3]["LANG_SET_SPANISH"] = "Idioma definido: Espanhol";
    level.lang_texts[3]["LANG_SET_PORTUGUESE"] = "Idioma definido: Português";
    level.lang_texts[3]["AVAILABLE_LANGUAGES"] = "Idiomas disponíveis: 1 - Inglês, 2 - Espanhol, 3 - Português";
    level.lang_texts[3]["WAIT_COMMANDS"] = "Aguarde os comandos terminarem de ser exibidos";
    level.lang_texts[3]["INVALID_MODE"] = "Modo noturno inválido: ";
    level.lang_texts[3]["HELP_COMMAND_TITLE"] = "^7Comandos de ajuda";
    level.lang_texts[3]["HELP_NIGHT_ON"] = "^3#^4night on ^7<- Ativar Modo Noturno, filtro padrão ^20";
    level.lang_texts[3]["HELP_NIGHT_DISABLE"] = "^3#^4night d ou disable ^7<- desativar noite";
    level.lang_texts[3]["HELP_FILTER"] = "^3#^4filter ^20^7 a ^236 ^7<- ativar filtro";
    level.lang_texts[3]["HELP_VALUE_NIGHT"] = "^3#^4vanight ^7ou ^3#^4valuenight ^24.5 ^7a ^210 ^7<- ajustar dvar noite";
    level.lang_texts[3]["HELP_FOG"] = "^3#^4fog ^7<- desativar ou ativar névoa";
    level.lang_texts[3]["HELP_LANG"] = "^3#^4lang ^71^7,^72^7,^73 ^7<- alterar idioma (1-Inglês, 2-Espanhol, 3-Português)";
}

getLangText(text_key)
{
    lang = self.langLE;
    if (!isDefined(lang) || lang < 1 || lang > 3)
        lang = 1; 

    if (isDefined(level.lang_texts[lang]) && isDefined(level.lang_texts[lang][text_key]))
        return level.lang_texts[lang][text_key];
    else
        return level.lang_texts[1][text_key]; 
}

init()
{
    level endon("game_ended");
    level thread init_lang_texts();  
    level thread on_player_connect();
    level thread onPlayerSay();
    level thread monitor_end_game();
    level thread rotate_skydome();
    level thread change_skydome();
}
on_player_connect()
{
    level endon( "end_game" );
    for (;;)
    {
        level waittill( "connected", player );


        player thread on_players_spawned();
    
        wait 7.0;
    }
}
on_players_spawned()
{
    self endon( "disconnect" );
    
    self thread reset_night_mode_on_end();
    
    first_spawn = true;

    for (;;)
    {
        self waittill( "spawned_player" );
        self.nightfix = -1;
        self.fog = 0;
        self.definido_comandos = 0;
        self.langLE = 1; 

        if (first_spawn)
        {
            first_spawn = false;
            self thread save_default_dvars();
            self reset_all_night_mode_dvars();
            self thread load_night_mode_config();
        }
        
        
        self.nightfix = 1;

    }
}
save_default_dvars()
{
    if (isDefined(self.defaults_saved))
        return;

    self.defaults_saved = true;
    wait 0.5; 
    
    
    if (!isDefined(level.default_r_exposureValue)) level.default_r_exposureValue = getDvar("r_exposureValue");
    if (!isDefined(level.default_r_lightTweakSunLight)) level.default_r_lightTweakSunLight = getDvar("r_lightTweakSunLight");
    if (!isDefined(level.default_r_sky_intensity_factor0)) level.default_r_sky_intensity_factor0 = getDvar("r_sky_intensity_factor0");
    if (!isDefined(level.default_r_skyColorTemp)) level.default_r_skyColorTemp = getDvar("r_skyColorTemp");
    if (!isDefined(level.default_r_skyRotation)) level.default_r_skyRotation = getDvar("r_skyRotation");
    if (!isDefined(level.default_r_skyTransition)) level.default_r_skyTransition = getDvar("r_skyTransition");
    if (!isDefined(level.default_r_lighttweaksuncolor)) level.default_r_lighttweaksuncolor = getDvar("r_lighttweaksuncolor");
    if (!isDefined(level.default_r_lodScaleRigid)) level.default_r_lodScaleRigid = getDvar("r_lodScaleRigid");
    if (!isDefined(level.default_r_lodScaleSkinned)) level.default_r_lodScaleSkinned = getDvar("r_lodScaleSkinned");
    if (!isDefined(level.default_r_enablePlayerShadow)) level.default_r_enablePlayerShadow = getDvar("r_enablePlayerShadow");
    if (!isDefined(level.default_r_lightTweakSunDirection)) level.default_r_lightTweakSunDirection = getDvar("r_lightTweakSunDirection");
    if (!isDefined(level.default_wind_global_vector)) level.default_wind_global_vector = getDvar("wind_global_vector");
    if (!isDefined(level.default_sm_sunquality)) level.default_sm_sunquality = getDvar("sm_sunquality");
    if (!isDefined(level.default_r_dof_enable)) level.default_r_dof_enable = getDvar("r_dof_enable");
    if (!isDefined(level.default_r_lodBiasRigid)) level.default_r_lodBiasRigid = getDvar("r_lodBiasRigid");
    if (!isDefined(level.default_r_lodBiasSkinned)) level.default_r_lodBiasSkinned = getDvar("r_lodBiasSkinned");
    if (!isDefined(level.default_r_bloomScale)) level.default_r_bloomScale = getDvar("r_bloomScale");
    if (!isDefined(level.default_r_bloomThreshold)) level.default_r_bloomThreshold = getDvar("r_bloomThreshold");
}

reset_night_mode_on_end()
{
    self waittill( "disconnect" );
    self reset_all_night_mode_dvars();
}

monitor_end_game()
{
    level waittill( "end_game" );
    
    foreach(player in level.players)
    {
        if (isDefined(player))
        {
            player reset_all_night_mode_dvars();
        }
    }
}

reset_all_night_mode_dvars()
{
    
    self SetClientDvar("r_filmUseTweaks", 0);
    self SetClientDvar("r_bloomTweaks", 0);
    self SetClientDvar("r_exposureTweak", 0);
    
    
    if (isDefined(level.default_r_exposureValue)) self apply_night_vision_exposure(level.default_r_exposureValue);
    else self apply_night_vision_exposure(0);
    
    if (isDefined(level.default_r_lightTweakSunLight)) self SetClientDvar("r_lightTweakSunLight", level.default_r_lightTweakSunLight);
    if (isDefined(level.default_r_sky_intensity_factor0)) self SetClientDvar("r_sky_intensity_factor0", level.default_r_sky_intensity_factor0);
    if (isDefined(level.default_r_skyColorTemp)) self SetClientDvar("r_skyColorTemp", level.default_r_skyColorTemp);
    if (isDefined(level.default_r_skyRotation)) self SetClientDvar("r_skyRotation", level.default_r_skyRotation);
    if (isDefined(level.default_r_skyTransition)) self SetClientDvar("r_skyTransition", level.default_r_skyTransition);
    if (isDefined(level.default_r_lighttweaksuncolor)) self SetClientDvar("r_lighttweaksuncolor", level.default_r_lighttweaksuncolor);
    if (isDefined(level.default_r_lodScaleRigid)) self SetClientDvar("r_lodScaleRigid", level.default_r_lodScaleRigid);
    if (isDefined(level.default_r_lodScaleSkinned)) self SetClientDvar("r_lodScaleSkinned", level.default_r_lodScaleSkinned);
    if (isDefined(level.default_r_enablePlayerShadow)) self SetClientDvar("r_enablePlayerShadow", level.default_r_enablePlayerShadow);
    if (isDefined(level.default_r_lightTweakSunDirection)) self SetClientDvar("r_lightTweakSunDirection", level.default_r_lightTweakSunDirection);
    if (isDefined(level.default_wind_global_vector)) self SetClientDvar("wind_global_vector", level.default_wind_global_vector);
    if (isDefined(level.default_sm_sunquality)) self SetClientDvar("sm_sunquality", level.default_sm_sunquality);
    if (isDefined(level.default_r_dof_enable)) self SetClientDvar("r_dof_enable", level.default_r_dof_enable);
    if (isDefined(level.default_r_lodBiasRigid)) self SetClientDvar("r_lodBiasRigid", level.default_r_lodBiasRigid);
    if (isDefined(level.default_r_lodBiasSkinned)) self SetClientDvar("r_lodBiasSkinned", level.default_r_lodBiasSkinned);
    if (isDefined(level.default_r_bloomScale)) self SetClientDvar("r_bloomScale", level.default_r_bloomScale);
    if (isDefined(level.default_r_bloomThreshold)) self SetClientDvar("r_bloomThreshold", level.default_r_bloomThreshold);

    
    self SetClientDvar( "vc_fgm", "1 1 1 1" );
    self SetClientDvar( "vc_fbm", "0 0 0 0" );
    self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar( "vc_yh", "0 0 0 0" );
    self SetClientDvar( "vc_yl", "0 0 0 0" );
    self SetClientDvar( "vc_rgbh", "0 0 0 0" );
    self SetClientDvar( "vc_rgbl", "0 0 0 0" );

    
    self SetClientDvar("r_filmTweakEnable", 0);
    self SetClientDvar("r_filmTweakInvert", 0);
    self SetClientDvar("r_filmTweakBrightness", 0);
    self SetClientDvar("r_filmTweakContrast", 1);
    self SetClientDvar("r_filmTweakDesaturation", 0);
    self SetClientDvar("r_filmTweakLightTint", "1 1 1");
    self SetClientDvar("r_filmTweakDarkTint", "1 1 1");
    
    
    if (isDefined(self.fog) && self.fog == 1)
    {
        self SetClientDvar("r_fog", "1");
        self SetClientDvar("scr_fog_disable", "0");
        self SetClientDvar("r_fog_disable", "0");
        self SetClientDvar("r_fogSunOpacity", "1");
        self.fog = 0;
    }
    
    self.nightfix = -1;
    self.night_mode_enabled = false;
}

night_mode_toggle(i)
{
    self endon("discconnect");
    self notify("stop_night_threads");
    self.nightfix = 1;
    
    
    self.nm_state = "enabled";
    self.nm_filter = i;
    self.nm_value = 0; 
    
    
    self save_night_mode_config();


	switch (i)
	{
		case 0:              self thread enable_dark_mode();                           break;
		case 1:              self thread enable_acid_night_mode();                     break;
		case 2:              self thread enable_mystic_purple_night_mode();            break;
		case 3:              self thread enable_apocalyptic_yellow_night_mode();       break;
		case 4:              self thread enable_radioactive_green_night_mode();        break;
		case 5:              self thread enable_bloody_night_mode();                   break;
		case 6:              self thread enable_cold_night_mode();                     break;
		case 7:              self thread enable_extreme_blue_night_mode();             break;
		case 8:              self thread enable_luminous_night_mode();                 break;
		case 9:              self thread enable_warm_night_mode();                     break;
		case 10:             self thread enable_nebulous_night_mode();                 break;
		case 11:             self thread enable_apocalyptic_night_mode();              break;
		case 12:             self thread enable_retro_night_mode();                    break;
		case 13:             self thread enable_ice_night_mode();                      break;
		case 14:             self thread enable_ghost_night_mode();                    break;
		case 15:             self thread enable_starred_night_mode();                  break;
		case 16:             self thread enable_radiant_night_mode();                  break;
		case 17:             self thread enable_storm_night_mode();                    break;
        case 18:             self thread enable_galaxy_night_mode();                   break;
        case 19:             self thread enable_pastel_pink_night_mode();              break;
        case 20:             self thread enable_gray_night_mode();                     break;
        case 21:             self thread enable_cyberpunk_night_mode();               break;
        case 22:             self thread enable_underwater_night_mode();              break;
        case 23:             self thread enable_desert_storm_night_mode();            break;
        case 24:             self thread enable_mystic_forest_night_mode();           break;
        case 25:             self thread enable_volcano_lava_night_mode();            break;
        case 26:             self thread enable_crystal_cave_night_mode();            break;
        case 27:             self thread enable_haunted_house_night_mode();           break;
        case 28:             self thread enable_carnival_circus_night_mode();         break;
        case 29:             self thread enable_alien_space_night_mode();             break;
        case 30:             self thread enable_coral_reef_night_mode();              break;
        case 31:             self thread enable_northern_lights_night_mode();         break;
        case 32:             self thread enable_toxic_waste_night_mode();             break;
        case 33:             self thread enable_ancient_temple_night_mode();          break;
        case 34:             self thread enable_futuristic_city_night_mode();         break;
        case 35:             self thread enable_dream_world_night_mode();             break;
        case 36:             self thread enable_dynamic_night_mode();                 break;
	}



	wait 0.05;
}
set_common_dvars()
{
    if (!isDefined(level.default_r_exposureValue))
        level.default_r_exposureValue = getDvar("r_exposureValue");

    if (!isDefined(level.default_r_lightTweakSunLight))
        level.default_r_lightTweakSunLight = getDvar("r_lightTweakSunLight");

    if (!isDefined(level.default_r_sky_intensity_factor0))
        level.default_r_sky_intensity_factor0 = getDvar("r_sky_intensity_factor0");

    self SetClientDvar("r_filmUseTweaks", 1); self SetClientDvar("r_bloomTweaks", 1); self SetClientDvar("r_exposureTweak", 1);
}

set_map_specific_exposure()
{
    if (level.script == "zm_buried")
    {
        self setclientdvar("r_exposureValue", 5);
    }
    else if (level.script == "zm_tomb")
    {
        self setclientdvar("r_exposureValue", 5);
    }
    else if (level.script == "zm_nuked")
    {
        self setclientdvar("r_exposureValue", 5);
    }
    else if (level.script == "zm_highrise")
    {
        self setclientdvar("r_exposureValue", 5);
    }
	else if (level.script == "zm_transit")
    {
        self setclientdvar("r_exposureValue", 5);
    }
	else if (level.script == "zm_prison")
    {
        self setclientdvar("r_exposureValue", 5);
    }
}


enable_dark_mode()
{
    self endon("disconnect");
    set_common_dvars();
	
	self setClientDvar("r_lodScaleRigid", 1);
	self setClientDvar("r_lodScaleSkinned", 1);
	self setclientdvar("r_enablePlayerShadow", 1);
	self setclientdvar( "r_filmUseTweaks", 1 );
	self setclientdvar( "r_bloomTweaks", 1 );
	self setclientdvar( "r_exposureTweak", 1 );
    
    
    self SetClientDvar( "vc_fgm", "1 1 1 1" );
    self SetClientDvar( "vc_fbm", "0 0 0 0" );
    self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar( "vc_yh", "0 0 0 0" );
    self SetClientDvar( "vc_yl", "0 0 0 0" );
    self SetClientDvar( "vc_rgbh", "0 0 0 0" );
    self SetClientDvar( "vc_rgbl", "0 0 0 0" );

	self apply_night_vision_exposure( 3.5 );
	self setclientdvar( "r_lightTweakSunLight", 15 ); 
	self setclientdvar( "r_sky_intensity_factor0", 3 ); 
    self setclientdvar( "r_lightTweakSunDirection", ( 300, 250, 12 ) );
    self setclientdvar( "wind_global_vector", ( 300, 220, 100 ) );
    self setclientdvar( "sm_sunquality", 2 );
	
    set_map_specific_exposure();
    self thread visual_fix();
}
enable_acid_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 ); 
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.2 0.8 0.2 0");
    self SetClientDvar("vc_yl", "0.1 0.5 0.1 0");
    self SetClientDvar("vc_yh", "0.3 0.9 0.3 0");
    self SetClientDvar("vc_rgbl", "0.2 0.8 0.2 0");
    self SetClientDvar("r_exposureValue", 4.0);
    self SetClientDvar("r_lightTweakSunLight", 1.2);
    self SetClientDvar("r_sky_intensity_factor0", 1.0);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_mystic_purple_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 );
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.5 0 0.5 0");
    self SetClientDvar("vc_yl", "0.4 0 0.4 0");
    self SetClientDvar("vc_yh", "0.6 0 0.6 0");
    self SetClientDvar("vc_rgbl", "0.5 0 0.5 0");
    self SetClientDvar("r_exposureValue", 2.0);
    self SetClientDvar("r_lightTweakSunLight", 0.3);
    self SetClientDvar("r_sky_intensity_factor0", 0.5);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
}

enable_apocalyptic_yellow_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.9 0.7 0.1 0");
    self SetClientDvar("vc_yl", "0.8 0.6 0.1 0");
    self SetClientDvar("vc_yh", "1 0.8 0.2 0");
    self SetClientDvar("vc_rgbl", "0.9 0.7 0.1 0");
    self SetClientDvar("r_exposureValue", 3.0);
    self SetClientDvar("r_lightTweakSunLight", 0.5);
    self SetClientDvar("r_sky_intensity_factor0", 0.3);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_radioactive_green_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.1 0.8 0.1 0");
    self SetClientDvar("vc_yl", "0.1 0.6 0.1 0");
    self SetClientDvar("vc_yh", "0.1 1 0.1 0");
    self SetClientDvar("vc_rgbl", "0.1 0.8 0.1 0");
    self SetClientDvar("r_exposureValue", 2.5);
    self SetClientDvar("r_lightTweakSunLight", 0.4);
    self SetClientDvar("r_sky_intensity_factor0", 0.2);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}
enable_bloody_night_mode()
{
	self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 ); 
    self SetClientDvar( "vc_rgbh", "0.6 0 0 0" );
    self SetClientDvar( "vc_yl", "0.15 0 0 0" ); 
    self SetClientDvar( "vc_yh", "0.2 0 0 0" );
    self SetClientDvar( "vc_rgbl", "0.6 0 0 0" );
    self SetClientDvar( "r_exposureValue", 1.5 );
    self SetClientDvar( "r_lightTweakSunLight", 0.3 );
    self SetClientDvar( "r_sky_intensity_factor0", 0 );
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
	set_map_specific_exposure();
	self thread visual_fix();
}
enable_cold_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 );
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.2 0.2 0.5 0");
    self SetClientDvar("vc_yl", "0.2 0.2 0.5 0");
    self SetClientDvar("vc_yh", "0.3 0.3 0.6 0");
    self SetClientDvar("vc_rgbl", "0.1 0.1 0.4 0");
    self SetClientDvar("r_exposureValue", 1.5);
    self SetClientDvar("r_lightTweakSunLight", 0.3);
    self SetClientDvar("r_sky_intensity_factor0", 0.4);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_extreme_blue_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 );
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.1 0.1 0.8 0");
    self SetClientDvar("vc_yl", "0.1 0.1 0.6 0");
    self SetClientDvar("vc_yh", "0.2 0.2 1 0");
    self SetClientDvar("vc_rgbl", "0.1 0.1 0.8 0");
    self SetClientDvar("r_exposureValue", 1.8);
    self SetClientDvar("r_lightTweakSunLight", 0.2);
    self SetClientDvar("r_sky_intensity_factor0", 0.3);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}







enable_luminous_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 ); 
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.5 0.5 0.9 0");
    self SetClientDvar("vc_yl", "0.5 0.5 0.9 0");
    self SetClientDvar("vc_yh", "0.6 0.6 1 0");
    self SetClientDvar("vc_rgbl", "0.4 0.4 0.8 0");
    self SetClientDvar("r_exposureValue", 2.0);
    self SetClientDvar("r_lightTweakSunLight", 0.6);
    self SetClientDvar("r_sky_intensity_factor0", 0.6);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_warm_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.9 0.6 0.2 0");
    self SetClientDvar("vc_yl", "0.8 0.5 0.1 0");
    self SetClientDvar("vc_yh", "1 0.7 0.2 0");
    self SetClientDvar("vc_rgbl", "0.7 0.5 0.2 0");
    self SetClientDvar("r_exposureValue", 2.5);
    self SetClientDvar("r_lightTweakSunLight", 0.8);
    self SetClientDvar("r_sky_intensity_factor0", 0.5);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_nebulous_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "r_filmUseTweaks", 1 ); 
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.6 0.6 0.7 0");
    self SetClientDvar("vc_yl", "0.5 0.5 0.6 0");
    self SetClientDvar("vc_yh", "0.7 0.7 0.8 0");
    self SetClientDvar("vc_rgbl", "0.5 0.5 0.6 0");
    self SetClientDvar("r_exposureValue", 2.2);
    self SetClientDvar("r_lightTweakSunLight", 0.4);
    self SetClientDvar("r_sky_intensity_factor0", 0.3);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_apocalyptic_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.8 0.1 0.1 0");
    self SetClientDvar("vc_yl", "0.6 0.1 0.1 0");
    self SetClientDvar("vc_yh", "1 0.3 0.3 0");
    self SetClientDvar("vc_rgbl", "0.7 0.1 0.1 0");
    self SetClientDvar("r_exposureValue", 3.0);
    self SetClientDvar("r_lightTweakSunLight", 0.5);
    self SetClientDvar("r_sky_intensity_factor0", 0.4);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_retro_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 ); 
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.2 0.5 0.1 0");
    self SetClientDvar("vc_yl", "0.2 0.5 0.1 0");
    self SetClientDvar("vc_yh", "0.3 0.6 0.2 0");
    self SetClientDvar("vc_rgbl", "0.1 0.4 0.1 0");
    self SetClientDvar("r_exposureValue", 2.0);
    self SetClientDvar("r_lightTweakSunLight", 0.4);
    self SetClientDvar("r_sky_intensity_factor0", 0.2);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_ice_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 ); 
    self SetClientDvar( "r_bloomTweaks", 1 );
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.1 0.5 0.8 0");
    self SetClientDvar("vc_yl", "0.1 0.4 0.7 0");
    self SetClientDvar("vc_yh", "0.2 0.6 1 0");
    self SetClientDvar("vc_rgbl", "0.1 0.5 0.8 0");
    self SetClientDvar("r_exposureValue", 1.8);
    self SetClientDvar("r_lightTweakSunLight", 0.3);
    self SetClientDvar("r_sky_intensity_factor0", 0.4);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_ghost_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.8 0.8 0.9 0");
    self SetClientDvar("vc_yl", "0.7 0.7 0.8 0");
    self SetClientDvar("vc_yh", "0.9 0.9 1 0");
    self SetClientDvar("vc_rgbl", "0.6 0.6 0.8 0");
    self SetClientDvar("r_exposureValue", 2.5);
    self SetClientDvar("r_lightTweakSunLight", 0.4);
    self SetClientDvar("r_sky_intensity_factor0", 0.5);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_starred_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.2 0.2 0.5 0");
    self SetClientDvar("vc_yl", "0.2 0.2 0.5 0");
    self SetClientDvar("vc_yh", "0.3 0.3 0.6 0");
    self SetClientDvar("vc_rgbl", "0.1 0.1 0.4 0");
    self SetClientDvar("r_exposureValue", 2.0);
    self SetClientDvar("r_lightTweakSunLight", 0.5);
    self SetClientDvar("r_sky_intensity_factor0", 0.5);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_radiant_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 ); 
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.5 0.8 0.1 0");
    self SetClientDvar("vc_yl", "0.4 0.7 0.1 0");
    self SetClientDvar("vc_yh", "0.6 0.9 0.2 0");
    self SetClientDvar("vc_rgbl", "0.5 0.8 0.1 0");
    self SetClientDvar("r_exposureValue", 2.0);
    self SetClientDvar("r_lightTweakSunLight", 0.5);
    self SetClientDvar("r_sky_intensity_factor0", 0.5);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}

enable_storm_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 ); 
    self SetClientDvar( "r_bloomTweaks", 1 );
    self SetClientDvar( "r_exposureTweak", 1 ); 
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.3 0.3 0.4 0");
    self SetClientDvar("vc_yl", "0.3 0.3 0.5 0");
    self SetClientDvar("vc_yh", "0.4 0.4 0.6 0");
    self SetClientDvar("vc_rgbl", "0.2 0.2 0.3 0");
    self SetClientDvar("r_exposureValue", 1.8);
    self SetClientDvar("r_lightTweakSunLight", 0.4);
    self SetClientDvar("r_sky_intensity_factor0", 0.6);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.5);
    set_map_specific_exposure();
	self thread visual_fix();
}
enable_galaxy_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 ); 
    self SetClientDvar( "r_bloomTweaks", 1 ); 
    self SetClientDvar( "r_exposureTweak", 1 ); 
	self SetClientDvar( "vc_fbm", "0 0 0 0" );
	self SetClientDvar( "vc_fsm", "1 1 1 1" );
    self SetClientDvar("vc_rgbh", "0.4 0.1 0.7 0");
    self SetClientDvar("vc_yl", "0.3 0.1 0.5 0");
    self SetClientDvar("vc_yh", "0.5 0.2 0.8 0");
    self SetClientDvar("vc_rgbl", "0.3 0.1 0.5 0");
    self SetClientDvar("r_exposureValue", 2.5);
    self SetClientDvar("r_lightTweakSunLight", 0.6);
    self SetClientDvar("r_sky_intensity_factor0", 0.7);
    self SetClientDvar("r_bloomScale", 1.7);
    self SetClientDvar("r_bloomThreshold", 0.4);
    self SetClientDvar("r_filmTweakBrightness", 10);
    self SetClientDvar("r_filmTweakContrast", 5);
    self thread visual_fix();
    set_map_specific_exposure();
}
enable_pastel_pink_night_mode()
{
    self endon("disconnect");
    set_common_dvars();
	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 );
    self SetClientDvar( "r_exposureTweak", 1 );
    self SetClientDvar("vc_rgbh", "0.9 0.6 0.7 0");
    self SetClientDvar("vc_yl", "0.8 0.5 0.6 0");
    self SetClientDvar("vc_yh", "0.95 0.7 0.8 0");
    self SetClientDvar("vc_rgbl", "0.8 0.5 0.6 0");
    self SetClientDvar("r_exposureValue", 2.8);
    self SetClientDvar("r_lightTweakSunLight", 0.7);
    self SetClientDvar("r_sky_intensity_factor0", 0.8);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.3);
    self SetClientDvar("r_filmTweakBrightness", 10);
    self SetClientDvar("r_filmTweakContrast", 7);
    self thread visual_fix();
    set_map_specific_exposure();
}
enable_gray_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

	self SetClientDvar( "r_dof_enable", 0 );
	self SetClientDvar( "r_lodBiasRigid", -1000 );
	self SetClientDvar( "r_lodBiasSkinned", -1000 );
	self SetClientDvar( "r_enablePlayerShadow", 1 );
	self SetClientDvar( "r_skyTransition", 1 );
	self SetClientDvar( "sm_sunquality", 2 );
	self SetClientDvar( "r_filmUseTweaks", 1 );
    self SetClientDvar( "r_bloomTweaks", 1 );
    self SetClientDvar( "r_exposureTweak", 1 );
    self SetClientDvar("vc_rgbh", "0.5 0.5 0.5 0");
    self SetClientDvar("vc_yl", "0.4 0.4 0.4 0");
    self SetClientDvar("vc_yh", "0.6 0.6 0.6 0");
    self SetClientDvar("vc_rgbl", "0.4 0.4 0.4 0");
    self SetClientDvar("r_exposureValue", 2.2);
    self SetClientDvar("r_lightTweakSunLight", 0.5);
    self SetClientDvar("r_sky_intensity_factor0", 0.6);
    self SetClientDvar("r_bloomScale", 5);
    self SetClientDvar("r_bloomThreshold", 10);
    self SetClientDvar("r_filmTweakBrightness", 10);
    self SetClientDvar("r_filmTweakContrast", 7);
    self thread visual_fix();
    set_map_specific_exposure();
}




enable_cyberpunk_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.8 0.2 1.0 0");
    self SetClientDvar("vc_yl", "0.2 0.8 1.0 0");
    self SetClientDvar("vc_yh", "1.0 0.4 0.8 0");
    self SetClientDvar("vc_rgbl", "0.6 0.2 0.8 0");

    self SetClientDvar("r_exposureValue", 3.2);
    self SetClientDvar("r_lightTweakSunLight", 0.8);
    self SetClientDvar("r_sky_intensity_factor0", 0.9);
    self SetClientDvar("r_bloomScale", 2.0);
    self SetClientDvar("r_bloomThreshold", 0.6);
    self SetClientDvar("r_filmTweakBrightness", 15);
    self SetClientDvar("r_filmTweakContrast", 8);
    self SetClientDvar("r_filmTweakDesaturation", 0.3);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_underwater_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.1 0.3 0.8 0");
    self SetClientDvar("vc_yl", "0.1 0.2 0.6 0");
    self SetClientDvar("vc_yh", "0.2 0.4 1.0 0");
    self SetClientDvar("vc_rgbl", "0.1 0.2 0.5 0");

    self SetClientDvar("r_exposureValue", 1.5);
    self SetClientDvar("r_lightTweakSunLight", 0.2);
    self SetClientDvar("r_sky_intensity_factor0", 0.3);
    self SetClientDvar("r_bloomScale", 1.8);
    self SetClientDvar("r_bloomThreshold", 0.4);
    self SetClientDvar("r_filmTweakBrightness", -5);
    self SetClientDvar("r_filmTweakContrast", 12);
    self SetClientDvar("r_filmTweakDesaturation", 0.4);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_desert_storm_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.8 0.6 0.2 0");
    self SetClientDvar("vc_yl", "0.6 0.4 0.1 0");
    self SetClientDvar("vc_yh", "1.0 0.8 0.3 0");
    self SetClientDvar("vc_rgbl", "0.5 0.3 0.1 0");

    self SetClientDvar("r_exposureValue", 2.8);
    self SetClientDvar("r_lightTweakSunLight", 0.7);
    self SetClientDvar("r_sky_intensity_factor0", 0.8);
    self SetClientDvar("r_bloomScale", 1.3);
    self SetClientDvar("r_bloomThreshold", 0.5);
    self SetClientDvar("r_filmTweakBrightness", 8);
    self SetClientDvar("r_filmTweakContrast", 6);
    self SetClientDvar("r_filmTweakDesaturation", 0.1);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_mystic_forest_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.1 0.6 0.2 0");
    self SetClientDvar("vc_yl", "0.1 0.4 0.1 0");
    self SetClientDvar("vc_yh", "0.2 0.8 0.3 0");
    self SetClientDvar("vc_rgbl", "0.1 0.3 0.1 0");

    self SetClientDvar("r_exposureValue", 1.8);
    self SetClientDvar("r_lightTweakSunLight", 0.3);
    self SetClientDvar("r_sky_intensity_factor0", 0.4);
    self SetClientDvar("r_bloomScale", 2.2);
    self SetClientDvar("r_bloomThreshold", 0.3);
    self SetClientDvar("r_filmTweakBrightness", -3);
    self SetClientDvar("r_filmTweakContrast", 10);
    self SetClientDvar("r_filmTweakDesaturation", 0.6);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_volcano_lava_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "1.0 0.2 0.1 0");
    self SetClientDvar("vc_yl", "0.8 0.1 0.1 0");
    self SetClientDvar("vc_yh", "1.0 0.4 0.2 0");
    self SetClientDvar("vc_rgbl", "0.6 0.1 0.1 0");

    self SetClientDvar("r_exposureValue", 3.5);
    self SetClientDvar("r_lightTweakSunLight", 1.0);
    self SetClientDvar("r_sky_intensity_factor0", 0.7);
    self SetClientDvar("r_bloomScale", 2.5);
    self SetClientDvar("r_bloomThreshold", 0.7);
    self SetClientDvar("r_filmTweakBrightness", 12);
    self SetClientDvar("r_filmTweakContrast", 9);
    self SetClientDvar("r_filmTweakDesaturation", 0.2);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_crystal_cave_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.3 0.5 1.0 0");
    self SetClientDvar("vc_yl", "0.2 0.3 0.8 0");
    self SetClientDvar("vc_yh", "0.4 0.6 1.0 0");
    self SetClientDvar("vc_rgbl", "0.2 0.2 0.6 0");

    self SetClientDvar("r_exposureValue", 2.0);
    self SetClientDvar("r_lightTweakSunLight", 0.4);
    self SetClientDvar("r_sky_intensity_factor0", 0.5);
    self SetClientDvar("r_bloomScale", 2.8);
    self SetClientDvar("r_bloomThreshold", 0.5);
    self SetClientDvar("r_filmTweakBrightness", 5);
    self SetClientDvar("r_filmTweakContrast", 11);
    self SetClientDvar("r_filmTweakDesaturation", 0.5);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_haunted_house_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.3 0.7 0.3 0");
    self SetClientDvar("vc_yl", "0.2 0.5 0.2 0");
    self SetClientDvar("vc_yh", "0.4 0.8 0.4 0");
    self SetClientDvar("vc_rgbl", "0.1 0.3 0.1 0");

    self SetClientDvar("r_exposureValue", 1.2);
    self SetClientDvar("r_lightTweakSunLight", 0.1);
    self SetClientDvar("r_sky_intensity_factor0", 0.2);
    self SetClientDvar("r_bloomScale", 1.2);
    self SetClientDvar("r_bloomThreshold", 0.2);
    self SetClientDvar("r_filmTweakBrightness", -8);
    self SetClientDvar("r_filmTweakContrast", 14);
    self SetClientDvar("r_filmTweakDesaturation", 0.7);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_carnival_circus_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "1.0 0.8 0.2 0");
    self SetClientDvar("vc_yl", "0.8 0.2 0.8 0");
    self SetClientDvar("vc_yh", "1.0 1.0 0.4 0");
    self SetClientDvar("vc_rgbl", "0.6 0.4 0.1 0");

    self SetClientDvar("r_exposureValue", 3.0);
    self SetClientDvar("r_lightTweakSunLight", 0.9);
    self SetClientDvar("r_sky_intensity_factor0", 1.0);
    self SetClientDvar("r_bloomScale", 2.2);
    self SetClientDvar("r_bloomThreshold", 0.6);
    self SetClientDvar("r_filmTweakBrightness", 10);
    self SetClientDvar("r_filmTweakContrast", 7);
    self SetClientDvar("r_filmTweakDesaturation", 0.1);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_alien_space_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.2 0.9 0.6 0");
    self SetClientDvar("vc_yl", "0.1 0.7 0.4 0");
    self SetClientDvar("vc_yh", "0.3 1.0 0.8 0");
    self SetClientDvar("vc_rgbl", "0.1 0.5 0.3 0");

    self SetClientDvar("r_exposureValue", 2.5);
    self SetClientDvar("r_lightTweakSunLight", 0.6);
    self SetClientDvar("r_sky_intensity_factor0", 0.8);
    self SetClientDvar("r_bloomScale", 2.5);
    self SetClientDvar("r_bloomThreshold", 0.4);
    self SetClientDvar("r_filmTweakBrightness", 8);
    self SetClientDvar("r_filmTweakContrast", 9);
    self SetClientDvar("r_filmTweakDesaturation", 0.3);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_coral_reef_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.1 0.6 0.8 0");
    self SetClientDvar("vc_yl", "0.1 0.4 0.6 0");
    self SetClientDvar("vc_yh", "0.2 0.8 1.0 0");
    self SetClientDvar("vc_rgbl", "0.1 0.3 0.5 0");

    self SetClientDvar("r_exposureValue", 1.7);
    self SetClientDvar("r_lightTweakSunLight", 0.3);
    self SetClientDvar("r_sky_intensity_factor0", 0.4);
    self SetClientDvar("r_bloomScale", 2.0);
    self SetClientDvar("r_bloomThreshold", 0.3);
    self SetClientDvar("r_filmTweakBrightness", -2);
    self SetClientDvar("r_filmTweakContrast", 13);
    self SetClientDvar("r_filmTweakDesaturation", 0.4);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_northern_lights_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.3 0.8 0.9 0");
    self SetClientDvar("vc_yl", "0.1 0.6 0.7 0");
    self SetClientDvar("vc_yh", "0.5 1.0 1.0 0");
    self SetClientDvar("vc_rgbl", "0.2 0.5 0.6 0");

    self SetClientDvar("r_exposureValue", 1.9);
    self SetClientDvar("r_lightTweakSunLight", 0.4);
    self SetClientDvar("r_sky_intensity_factor0", 0.5);
    self SetClientDvar("r_bloomScale", 2.8);
    self SetClientDvar("r_bloomThreshold", 0.4);
    self SetClientDvar("r_filmTweakBrightness", 3);
    self SetClientDvar("r_filmTweakContrast", 10);
    self SetClientDvar("r_filmTweakDesaturation", 0.6);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_toxic_waste_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.8 0.9 0.2 0");
    self SetClientDvar("vc_yl", "0.6 0.7 0.1 0");
    self SetClientDvar("vc_yh", "1.0 1.0 0.3 0");
    self SetClientDvar("vc_rgbl", "0.5 0.6 0.1 0");

    self SetClientDvar("r_exposureValue", 2.7);
    self SetClientDvar("r_lightTweakSunLight", 0.6);
    self SetClientDvar("r_sky_intensity_factor0", 0.7);
    self SetClientDvar("r_bloomScale", 1.8);
    self SetClientDvar("r_bloomThreshold", 0.5);
    self SetClientDvar("r_filmTweakBrightness", 6);
    self SetClientDvar("r_filmTweakContrast", 8);
    self SetClientDvar("r_filmTweakDesaturation", 0.2);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_ancient_temple_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.8 0.5 0.2 0");
    self SetClientDvar("vc_yl", "0.6 0.3 0.1 0");
    self SetClientDvar("vc_yh", "1.0 0.7 0.3 0");
    self SetClientDvar("vc_rgbl", "0.5 0.3 0.1 0");

    self SetClientDvar("r_exposureValue", 2.3);
    self SetClientDvar("r_lightTweakSunLight", 0.5);
    self SetClientDvar("r_sky_intensity_factor0", 0.6);
    self SetClientDvar("r_bloomScale", 1.5);
    self SetClientDvar("r_bloomThreshold", 0.4);
    self SetClientDvar("r_filmTweakBrightness", 4);
    self SetClientDvar("r_filmTweakContrast", 9);
    self SetClientDvar("r_filmTweakDesaturation", 0.3);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_futuristic_city_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.7 0.8 1.0 0");
    self SetClientDvar("vc_yl", "0.5 0.6 0.8 0");
    self SetClientDvar("vc_yh", "0.9 1.0 1.0 0");
    self SetClientDvar("vc_rgbl", "0.4 0.5 0.7 0");

    self SetClientDvar("r_exposureValue", 2.8);
    self SetClientDvar("r_lightTweakSunLight", 0.7);
    self SetClientDvar("r_sky_intensity_factor0", 0.9);
    self SetClientDvar("r_bloomScale", 2.0);
    self SetClientDvar("r_bloomThreshold", 0.6);
    self SetClientDvar("r_filmTweakBrightness", 12);
    self SetClientDvar("r_filmTweakContrast", 7);
    self SetClientDvar("r_filmTweakDesaturation", 0.1);

    self thread visual_fix();
    set_map_specific_exposure();
}


enable_dream_world_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    self SetClientDvar("r_dof_enable", 0);
    self SetClientDvar("r_lodBiasRigid", -1000);
    self SetClientDvar("r_lodBiasSkinned", -1000);
    self SetClientDvar("r_enablePlayerShadow", 1);
    self SetClientDvar("r_skyTransition", 1);
    self SetClientDvar("sm_sunquality", 2);
    self SetClientDvar("r_filmUseTweaks", 1);
    self SetClientDvar("r_bloomTweaks", 1);
    self SetClientDvar("r_exposureTweak", 1);

    
    self SetClientDvar("vc_rgbh", "0.9 0.4 0.8 0");
    self SetClientDvar("vc_yl", "0.7 0.3 0.6 0");
    self SetClientDvar("vc_yh", "1.0 0.6 1.0 0");
    self SetClientDvar("vc_rgbl", "0.6 0.2 0.5 0");

    self SetClientDvar("r_exposureValue", 2.4);
    self SetClientDvar("r_lightTweakSunLight", 0.5);
    self SetClientDvar("r_sky_intensity_factor0", 0.7);
    self SetClientDvar("r_bloomScale", 2.5);
    self SetClientDvar("r_bloomThreshold", 0.3);
    self SetClientDvar("r_filmTweakBrightness", 7);
    self SetClientDvar("r_filmTweakContrast", 8);
    self SetClientDvar("r_filmTweakDesaturation", 0.4);

    self thread visual_fix();
    set_map_specific_exposure();
}
disable_night_mode() 
{
	self notify( "disable_nightmode" );
    
    
    self.nm_state = "disabled";
    self.nm_filter = 0;
    self.nm_value = 0;
    self save_night_mode_config();

    self reset_all_night_mode_dvars();
}

visual_fix()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
	self endon( "disconnect" );
	self endon( "disable_nightmode" );
    self endon( "stop_night_threads" );
	if( level.script == "zm_buried" )
	{
		while( getDvar( "r_sky_intensity_factor0" ) != 0 )
		{	
			self SetClientDvar( "r_lightTweakSunLight", 1 );
			self SetClientDvar( "r_sky_intensity_factor0", 0 );
			wait 0.05;
		}
	}
	else if( level.script == "zm_prison" || level.script == "zm_tomb" )
	{
		while( getDvar( "r_lightTweakSunLight" ) != 0 )
		{
			for( i = getDvar( "r_lightTweakSunLight" ); i >= 0; i = ( i - 0.05 ) )
			{
				self SetClientDvar( "r_lightTweakSunLight", i );
				wait 0.05;
			}
			wait 0.05;
		}
	}
	else return;
}
fog()
{
	self endon("disconnect");
	wait 0.5;
	if (self.fog == 0)
	{
		self.fog = 1;
		self SetClientDvar("r_fog", "0");
		self SetClientDvar("scr_fog_disable", "1");
		self SetClientDvar("r_fog_disable", "1");
		self SetClientDvar("r_fogSunOpacity", "0");
        self iPrintln(self getLangText("FOG_ACTIVATED"));
	}
	else
	{
		self.fog = 0;
		self SetClientDvar("r_fog", "1");
		self SetClientDvar("scr_fog_disable", "0");
		self SetClientDvar("r_fog_disable", "0");
		self SetClientDvar("r_fogSunOpacity", "1");
        self iPrintln(self getLangText("FOG_DISABLED"));
	}
    
    self save_night_mode_config();
}
onPlayerSay()
{
    level endon("end_game");
    prefix = "#";
    for (;;)
    {
        level waittill("say", message, player);
        message = toLower(message);
        guild_name = player getGuid();
        if (!level.intermission && message[0] == prefix)
        {
            args = strtok(message, " ");
            command = getSubStr(args[0], 1);
            switch (command)
            {
            case "valuenight":
            case "vanight":
            case "vn":
                if (isDefined(args[1]))
                {
                    if(player.nightfix == 0)
                    {
                        player iPrintln(player getLangText("EXECUTE_NIGHT_ON"));
                    }
                    else{
                        i = Float(args[1]);
                        if(i >= 4.5 && i <= 10)
                        {
                            player iPrintln(player getLangText("DARKNESS_ADJUSTED") + i );
                            player setclientdvar("r_exposureValue", i);
                            
                            
                            player.nm_state = "enabled";
                            player.nm_value = i;
                            player save_night_mode_config();
                        }
                        else
                        {
                            player iPrintln(player getLangText("VALID_CONFIG_RANGE"));
                        }
                    }
                }
                break;
            case "filter":
            case "fl":
            case "f":
                if(isDefined(args[1]))
                {
                    if(player.nightfix > 0 && player.nightfix <= 1)
                    {
                        i = int(args[1]);
                        if(i >=0 && i <= 36)
                        {
                            player thread night_mode_toggle(i);
                            if (i == 36) {
                                player iPrintln(player getLangText("DYNAMIC_MODE"));
                            } else {
                                player iPrintln(player getLangText("FILTER_ACTIVATED") + i);
                            }
                        }
                        else
                        {
                            player iPrintln(player getLangText("AVAILABLE_FILTERS"));
                        }
                    }
                }
                break;
            case "night":
            case "ng":
            case "n":
                if(isDefined(args[1]))
                {
                    if(args[1] == "d" || args[1] == "disable")
                    {
                        player thread disable_night_mode();
                        
                        player.nightfix = 2;
                    }
                    else if(args[1] == "on")
                    {

                        player.nightfix = 0;
                        i = 0;
                        player thread night_mode_toggle(i);
                        
                        player iPrintln(player getLangText("NIGHT_MODE_ACTIVATED"));
                    }
                }
                break;
            case "fog":
            case "fg":
            case "f":
                player thread fog();
                break;
            case "command":
            case "cd":
            case "c":
                player thread helpcommand();
                break;
            case "lang":
            case "l":
                if(isDefined(args[1]))
                {
                    i = int(args[1]);
                    if(i >= 1 && i <= 3)
                    {
                        player.langLE = i;
                        switch(i)
                        {
                            case 1:
                                player iPrintln(player getLangText("LANG_SET_ENGLISH"));
                                break;
                            case 2:
                                player iPrintln(player getLangText("LANG_SET_SPANISH"));
                                break;
                            case 3:
                                player iPrintln(player getLangText("LANG_SET_PORTUGUESE"));
                                break;
                        }
                        player iPrintln("Language set to: " + player.langLE);
                    }
                    else
                    {
                        player iPrintln(player getLangText("AVAILABLE_LANGUAGES"));
                    }
                }
                break;
            }
        }
    }
}
helpcommand()
{
    if(self.definido_comandos == 1)
    {
        self iPrintln(self getLangText("WAIT_COMMANDS"));
    }
    else if(self.definido_comandos == 0)
    {
        
        self.definido_comandos = 1;
        
        hud = create_simple_hud_element();hud.x = 0.1;hud.y = 0.1; hud.fontScale = 1; 

        help_text = self getLangText("HELP_COMMAND_TITLE") + "\n" +
                     self getLangText("HELP_NIGHT_ON") + "\n" +
                     self getLangText("HELP_NIGHT_DISABLE") + "\n" +
                     self getLangText("HELP_FILTER") + "\n" +
                     self getLangText("HELP_VALUE_NIGHT");
        hud setText(help_text);
        wait(10);
        help_text2 = self getLangText("HELP_FOG") + "\n" +
                    self getLangText("HELP_LANG");
        hud setText(help_text2);
        wait(5);
    
        hud destroy();
        self.definido_comandos = 0;
    } 

}

create_simple_hud_element()
{
    hudElem = newclienthudelem(self);
    hudElem.elemtype = "icon";
    hudElem.font = "default";
    hudElem.fontscale = 1;
    
    hudElem.alpha = 1;
    hudElem.alignx = "left";
    hudElem.aligny = "top";
    hudElem.hidewheninmenu = false;
    return hudElem;
}

apply_night_vision_exposure(value)
{
    if (isDefined(self.night_mode_darkness) && self.night_mode_darkness >= 4.5)
    {
        self SetClientDvar("r_exposureValue", self.night_mode_darkness);
    }
    else
    {
        self SetClientDvar("r_exposureValue", value);
    }
}

rotate_skydome()
{
	if ( level.script == "zm_tomb" || level.script == "zm_prison" )
	{
		return;
	}
	
	x = 360;
	
	level endon( "game_ended" );
	self endon( "disconnect" );
    self endon( "disable_nightmode" );
    self endon( "stop_night_threads" );
	
	for(;;)
	{
		x -= 0.025;

		if ( x < 0 )
		{
			x += 360;
		}

		self setclientdvar( "r_skyRotation", x );
		wait 0.1;
	}
}

change_skydome()
{
	x = 6500;
	
	level endon( "game_ended" );
	self endon( "disconnect" );
    self endon( "disable_nightmode" );
    self endon( "stop_night_threads" );

	for(;;)
	{
		x += 1.626;

		if ( x > 25000 )
		{
			x -= 23350;
		}
		self setclientdvar( "r_skyColorTemp", x );
		wait 0.1;
	}
}

daynightcycle()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
    self endon( "disable_nightmode" );
    self endon( "stop_night_threads" );

	if( level.script == "zm_buried" )
    {
        exposure = 3; 
        bleed = 3; 
        light = 20; 
		
		while( 1 )
		{
			flag_wait( "power_on" );
			
            
            nightnumber = randomintrange( 1, 48 );

            while( bleed == 3 && light == 15 && exposure == 3.85 && nightnumber == 24 )
            {
                bleed = bleed + 0.08;
                light = light + 0.08;
                exposure = exposure + 0.05;

                if( exposure >= 5.723 )
                {
                    exposure = 5.723;
                }
                self setclientdvar( "r_exposureValue", exposure );
                if( light >= 30 )
                {
                    light = 30;
                }
                self setclientdvar( "r_lightTweakSunLight", light );
                if( bleed >= 5.7 )
                {
                    bleed = 5.7;
                }
                self setclientdvar( "r_sky_intensity_factor0", bleed );
                if( light == 30 && bleed == 5.7 && exposure == 5.723 )
                {
                    self setclientdvar( "vc_yl", "0 0 0.2 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.3 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.4 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.5 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.6 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.7 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.8 0 " );
                    wait 0.2;
                    break;
                }
                wait 0.005;
            }
            
            daynumber = randomintrange( 1, 24 );
            while( light == 30 && bleed == 5.7 && daynumber == 12 && exposure == 5.723 )
            {
                bleed = bleed - 0.1;
                light = light - 0.1;
                exposure = exposure - 0.05;

                if( exposure <= 3.85 )
                {
                    exposure = 3.85;
                }
                self setclientdvar( "r_exposureValue", exposure );
                if( light <= 15 )
                {
                    light = 15;
                }
                self setclientdvar( "r_lightTweakSunLight", light );
                if( bleed <= 3 )
                {
                    bleed = 3;
                }
                self setclientdvar( "r_sky_intensity_factor0", bleed );
                if( light == 15 && bleed == 3 && exposure == 3.85 )
                {
                    self setclientdvar( "vc_yl", "0 0 0.8 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.7 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.6 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.5 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.4 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.3 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.2 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.1 0 " );
                    wait 0.2;
                    break;
                }
                wait 0.005;
            }
			
			wait 13;
		}
    }
	else if( level.script == "zm_highrise" )
	{
        exposure = 3; 
        bleed = 3; 
        light = 20; 
		
		while( 1 )
		{
			flag_wait( "power_on" );
			
            nightnumber = randomintrange( 1, 48 );

            while( bleed == 3 && light == 15 && exposure == 3.85 && nightnumber == 24 )
            {
                bleed = bleed + 0.08;
                light = light + 0.08;
                exposure = exposure + 0.05;

                if( exposure >= 5.723 )
                {
                    exposure = 5.723;
                }
                self setclientdvar( "r_exposureValue", exposure );
                if( light >= 30 )
                {
                    light = 30;
                }
                self setclientdvar( "r_lightTweakSunLight", light );
                if( bleed >= 5.7 )
                {
                    bleed = 5.7;
                }
                self setclientdvar( "r_sky_intensity_factor0", bleed );
                if( light == 30 && bleed == 5.7 && exposure == 5.723 )
                {
                    self setclientdvar( "vc_yl", "0 0 0.2 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.3 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.4 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.5 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.6 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.7 0 " );
                    wait 0.15;
                    self setclientdvar( "vc_yl", "0 0 0.8 0 " );
                    wait 0.2;
                    break;
                }
                wait 0.005;
            }
            
            daynumber = randomintrange( 1, 24 );
            while( light == 30 && bleed == 5.7 && daynumber == 12 && exposure == 5.723 )
            {
                bleed = bleed - 0.1;
                light = light - 0.1;
                exposure = exposure - 0.05;

                if( exposure <= 3.85 )
                {
                    exposure = 3.85;
                }
                self setclientdvar( "r_exposureValue", exposure );
                if( light <= 15 )
                {
                    light = 15;
                }
                self setclientdvar( "r_lightTweakSunLight", light );
                if( bleed <= 3 )
                {
                    bleed = 3;
                }
                self setclientdvar( "r_sky_intensity_factor0", bleed );
                if( light == 15 && bleed == 3 && exposure == 3.85 )
                {
                    self setclientdvar( "vc_yl", "0 0 0.8 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.7 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.6 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.5 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.4 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.3 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.2 0 " );
                    wait 0.2;
                    self setclientdvar( "vc_yl", "0 0 0.1 0 " );
                    wait 0.2;
                    break;
                }
                wait 0.005;
            }
			wait 13;
		}
    }
	else return;
}

enable_dynamic_night_mode()
{
    self endon("disconnect");
    set_common_dvars();

    
    
    self thread daynightcycle();
    self thread visual_fix();

	self setClientDvar("r_lodScaleRigid", 1);
	self setClientDvar("r_lodScaleSkinned", 1);
	self setclientdvar("r_enablePlayerShadow", 1);
	self setclientdvar( "r_filmUseTweaks", 1 );
	self setclientdvar( "r_bloomTweaks", 1 );
	self setclientdvar( "r_exposureTweak", 1 );
	self setclientdvar( "r_exposureValue", 3.5 );
	self setclientdvar( "r_lightTweakSunLight", 15 ); 
	self setclientdvar( "r_sky_intensity_factor0", 3 ); 
    self setclientdvar( "r_lightTweakSunDirection", ( 300, 250, 12 ) );
    self setclientdvar( "wind_global_vector", ( 300, 220, 100 ) );
    self setclientdvar( "sm_sunquality", 2 );
	
	if( level.script == "zm_tomb" )
	{
		self setclientdvar( "r_skyRotation", 0 );
		self setclientdvar( "r_skyTransition", 0 );
		self setclientdvar( "r_exposureValue", 5.2 );
		self setclientdvar( "r_sky_intensity_factor0", 5 );
		self setclientdvar( "r_lighttweaksunlight", 20 );
		self setClientDvar( "r_bloomtweaks", 1 );
		self setclientdvar( "r_lighttweaksuncolor", "0.002 0.07 0.1" );
        self setclientdvar( "vc_fgm", "1 1 1 1" );
        self setclientdvar( "vc_fbm", "0 0 0 0" );
        self setclientdvar( "vc_fsm", "1 1 1 1" );
        self setclientdvar( "vc_yh", "0 0.08 0.2 0" );
        self setclientdvar( "vc_yl", "0 0.007 0.07 0" );
		self setclientdvar( "vc_rgbh", "0.005 0 0.05 0.5" );
		self setclientdvar( "vc_rgbl", "0 0.04 0.05 2" );
	}

    else if( level.script == "zm_buried" )
	{
		self setclientdvar( "r_skyRotation", 1 );
		self setclientdvar( "r_skyTransition", 0 );
		self setclientdvar( "r_exposureValue", 4.8 );
		self setclientdvar( "r_skyColorTemp", 85000 );
		self setclientdvar( "r_sky_intensity_factor0", 4 );
		self setclientdvar( "r_lighttweaksunlight", 30 );
		self setclientdvar( "r_lighttweaksuncolor", "0.1 0.07 0.2" );
        self setclientdvar( "vc_fgm", "1 1 1 1" );
        self setclientdvar( "vc_fbm", "0 0 0 0" );
        self setclientdvar( "vc_fsm", "1 1 1 1" );
        self setclientdvar( "vc_yh", "0 0 0.3 0" );
        
		self setclientdvar( "vc_yl", "0 0 0.4 0 " );
        self setclientdvar( "vc_rgbh", "0.002 0.001 0.2 2" );
        self setclientdvar( "vc_rgbl", "0.002 0.004 0.3 2" );
	}

	else if( level.script == "zm_nuked" )
	{
		self setclientdvar( "r_skyTransition", 0 );
		self setclientdvar( "r_skyRotation", 0 );
		self setclientdvar( "r_exposureValue", 6.4 );
		self setclientdvar( "r_skyColorTemp", 25000 );
		self setclientdvar( "r_sky_intensity_factor0", 1 );
		self setclientdvar( "r_lighttweaksunlight", 42 );
		self setclientdvar( "vc_fgm", "1 1 1 1" );
        self setclientdvar( "vc_fbm", "0 0 0 0" );
        self setclientdvar( "vc_fsm", "1 1 1 1" );
        self setclientdvar( "vc_yh", "0 0 0.2 0" );
        self setclientdvar( "vc_yl", "0 0.001 0.1 0" );
		self setclientdvar( "vc_rgbh", "0 0 1 0.5" );
		self setclientdvar( "vc_rgbl", "0.2015 0 0.498 4.2" );
		self setclientdvar( "r_lighttweaksuncolor", "0.2 0.2 0.5" );
		self setClientDvar( "r_bloomtweaks", 1 );
	}

	else if( level.script == "zm_highrise" )
	{
		self setclientdvar( "r_skyRotation", 1 );
		self setclientdvar( "r_skyTransition", 0 );
		self setclientdvar( "r_exposureValue", 6.1 );
		self setclientdvar( "r_skyColorTemp", 85000 );
		self setclientdvar( "r_sky_intensity_factor0", 2.6 ); 
		self setclientdvar( "r_lighttweaksunlight", 30 );
		self setclientdvar( "r_lighttweaksuncolor", "0.1 0.07 0.2" );
        self setclientdvar( "vc_fgm", "1 1 1 1" );
        self setclientdvar( "vc_fbm", "0 0 0 0" );
        self setclientdvar( "vc_fsm", "1 1 1 1" );
        self setclientdvar( "vc_yh", "0 0 0.4 0" );
        self setclientdvar( "vc_yl", "0.05 0 0.1 0" );
        self setclientdvar( "vc_rgbh", "0.1 0 0.489 0" );
        self setclientdvar( "vc_rgbl", "0.1015 0 0.598 0" );
	}

    else if( level.script == "zm_prison")
    {
		self setClientDvar("r_lodScaleRigid", 1);
		self setClientDvar("r_lodScaleSkinned", 1);
		self setclientdvar("r_enablePlayerShadow", 1);
		self setclientdvar("r_filmUseTweaks", 1);
		self setclientdvar("r_exposureTweak", 1);
		self setclientdvar("r_lightTweakSunLight", 15); 
		self setclientdvar("r_sky_intensity_factor0", 2); 
		self setclientdvar("r_lightTweakSunDirection", (250, 200, 10)); 
		self setclientdvar("wind_global_vector", (300, 220, 100)); 
		self setclientdvar("sm_sunquality", 2); 

		self setclientdvar("r_skyRotation", 0);
		self setclientdvar("r_skyTransition", 0);
		self setclientdvar("r_exposureValue", 5.7); 
		self setclientdvar("r_skyColorTemp", 25000); 
		self setclientdvar("r_sky_intensity_factor0", 2); 
		self setclientdvar("r_lighttweaksunlight", 15); 
		self setClientDvar("r_bloomtweaks", 1); 
		self setclientdvar("r_lighttweaksuncolor", "0.1 0.2 2.5"); 

		self setclientdvar("vc_fgm", "1 1 1 0");
		self setclientdvar("vc_fbm", "0 0 0 0");
		self setclientdvar("vc_fsm", "1 1 1 1");
		self setclientdvar("vc_yh", "4 0.08 0.2 4");
		self setclientdvar("vc_yl", "0.1 0 0.2 0");
		self setclientdvar("vc_rgbh", "0.1 0.6 3 4");
		self setclientdvar("vc_rgbl", "0.05 0.04 0.7 2.1");

    }
    else return;
}


save_night_mode_config()
{
    guid = self getGuid();
    path = "scriptdata/nightmode/" + guid + ".txt";
    
    file = fs_fopen(path, "write");
    if (isDefined(file))
    {
        
        state = "disabled";
        if (isDefined(self.nm_state)) state = self.nm_state;
        
        filter = 0;
        if (isDefined(self.nm_filter)) filter = self.nm_filter;
        
        val = 0;
        if (isDefined(self.nm_value)) val = self.nm_value;
        
        fog = 0;
        if (isDefined(self.fog)) fog = self.fog;
        
        content = "state: " + state + "\n";
        content += "filter: " + filter + "\n";
        content += "nightvalue: " + val + "\n";
        content += "fog: " + fog;
        
        fs_write(file, content);
        fs_fclose(file);
    }
}

load_night_mode_config()
{
    wait 2; 
    
    guid = self getGuid();
    path = "scriptdata/nightmode/" + guid + ".txt";
    
    loaded = false;
    
    if (fs_testfile(path))
    {
        file = fs_fopen(path, "read");
        if (isDefined(file))
        {
            content = fs_read(file, fs_length(file));
            fs_fclose(file);
            
            lines = strtok(content, "\n");
            
            
            state = "disabled";
            filter = 0;
            nightvalue = 0;
            fog = 0;
            
            foreach (line in lines)
            {
                
                if (isSubStr(line, "state:"))
                {
                    
                    tokens = strtok(line, ":");
                    if (tokens.size >= 2) state = tokens[1];
                    
                    
                    state = replace_string(state, " ", "");
                    state = replace_string(state, "\r", "");
                }
                else if (isSubStr(line, "filter:"))
                {
                     tokens = strtok(line, ":");
                     if (tokens.size >= 2) filter = int(tokens[1]);
                }
                else if (isSubStr(line, "nightvalue:"))
                {
                     tokens = strtok(line, ":");
                     if (tokens.size >= 2) nightvalue = float(tokens[1]);
                }
                else if (isSubStr(line, "fog:"))
                {
                     tokens = strtok(line, ":");
                     if (tokens.size >= 2) fog = int(tokens[1]);
                }
            }
            
            self iPrintln("Config Found: " + state + " F:" + filter + " V:" + nightvalue);

            
            self.fog = fog;
            if (self.fog == 1)
            {
                self SetClientDvar("r_fog", "0");
                self SetClientDvar("scr_fog_disable", "1");
                self SetClientDvar("r_fog_disable", "1");
                self SetClientDvar("r_fogSunOpacity", "0");
                self iPrintln(self getLangText("FOG_ACTIVATED"));
            }
            else
            {
                self SetClientDvar("r_fog", "1");
                self SetClientDvar("scr_fog_disable", "0");
                self SetClientDvar("r_fog_disable", "0");
                self SetClientDvar("r_fogSunOpacity", "1");
            }
            
            
            self.nm_state = state;
            self.nm_filter = filter;
            self.nm_value = nightvalue;
            
            
            if (state == "disabled")
            {
                self thread disable_night_mode();
                self.nightfix = 2;
                loaded = true;
            }
            else if (state == "enabled")
            {
                
                self.nightfix = 0;
                self thread night_mode_toggle(filter);
                loaded = true;
                
                
                
                wait 0.1; 
                if (nightvalue >= 4.5 && nightvalue <= 10)
                {
                    self.nightfix = 1; 
                    self setclientdvar("r_exposureValue", nightvalue);
                    self iPrintln("Loaded saved darkness: " + nightvalue);
                }
            }
            else 
            {
                 self iPrintln("Unknown state: " + state);
            }
        }
    }
    
    if (!loaded)
    {
        self iPrintln("No valid config. Defaulting to disabled.");
        self.nm_state = "disabled";
        self.nm_filter = 0;
        self.nm_value = 0;
        self.fog = 0;
        self thread disable_night_mode();
        self.nightfix = 2;
    }
}

