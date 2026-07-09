
const mat4 yuv_video_range_to_rgb_matrix = mat4(+1.1643,     +1.1643,     +1.1643,     +0.0000,
                                                +0.0000,     -0.39173,    +2.017,      +0.0000,
                                                +1.5958,     -0.81290,    +0.0000,     +0.0000,
                                                -0.87066875, +0.52954625, -1.08126875, +1.0000);
/**
 * convert a yuv to rgb
 * http://www.fourcc.org/source/YUV420P-OpenGL-GLSLang.c
 */
vec3 hl_ConvertYUV2RGB_VideoRange (vec3 yuv) {
//    float y = 1.1643 * (yuv.r - 0.0625);
//    float u = yuv.g - 0.5;
//    float v = yuv.b - 0.5;
//    return vec3(y + 1.5958 * v, y - 0.39173 * u - 0.81290 * v, y + 2.017 * u);
    return (yuv_video_range_to_rgb_matrix * vec4(yuv, 1.0)).rgb;
}

const mat4 yuv_full_range_to_rgb_matrix = mat4(+1.0,        +1.0,        +1.0,        +0.0000,
                                               +0.0000,     -0.34414,    +1.772,      +0.0000,
                                               +1.402,      -0.71414,    +0.0000,     +0.0000,
                                               -0.701,      +0.52914,    -0.886,      +1.0000);
// https://en.wikipedia.org/wiki/YCbCr
vec3 hl_ConvertYUV2RGB_FullRange (vec3 yuv) {
//    float r = y + 1.402f * (cr - 128);
//    float g = y - 0.34414f * (cb - 128) - 0.71414f * (cr - 128);
//    float b = y + 1.772f * (cb - 128);
    return (yuv_full_range_to_rgb_matrix * vec4(yuv, 1.0)).rgb;
}

