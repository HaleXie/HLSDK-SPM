/* -*- Mode: c; c-basic-offset: 4; indent-tabs-mode: nil -*- */

/**
 * Simple vertex shader for just showing the local view
 */

uniform mat4 modelViewProjectionMatrix;
attribute vec4 position;

attribute vec2 a_laserCoordinate;
varying vec2 v_laserCoordinate;

void main() {
    v_laserCoordinate = a_laserCoordinate;

    gl_Position = modelViewProjectionMatrix * position;
}
