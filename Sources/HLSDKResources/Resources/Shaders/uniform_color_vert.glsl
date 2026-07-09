/* -*- Mode: c; c-basic-offset: 4; indent-tabs-mode: nil -*- */

uniform mat4 modelViewProjectionMatrix;
attribute vec4 position;

void main() {
    gl_Position = modelViewProjectionMatrix * position;
}
