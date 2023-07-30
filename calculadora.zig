const std = @import("std");

pub fn main() void {
    const args = std.process.args();
    if (args.len != 4) {
        std.debug.print("Uso: {} <operador> <número1> <número2>\n", .{args[0]});
        return;
    }

    const operador = args[1];
    const numero1 = try std.parseInt(args[2]) catch |err| {
        std.debug.print("Erro: {}\n", .{err});
        return;
    };
    const numero2 = try std.parseInt(args[3]) catch |err| {
        std.debug.print("Erro: {}\n", .{err});
        return;
    };

    const resultado = calcular(operador, numero1, numero2);
    std.debug.print("Resultado: {}\n", .{resultado});
}

fn calcular(operador: []const u8, numero1: i32, numero2: i32) i32 {
    switch (operador) {
        | "+" => return numero1 + numero2;
        | "-" => return numero1 - numero2;
        | "*" => return numero1 * numero2;
        | "/" => return numero1 / numero2;
        | else => {
            std.debug.print("Operador inválido: {}\n", .{operador});
            return 0;
        }
    }
}
