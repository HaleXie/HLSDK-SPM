/**
 * Simple vertex shader for just showing the local view
 */

uniform mat4 modelViewProjectionMatrix;
uniform mat4 transformationMatrix;
attribute vec4 a_Position;
attribute vec2 a_IconCoordinate;
varying vec2 v_IconCoordinate;
void main() {
    v_IconCoordinate = a_IconCoordinate;
    gl_Position = modelViewProjectionMatrix * transformationMatrix * a_Position;
}
