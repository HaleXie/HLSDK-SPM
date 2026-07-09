#version 300 es
/* -*- Mode: c; c-basic-offset: 4; indent-tabs-mode: nil -*- */

/**
 * Simple vertex shader for just showing white
 */

uniform mat4 modelViewProjectionMatrix;
in vec4 position;

void main() {
    gl_Position = modelViewProjectionMatrix * position;
}
