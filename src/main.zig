const std = @import("std");

// Fonction sans paramètre ni retour
fn space() void {
    std.debug.print("\n", .{});
}

// Fonction avec paramètre sans retour
fn title(section: []const u8) void {
    std.debug.print("⭐️ {s}\n", .{section});
}

// Fonction avec argument et retour
fn sum(a: i32, b: i32) i32 {
    return a + b;
}

// Fonction avec pointeur
fn incrementPoint(num: *u8) void {
    num.* += 1;
}

// Test : zig build test
test "out of bounds" {
    // Safety
    const tab = [3]u8{ 23, 2, 91 };
    std.debug.print("{}", .{tab[3]});
}
// Inatteignable
test "unreachable" {
    const x: i32 = 1;
    const y: i32 = if (x == 2) 5 else unreachable;
    _ = y;
}
// Pointeur Null
test "pointer dereference error" {
    const p: *u8 = undefined;
    std.debug.print("{}", .{p.*});
}

pub fn main() void {
    // Affichage d'un message
    title("Affichage d'un message");
    std.debug.print("Salut les gens !\n", .{});

    space();

    // Constante
    title("Constante");
    const MAX_LIFE = 100;
    std.debug.print("Nombre de vie max = {d}\n", .{MAX_LIFE});

    space();

    // Variable
    title("Variable");
    var current_level: i32 = 8;
    const LEVEL_MAX = 80;
    std.debug.print("Niveau actuel : {d}\n", .{current_level});
    std.debug.print("Vous tuez un monstre\n", .{});
    std.debug.print("Vous venez de gagner un niveau !\n", .{});
    current_level += 1;
    std.debug.print("Vous avez atteint le niveau {d}/{d}\n", .{current_level, LEVEL_MAX});
    // Ignorer une valeur
    _ = 1 + 1;

    space();

    // Tableau
    title("Tableau");
    var age = [_]i32{ 32, 1, 33, 4 };
    std.debug.print("age = {d}\n", .{age});
    age[1] = 10;
    std.debug.print("age après = {d}\n", .{age});
    std.debug.print("Il y a {d} élément(s) dans le tableau age\n", .{age.len});

    space();

    // Condition
    title("Condition");
    if (age[0] >= 18) {
        std.debug.print("Tu as {d} ans, tu es donc majeur.\n", .{age[0]});
        std.debug.print("Tu peux donc rentrer 👍\n", .{});
    } else {
        std.debug.print("Tu as {d} ans, tu n'es pas majeur.", .{age[0]});
        std.debug.print("Tu ne peux donc pas rentrer.", .{});
    }

    space();

    // Boucle While
    title("Boucle While");
    const message = "Je ne dois pas montrer mes fesses en publique.\n";
    const times = 5;
    var i: i32 = 0;
    while (i <= times) : (i += 1) {
        std.debug.print("{d} : ", .{i});
        std.debug.print("{s}", .{message});
    }

    space();

    // Boucle For
    title("Boucle For");
    const pseudo = [_]u8{ 'N', 'e', 'm', 'e', 's', 't', 'y' };
    for (pseudo, 0..) |char, index| {
        std.debug.print("{d}", .{index});
        std.debug.print(" : {c}\n", .{char});
    }

    space();

    // Appel d'une fonction
    title("Appel d'une fonction");
    const resultat = sum(10, 5);
    std.debug.print("resultat = {d}\n", .{resultat});

    space();

    // Nouveau bloque et donc nouvelle portée
    {
        title("Defer");
        // Defer permet d'executer une instruction au moment de quiter un bloque de code
        // Attention l'odre d'execution des defer est inversés
        defer std.debug.print("Defer te dit bye 👋\n", .{});
        defer std.debug.print("Mouhahaha 😛 !\n", .{});
        std.debug.print("Nous sommes dans un nouveau bloque de code\n", .{});
        std.debug.print("Nous sommes ici après le defer et pourtant il aura le dernier mot !\n", .{});
    }

    space();

    // Switch
    title("Switch");
    const days_of_the_week = [_]u8{ 'l', 'm', 'M', 'j', 'v', 's', 'd' };
    const today = 's';
    switch (today) {
        days_of_the_week[0] => std.debug.print("Nou somme lundi\n", .{}),
        days_of_the_week[1] => std.debug.print("Nous somme mardi.\n", .{}),
        days_of_the_week[2] => std.debug.print("Nous somme mercredi.\n", .{}),
        days_of_the_week[3] => std.debug.print("Nous somme jeudi.\n", .{}),
        days_of_the_week[4] => std.debug.print("Nous somme vendredi.\n", .{}),
        days_of_the_week[5] => std.debug.print("Nous somme samedi.\n", .{}),
        days_of_the_week[6] => std.debug.print("Nous somme dimanche.\n", .{}),
        else => {},
    }

    space();

    // Pointeurs et reference
    title("Pointeurs et reference");
    var x: u8 = 1;
    std.debug.print("x = {}\n", .{x});
    incrementPoint(&x);
    std.debug.print("Incrementation via pointeur, x = {}\n", .{x});

    space();

    // Slice
    title("Slice");
    const array = [_]u8{ 1, 2, 3, 4 };
    std.debug.print("Array = {d}\n", .{array});
    const slice = array[0..2];
    std.debug.print("Slice = {d}\n", .{slice});

    space();
}
