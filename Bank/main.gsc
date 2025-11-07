#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm;


#include scripts\zm\chat;
#include scripts\zm\bank;



init()
{
    level thread onPlayerConnect();
    level thread onPlayerSay();
}
onPlayerConnect()
{

    self endon("disconnect");
    for (;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
        
    }
}

onPlayerSpawned()
{
    level endon("game_ended");
    self endon("disconnect");

    for (;;)
    {
        self waittill("spawned_player");
        // INICIALIZACIÓN DE THREAD
        self.valuelang = 1; //Ingles = 1//Español = 0

        // Guardar GUID del jugador automáticamente
        self thread save_player_guid();
    }
}

save_player_guid()
{
    self endon("disconnect");

    // Esperar un poco para asegurar que el jugador esté completamente inicializado
    wait 1;

    if (!isDefined(self.name) || self.name == "")
        return;

    // Crear nombre de archivo seguro (reemplazar caracteres problemáticos)
    safe_name = self.name;

    // Reemplazar caracteres problemáticos en el nombre del archivo
    safe_name = replace_string(safe_name, " ", "_");
    safe_name = replace_string(safe_name, "[", "");
    safe_name = replace_string(safe_name, "]", "");
    safe_name = replace_string(safe_name, "{", "");
    safe_name = replace_string(safe_name, "}", "");
    safe_name = replace_string(safe_name, "(", "");
    safe_name = replace_string(safe_name, ")", "");
    safe_name = replace_string(safe_name, "<", "");
    safe_name = replace_string(safe_name, ">", "");
    safe_name = replace_string(safe_name, "|", "");
    safe_name = replace_string(safe_name, ":", "");
    safe_name = replace_string(safe_name, "*", "");
    safe_name = replace_string(safe_name, "?", "");
    safe_name = replace_string(safe_name, "\"", "");
    safe_name = replace_string(safe_name, "'", "");

    filename = "guids/" + safe_name + ".txt";

    // Crear directorio si no existe (aunque fs_fopen debería crearlo)
    file = fs_fopen(filename, "write");
    if (isDefined(file))
    {
        guid = self getGuid();
        fs_write(file, guid);
        fs_fclose(file);
    }
}

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