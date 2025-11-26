#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_utility;

#include scripts\zm\main;
#include scripts\zm\chat;











bigint_add(a, b)
{
    
    a = "" + a;
    b = "" + b;

    res = "";
    carry = 0;
    
    i = a.size - 1;
    j = b.size - 1;

    while (i >= 0 || j >= 0 || carry > 0)
    {
        digitA = 0;
        if (i >= 0)
        {
            digitA = int(a[i]);
            i--;
        }

        digitB = 0;
        if (j >= 0)
        {
            digitB = int(b[j]);
            j--;
        }

        sum = digitA + digitB + carry;
        carry = int(sum / 10);
        res = (sum % 10) + res;
    }

    return res;
}

bigint_sub(a, b)
{
    
    a = "" + a;
    b = "" + b;

    res = "";
    borrow = 0;

    i = a.size - 1;
    j = b.size - 1;

    while (i >= 0)
    {
        digitA = int(a[i]);
        digitB = 0;
        
        if (j >= 0)
        {
            digitB = int(b[j]);
            j--;
        }

        digitA -= borrow;

        if (digitA < digitB)
        {
            digitA += 10;
            borrow = 1;
        }
        else
        {
            borrow = 0;
        }

        res = (digitA - digitB) + res;
        i--;
    }

    
    while (res.size > 1 && res[0] == "0")
    {
        res = getSubStr(res, 1);
    }

    return res;
}

bigint_compare(a, b)
{
    a = "" + a;
    b = "" + b;

    if (a.size > b.size) return 1;
    if (a.size < b.size) return -1;

    for (i = 0; i < a.size; i++)
    {
        if (int(a[i]) > int(b[i])) return 1;
        if (int(a[i]) < int(b[i])) return -1;
    }

    return 0;
}

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


    new_balance = bigint_add(current_balance, amount);


    player.score -= amount;


    file = fs_fopen(filename, "write");
    
    if (!isDefined(file))
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1Error al acceder al banco");
        else
            player iPrintlnBold("^1Error accessing bank");
        
        player.score += amount;
        return;
    }
    
    current_time = getTime();

    
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


get_player_guid_by_name(player_name)
{
    
    foreach (player in level.players)
    {
        if (isDefined(player) && isDefined(player.name) &&
            toLower(player.name) == toLower(player_name))
        {
            return player getGuid();
        }
    }

    
    
    safe_name = player_name;

    
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

            
            guid = replace_string(guid, "\n", "");
            guid = replace_string(guid, "\r", "");

            return guid;
        }
    }

    return undefined;
}

get_bank_balance_with_id(player_id)
{
    filename = "bank/" + player_id + ".txt"; 

    if (!fs_testfile(filename))
    {
        return "0"; 
    }

    file = fs_fopen(filename, "read");

    if (!isDefined(file))
    {
        return "0"; 
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
            balance_str = getSubStr(line, 9); 
            
            
            return balance_str; 
        }
    }

    return "0"; 
}


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

    
    score_limit = 1000000;
    if (player.score >= score_limit)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1Ya has llegado al límite de puntos (1,000,000)");
        else
            player iPrintlnBold("^1Max points reached (1,000,000)");
        return;
    }

    if (player.score + amount > score_limit)
    {
        amount = score_limit - player.score;
        if (player.valuelang == 0)
            player iPrintlnBold("^3Ajustando retiro para llegar al límite de puntos");
        else
            player iPrintlnBold("^3Adjusting withdrawal to reach point limit");
    }

    
    player_id = player getGuid();

    
    
    current_balance = get_bank_balance_with_id(player_id);

    
    
    if (bigint_compare(current_balance, amount) == -1)
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1No tienes suficientes puntos en el banco");
        else
            player iPrintlnBold("^1Not enough points in bank");
        return;
    }

    filename = "bank/" + player_id + ".txt";

    
    new_balance = bigint_sub(current_balance, amount);

    
    player.score += amount;

    
    file = fs_fopen(filename, "write");

    if (!isDefined(file))
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1Error al acceder al banco");
        else
            player iPrintlnBold("^1Error accessing bank");
        
        player.score -= amount;
        return;
    }
    
    
    current_time = getTime();

    
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


bank_withdraw_all(player)
{
    
    
    player_id = player getGuid();

    current_balance = get_bank_balance_with_id(player_id);

    if (current_balance == "0")
    {
        if (player.valuelang == 0)
            player iPrintlnBold("^1No tienes puntos en el banco");
        else
            player iPrintlnBold("^1No points in bank");
        return;
    }

    amount_to_withdraw = 0;
    limit = 1000000;

    
    if (bigint_compare(current_balance, limit) == 1)
    {
        amount_to_withdraw = limit;
    }
    else
    {
        amount_to_withdraw = int(current_balance);
    }

    bank_withdraw(player, amount_to_withdraw);
}


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

    
    payer.score -= amount;
    receiver.score += amount;

    
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

    
    filename = "bank/" + target_guid + ".txt";
    if (!fs_testfile(filename))
    {
        if (payer.valuelang == 0)
            payer iPrintlnBold("^1El banco del jugador no existe");
        else
            payer iPrintlnBold("^1Player's bank doesn't exist");
        return;
    }

    
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

    
    player_name = "Jugador " + target_guid; 
    lines = strTok(content, "\n");
    for (i = 0; i < lines.size; i++)
    {
        line = lines[i];
        if (isSubStr(line, "Jugador: "))
        {
            player_name = getSubStr(line, 9); 
            break;
        }
    }

    
    current_balance = get_bank_balance_with_id(target_guid);
    new_balance = bigint_add(current_balance, amount);

    
    updated_content = replace_line(content, "Balance:", "Balance: " + new_balance);

    
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

    
    payer.score -= amount;

    
    if (payer.valuelang == 0)
        payer iPrintlnBold("^2Depositaste ^7" + amount + "^2 puntos al banco de ^7" + player_name);
    else
        payer iPrintlnBold("^2Deposited ^7" + amount + "^2 points to ^7" + player_name + "'s bank");
}