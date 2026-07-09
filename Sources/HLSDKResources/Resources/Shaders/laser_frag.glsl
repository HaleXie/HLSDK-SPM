/* -*- Mode: c; c-basic-offset: 4; indent-tabs-mode: nil -*- */

/**
 * Simple fragment shader for just showing the local view
 *  which is a YUV in NV12 format
 */
precision mediump float;

uniform sampler2D s_laser;
uniform vec3 color;

varying vec2 v_laserCoordinate;

void main() {
    vec4 img = texture2D(s_laser, v_laserCoordinate);
    vec3 c = color + img.rgb;
    /* alpha is pre-multiplied in, due to blending,
       factor it back out */
    gl_FragColor = vec4(c / img.a, img.a);
}
