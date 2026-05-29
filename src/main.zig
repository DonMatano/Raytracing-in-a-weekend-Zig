const std = @import("std");
const Io = std.Io;

const raytrace_in_one_weekend = @import("raytrace_in_one_weekend");

const image_width: u16 = 256;
const image_height: u16 = 256;
const log = std.log.scoped(.D);

pub fn main(init: std.process.Init) !void {
    // Prints to stderr, unbuffered, ignoring potential errors.
    // In order to do I/O operations need an `Io` instance.
    const io = init.io;

    // Stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_file_writer: Io.File.Writer = .init(.stdout(), io, &stdout_buffer);
    const stdout_writer = &stdout_file_writer.interface;
    try stdout_writer.print("P3\n{d} {d}\n255\n", .{ image_width, image_height });
    for (0..image_height) |j| {
        log.info("\rScanlines remaining {d} ", .{image_height - j});
        for (0..image_width) |i| {
            const r: f64 = @as(f64, @floatFromInt(i)) / (image_width - 1);
            const g: f64 = @as(f64, @floatFromInt(j)) / (image_height - 1);
            const b: f64 = 0;

            const ir: i32 = @trunc(255.999 * r);
            const ig: i32 = @trunc(255.999 * g);
            const ib: i32 = @trunc(255.999 * b);

            try stdout_writer.print("{d} {d} {d}\n", .{ ir, ig, ib });
        }
    }

    log.info("\rDone\t\t\n", .{});

    try stdout_writer.flush(); // Don't forget to flush!
}
