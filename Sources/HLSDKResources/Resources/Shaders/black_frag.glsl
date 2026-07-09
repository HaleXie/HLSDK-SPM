#version 300 es
/* -*- Mode: c; c-basic-offset: 4; indent-tabs-mode: nil -*- */

/**
 * Simple fragment shader for just showing all white
 */
precision mediump float;
out vec4 fragColor;
void main() {
    fragColor = vec4(0.0, 0.0, 0.0, 1.0);
}
