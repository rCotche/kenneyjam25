shader_type canvas_item;

uniform int radius : hint_range(1, 20) = 4;   // Rayon de flou
uniform float texel_scale : hint_range(0.1, 2.0) = 0; // Ajuste si tu downscales via un Viewport

void fragment() {
    vec2 texel = SCREEN_PIXEL_SIZE * texel_scale; // Taille d’un pixel en UV
    vec4 sum = vec4(0.0);
    int r = radius;
    float count = 0.0;

    for (int x = -r; x <= r; x++) {
        for (int y = -r; y <= r; y++) {
            vec2 offset = vec2(float(x), float(y)) * texel;
			sum += texture(TEXTURE, UV + offset);
            count += 1.0;
        }
    }
    COLOR = sum / count;
}
