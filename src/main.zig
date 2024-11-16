const std = @import("std");

// Fonction
fn sum(a: i32, b: i32) i32 {
    return a + b;
}

pub fn main() void {
    // Affichage d'un message
    std.debug.print("Salut les gens !\n", .{});

    // Constante
    const MAX_LIFE = 100;
    std.debug.print("Nombre de vie max = {d}\n", .{MAX_LIFE});

    // Variable
    var current_level: i32 = 8;
    std.debug.print("Niveau actuel : {d}\n", .{current_level});
    std.debug.print("Vous tuez un monstre\n", .{});
    std.debug.print("Vous venez de gagner un niveau !\n", .{});
    current_level += 1;
    std.debug.print("Vous avez atteint le niveau {d}\n", .{current_level});

    // Ignorer une valeur
    _ = 1 + 1;

    // Tableau
    var age = [_]i32{ 32, 1, 33, 4 };
    std.debug.print("age = {d}\n", .{age});
    age[1] = 10;
    std.debug.print("age après = {d}\n", .{age});
    std.debug.print("Il y a {d} élément(s) dans le tableau age\n", .{age.len});

    // Condition
    if (age[0] >= 18) {
        std.debug.print("Tu as {d} ans, tu es donc majeur.\n", .{age[0]});
        std.debug.print("Tu peux donc rentrer 👍\n", .{});
    } else {
        std.debug.print("Tu as {d} ans, tu n'es pas majeur.", .{age[0]});
        std.debug.print("Tu ne peux donc pas rentrer.", .{});
    }

    // Boucle While
    const message = "Je ne dois pas montrer mes fesses en publique.\n";
    const times = 10;
    var i: i32 = 0;
    while (i <= times) : (i += 1) {
        std.debug.print("{d} : ", .{i});
        std.debug.print("{s}", .{message});
    }

    // Boucle For
    const pseudo = [_]u8{ 'N', 'e', 'm', 'e', 's', 't', 'y' };
    for (pseudo, 0..) |char, index| {
        std.debug.print("{d}", .{index});
        std.debug.print(" : {c}\n", .{char});
    }

    // Appel d'une fonction
    const resultat = sum(10, 5);
    std.debug.print("resultat = {d}\n", .{resultat});

    // Nouveau bloque et donc nouvelle portée
    {
        // Defer permet d'executer une instruction au moment de quiter un bloque de code
        // Attention l'odre d'execution des defer est inversés
        defer std.debug.print("Defer te dit bye 👋\n", .{});
        defer std.debug.print("Mouhahaha 😛 !\n", .{});
        std.debug.print("Nous sommes dans un nouveau bloque de code\n", .{});
        std.debug.print("Nous sommes ici après le defer et pourtant il aura le dernier mot !\n", .{});
    }

    // Switch
    const days_of_the_week = [_]u8{ 'l', 'm', 'M', 'j', 'v', 's', 'd' };
    const today = 's';
    switch (today) {
        days_of_the_week[0] => std.debug.print("Nou somme lundi", .{}),
        days_of_the_week[1] => std.debug.print("Nous somme mardi.", .{}),
        days_of_the_week[2] => std.debug.print("Nous somme mercredi.", .{}),
        days_of_the_week[3] => std.debug.print("Nous somme jeudi.", .{}),
        days_of_the_week[4] => std.debug.print("Nous somme vendredi.", .{}),
        days_of_the_week[5] => std.debug.print("Nous somme samedi.", .{}),
        days_of_the_week[6] => std.debug.print("Nous somme dimanche.", .{}),
        else => {},
    }
}
