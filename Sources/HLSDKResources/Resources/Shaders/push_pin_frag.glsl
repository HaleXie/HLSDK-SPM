/**
 * Simple fragment shader
 */
precision mediump float;

uniform vec3 u_Color;
uniform sampler2D s_Icon;
varying vec2 v_IconCoordinate;
void main() {
//    vec4 rgb = vec4(0.0, 1.0, 0.0, 0.0);
//
//    /* icon image */
    if (v_IconCoordinate.s > 0.0 && v_IconCoordinate.s < 1.0 && v_IconCoordinate.t > 0.0 && v_IconCoordinate.t < 1.0) {
        vec4 point = texture2D(s_Icon, v_IconCoordinate);
        gl_FragColor = vec4(u_Color, point.r);
        return;
    }
    gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
}
