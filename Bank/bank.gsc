#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

#include scripts\zm\main;
#include scripts\zm\chat;


//====================================================================================
// SISTEMA DE BANCO GLOBAL
//====================================================================================

get_bank_balance(player)
{
    player_id = player getGuid();

    return get_bank_balance_with_id(player_id);
}


bank_deposit(player, amount)
{
    if (!isDefined(amount) || amount <= 0)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1Cantidad inválida");
        else
            player iPrintlnBold("^1Invalid amount");
        return;
    }

    if (player.score < amount)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1No tienes suficientes puntos");
        else
            player iPrintlnBold("^1Not enough points");
        return;
    }

    player_id = player getGuid();

    filename = "bank/" + player_id + ".txt";


    current_balance = get_bank_balance_with_id(player_id);


    new_balance = current_balance + amount;


    player.score -= amount;


    file = fs_fopen(filename, "write");
    
    if (!isDefined(file))
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1Error al acceder al banco");
        else
            player iPrintlnBold("^1Error accessing bank");
        // Devolver puntos al jugador
        player.score += amount;
        return;
    }
    
    current_time = getTime();

    // Escribir datos del banco
    fs_write(file, "================================\n");
    fs_write(file, "CUENTA BANCARIA\n");
    fs_write(file, "================================\n");
    fs_write(file, "Jugador: " + player.name + "\n");
    fs_write(file, "ID: " + player_id + "\n");
    if (player.valuelang == 0)
        fs_write(file, "Ultima Transaccion: Deposito de " + amount + " puntos\n");
    else
        fs_write(file, "Last Transaction: Deposit of " + amount + " points\n");
    fs_write(file, "Fecha/Hora: " + current_time + "\n");
    fs_write(file, "Balance: " + new_balance + "\n");
    fs_write(file, "================================\n");
    
    fs_fclose(file);
    
    if (player.valuelang == 0)
        player iPrintlnBold("^2Depositaste ^7" + amount + "^2 puntos. Balance: ^7" + new_balance);
    else
        player iPrintlnBold("^2Deposited ^7" + amount + "^2 points. Balance: ^7" + new_balance);
}

// Función auxiliar para reemplazar líneas en el contenido
replace_line(content, prefix, new_line)
{
    lines = strTok(content, "\n");
    result = "";

    for (i = 0; i < lines.size; i++)
    {
        line = lines[i];
        if (isSubStr(line, prefix))
        {
            result += new_line;
        }
        else
        {
            result += line;
        }

        if (i < lines.size - 1)
            result += "\n";
    }

    return result;
}

// Función para obtener GUID de un jugador por nombre
get_player_guid_by_name(player_name)
{
    // Primero buscar si el jugador está online
    foreach (player in level.players)
    {
        if (isDefined(player) && isDefined(player.name) &&
            toLower(player.name) == toLower(player_name))
        {
            return player getGuid();
        }
    }

    // Si no está online, buscar en el archivo de GUIDs
    // Crear nombre de archivo seguro (igual que en save_player_guid)
    safe_name = player_name;

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

    if (fs_testfile(filename))
    {
        file = fs_fopen(filename, "read");
        if (isDefined(file))
        {
            file_size = fs_length(file);
            guid = fs_read(file, file_size);
            fs_fclose(file);

            // Limpiar posibles caracteres de nueva línea
            guid = replace_string(guid, "\n", "");
            guid = replace_string(guid, "\r", "");

            return guid;
        }
    }

    return undefined;
}

get_bank_balance_with_id(player_id)
{
    filename = "bank/" + player_id + ".txt"; // directory path


    if (!fs_testfile(filename))
    {
        return 0;
    }

    file = fs_fopen(filename, "read");

    if (!isDefined(file))
    {
        return 0;
    }

    file_size = fs_length(file);
    content = fs_read(file, file_size);
    fs_fclose(file);

    lines = strTok(content, "\n");
    for (i = 0; i < lines.size; i++)
    {
        line = lines[i];
        if (isSubStr(line, "Balance: "))
        {
            balance_str = getSubStr(line, 9); // "Balance: " tiene 9 caracteres
            return int(balance_str);
        }
    }

    return 0;
}

// Función para depositar todo el dinero
bank_deposit_all(player)
{
    amount = player.score;

    if (amount <= 0)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1No tienes puntos para depositar");
        else
            player iPrintlnBold("^1No points to deposit");
        return;
    }

    bank_deposit(player, amount);
}

// Función para retirar puntos del banco
bank_withdraw(player, amount)
{
    if (!isDefined(amount) || amount <= 0)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1Cantidad inválida");
        else
            player iPrintlnBold("^1Invalid amount");
        return;
    }

    // Obtener identificador del jugador (GUID directo)
    player_id = player getGuid();

    // Obtener balance actual usando el mismo player_id
    current_balance = get_bank_balance_with_id(player_id);

    if (current_balance < amount)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1No tienes suficientes puntos en el banco");
        else
            player iPrintlnBold("^1Not enough points in bank");
        return;
    }

    filename = "bank/" + player_id + ".txt";

    // Calcular nuevo balance
    new_balance = current_balance - amount;

    // Agregar puntos al jugador
    player.score += amount;

    // Actualizar archivo
    file = fs_fopen(filename, "write");

    if (!isDefined(file))
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1Error al acceder al banco");
        else
            player iPrintlnBold("^1Error accessing bank");
        // Quitar puntos del jugador
        player.score -= amount;
        return;
    }
    
    // Obtener fecha/hora
    current_time = getTime();

    // Escribir datos actualizados
    fs_write(file, "================================\n");
    fs_write(file, "CUENTA BANCARIA\n");
    fs_write(file, "================================\n");
    fs_write(file, "Jugador: " + player.name + "\n");
    fs_write(file, "ID: " + player_id + "\n");
    if (player.valuelang == 0)
        fs_write(file, "Ultima Transaccion: Retiro de " + amount + " puntos\n");
    else
        fs_write(file, "Last Transaction: Withdrawal of " + amount + " points\n");
    fs_write(file, "Fecha/Hora: " + current_time + "\n");
    fs_write(file, "Balance: " + new_balance + "\n");
    fs_write(file, "================================\n");

    fs_fclose(file);

    if (player.valuelang == 0)
        player iPrintlnBold("^2Retiraste ^7" + amount + "^2 puntos. Balance restante: ^7" + new_balance);
    else
        player iPrintlnBold("^2Withdrew ^7" + amount + "^2 points. Remaining balance: ^7" + new_balance);
}

