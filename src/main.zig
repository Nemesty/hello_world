const std = @import("std");

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

    // Boucle for
    const pseudo = [_]u8{ 'N', 'e', 'm', 'e', 's', 't', 'y' };
    for (pseudo, 0..) |char, index| {
        std.debug.print("{d}", .{index});
        std.debug.print(" : {c}\n", .{char});
    }
}
