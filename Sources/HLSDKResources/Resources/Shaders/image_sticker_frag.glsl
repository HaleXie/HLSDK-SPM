/**
 * Simple fragment shader
 */
#version 300 es
precision mediump float;

uniform sampler2D s_Texture;
in vec2 v_TextureCoordinate;
out vec4 fragColor;

void main() {
    if (v_TextureCoordinate.s > 0.0 && v_TextureCoordinate.s < 1.0 && v_TextureCoordinate.t > 0.0 && v_TextureCoordinate.t < 1.0) {
        fragColor = texture(s_Texture, v_TextureCoordinate);
        return;
    }
    fragColor = vec4(0.0, 0.0, 0.0, 0.0);
}
