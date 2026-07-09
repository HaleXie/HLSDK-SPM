/**
 * Simple vertex shader for just showing the local view
 */
#version 300 es
uniform mat4 modelViewProjectionMatrix;
uniform mat4 u_ScreenPoseMatrix;
in vec3 a_Position;
in vec2 a_TextureCoordinate;
out vec2 v_TextureCoordinate;
void main() {
    v_TextureCoordinate = a_TextureCoordinate;
    gl_Position = modelViewProjectionMatrix * u_ScreenPoseMatrix * vec4(a_Position, 1.0);
}
