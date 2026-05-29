const std = @import("std");
const Io = std.Io;
const Vec3 = @import("Vectors.zig").Vec3;

pub fn writeColor(writer: *Io.Writer, color: Vec3) !void {
    const max_color: f32 = 255.999;
    const r_byte: i32 = @trunc(max_color * color.x);
    const g_byte: i32 = @trunc(max_color * color.y);
    const b_byte: i32 = @trunc(max_color * color.z);
    try writer.print("{d} {d} {d}\n", .{ r_byte, g_byte, b_byte });
    try writer.flush();
}
