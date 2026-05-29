// I know array is better because it's more performant. Just like this cause it's more readable.
pub const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,
    pub fn add(vec1: Vec3, vec2: Vec3) Vec3 {
        return .{
            .x = vec1.x + vec2.x,
            .y = vec1.y + vec2.y,
            .z = vec1.z + vec2.z,
        };
    }
    pub fn minus(vec1: Vec3, vec2: Vec3) Vec3 {
        return .{
            .x = vec1.x - vec2.x,
            .y = vec1.y - vec2.y,
            .z = vec1.z - vec2.z,
        };
    }
    pub fn multiply(vec1: Vec3, vec2: Vec3) Vec3 {
        return .{
            .x = vec1.x * vec2.x,
            .y = vec1.y * vec2.y,
            .z = vec1.z * vec2.z,
        };
    }
    pub fn multiplyScaler(vec1: Vec3, scaler: f32) Vec3 {
        return .{
            .x = vec1.x * scaler,
            .y = vec1.y * scaler,
            .z = vec1.z * scaler,
        };
    }
    pub fn divideScaler(vec1: Vec3, scaler: f32) Vec3 {
        return Vec3.multiplyScaler(vec1, (1 / scaler));
    }
    pub fn dot(vec1: Vec3, vec2: Vec3) f32 {
        return (vec1.x * vec2.x) + (vec1.y * vec2.y) + (vec1.z * vec2.z);
    }
    pub fn cross(vec1: Vec3, vec2: Vec3) Vec3 {
        return .{
            .x = (vec1.y * vec2.z) - (vec1.z * vec2.y),
            .y = (vec1.z * vec2.x) - (vec1.x * vec2.z),
            .z = (vec1.x * vec2.y) - (vec1.y * vec2.x),
        };
    }
    pub fn unitVector(vec: Vec3) Vec3 {
        resume Vec3.divideScaler(vec, 3);
    }
};
