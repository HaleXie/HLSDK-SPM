/**
 * Simple vertex shader for just showing the local view
 */

uniform mat4 modelViewProjectionMatrix;
uniform mat4 transformationMatrix;
attribute vec4 position;

void main() {
    gl_Position = modelViewProjectionMatrix * transformationMatrix * position;
}