// Función para retirar todo el dinero del banco
bank_withdraw_all(player)
{
    // Obtener identificador del jugador (GUID directo)
    player_id = player getGuid();

    current_balance = get_bank_balance_with_id(player_id);

    if (current_balance <= 0)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1No tienes puntos en el banco");
        else
            player iPrintlnBold("^1No points in bank");
        return;
    }

    bank_withdraw(player, current_balance);
}

// Función para pagar a otro jugador en partida
bank_pay_player(payer, receiver_name, amount)
{
    if (!isDefined(amount) || amount <= 0)
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1Cantidad inválida");
        else
            payer iPrintlnBold("^1Invalid amount");
        return;
    }

    if (payer.score < amount)
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1No tienes suficientes puntos");
        else
            payer iPrintlnBold("^1Not enough points");
        return;
    }

    // Buscar al receptor por nombre
    receiver = undefined;
    foreach (player in level.players)
    {
        if (isDefined(player) && isDefined(player.name) &&
            toLower(player.name) == toLower(receiver_name))
        {
            receiver = player;
            break;
        }
    }

    if (!isDefined(receiver))
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1Jugador '" + receiver_name + "' no encontrado");
        else
            payer iPrintlnBold("^1Player '" + receiver_name + "' not found");
        return;
    }

    if (receiver == payer)
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1No puedes pagarte a ti mismo");
        else
            payer iPrintlnBold("^1You can't pay yourself");
        return;
    }

    // Realizar la transacción
    payer.score -= amount;
    receiver.score += amount;

    // Feedback a ambos jugadores
    if (payer.valuelang == 0)
    {
        payer iPrintlnBold("^2Pagaste ^7" + amount + "^2 puntos a ^7" + receiver.name);
        receiver iPrintlnBold("^3Recibiste ^7" + amount + "^3 puntos de ^7" + payer.name);
    }
    else
    {
        payer iPrintlnBold("^2Paid ^7" + amount + "^2 points to ^7" + receiver.name);
        receiver iPrintlnBold("^3Received ^7" + amount + "^3 points from ^7" + payer.name);
    }
}

// Función para depositar directamente al banco de otro jugador (por GUID)
bank_pay_to_guid(payer, target_guid, amount)
{
    if (!isDefined(amount) || amount <= 0)
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1Cantidad inválida");
        else
            payer iPrintlnBold("^1Invalid amount");
        return;
    }

    if (payer.score < amount)
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1No tienes suficientes puntos");
        else
            payer iPrintlnBold("^1Not enough points");
        return;
    }

    // Verificar que no sea el mismo GUID
    payer_guid_str = "" + payer getGuid();
    target_guid_str = "" + target_guid;
    if (target_guid_str == payer_guid_str)
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1No puedes depositar a tu propio banco");
        else
            payer iPrintlnBold("^1You can't deposit to your own bank");
        return;
    }

    // Verificar si el archivo existe
    filename = "bank/" + target_guid + ".txt";
    if (!fs_testfile(filename))
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1El banco del jugador no existe");
        else
            payer iPrintlnBold("^1Player's bank doesn't exist");
        return;
    }

    // Leer contenido actual
    existing_file = fs_fopen(filename, "read");
    if (!isDefined(existing_file))
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1Error al acceder al banco del jugador");
        else
            payer iPrintlnBold("^1Error accessing player's bank");
        return;
    }

    file_size = fs_length(existing_file);
    content = fs_read(existing_file, file_size);
    fs_fclose(existing_file);

    // Extraer el nombre del jugador del archivo
    player_name = "Jugador " + target_guid; // Default
    lines = strTok(content, "\n");
    for (i = 0; i < lines.size; i++)
    {
        line = lines[i];
        if (isSubStr(line, "Jugador: "))
        {
            player_name = getSubStr(line, 9); // "Jugador: " tiene 9 caracteres
            break;
        }
    }

    // Obtener balance actual y calcular nuevo
    current_balance = get_bank_balance_with_id(target_guid);
    new_balance = current_balance + amount;

    // Actualizar solo el balance
    updated_content = replace_line(content, "Balance:", "Balance: " + new_balance);

    // Escribir archivo actualizado
    file = fs_fopen(filename, "write");
    if (isDefined(file))
    {
        fs_write(file, updated_content);
        fs_fclose(file);
    }
    else
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1Error al guardar en el banco del jugador");
        else
            payer iPrintlnBold("^1Error saving to player's bank");
        return;
    }

    // Descontar puntos del pagador
    payer.score -= amount;

    // Mensaje solo para el remitente
    if (payer.valuelang == 0)
        payer iPrintlnBold("^2Depositaste ^7" + amount + "^2 puntos al banco de ^7" + player_name);
    else
        payer iPrintlnBold("^2Deposited ^7" + amount + "^2 points to ^7" + player_name + "'s bank");
}