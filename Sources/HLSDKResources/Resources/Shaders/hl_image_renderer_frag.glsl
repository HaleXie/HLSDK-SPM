#version 300 es
#extension GL_EXT_shader_framebuffer_fetch : require

precision mediump float;

/*#hl_include<<blend_pixels.glsl>>*/

/*#hl_include<<convert_yuv_rgb.glsl>>*/

/*#hl_include<<hl_image_renderer_config.glsl>>*/

in vec2 v_Texture0Coordinate;
in vec2 v_Texture1Coordinate;
in vec2 v_Texture2Coordinate;
in vec2 v_TaskFieldCoordinate;

uniform sampler2D s_Texture0;
uniform sampler2D s_Texture1;
uniform sampler2D s_Texture2;
uniform vec4 u_TaskFieldTextureRect;
uniform vec4 u_MergeSourceTextureRect;

inout vec4 fragColor;

void main() {
    vec3 rgb = vec3(0.0, 0.0, 0.0);
    bool isValidFragment = false;
    
    if (u_Blending == HLBlendingBackgroundMask) {
        vec2 tfTexCoord0 = u_TaskFieldTextureRect.xy;
        vec2 tfTexCoord1 = u_TaskFieldTextureRect.zw;
        vec2 msTexCoord0 = u_MergeSourceTextureRect.xy;
        vec2 msTexCoord1 = u_MergeSourceTextureRect.zw;
        if (v_TaskFieldCoordinate.s > min (tfTexCoord0.x, tfTexCoord1.x)
            && v_TaskFieldCoordinate.s < max (tfTexCoord0.x, tfTexCoord1.x)
            && v_TaskFieldCoordinate.t > min (tfTexCoord0.y, tfTexCoord1.y)
            && v_TaskFieldCoordinate.t < max (tfTexCoord0.y, tfTexCoord1.y)
            && v_Texture0Coordinate.s > min (msTexCoord0.x, msTexCoord1.x)
            && v_Texture0Coordinate.s < max (msTexCoord0.x, msTexCoord1.x)
            && v_Texture0Coordinate.t > min (msTexCoord0.y, msTexCoord1.y)
            && v_Texture0Coordinate.t < max (msTexCoord0.y, msTexCoord1.y)) {
            isValidFragment = true;
        }
    } else {
        isValidFragment = true;
    }

    if (isValidFragment) {
        if (u_ImageFormat == HLImageFormatBGRA) {
            if (v_Texture0Coordinate.s > 0.0 && v_Texture0Coordinate.s < 1.0 && v_Texture0Coordinate.t > 0.0 && v_Texture0Coordinate.t < 1.0) {
                rgb = texture(s_Texture0, v_Texture0Coordinate).bgr;
            }
        } else if (u_ImageFormat == HLImageFormatNV12Video) {
            if (v_Texture0Coordinate.s > 0.0 && v_Texture0Coordinate.s < 1.0 && v_Texture0Coordinate.t > 0.0 && v_Texture0Coordinate.t < 1.0) {
                float y = texture(s_Texture0, v_Texture0Coordinate).r;
                vec2 uv = texture(s_Texture1, v_Texture1Coordinate).ra;
                rgb = hl_ConvertYUV2RGB_VideoRange(vec3(y, uv));
            }
        } else if (u_ImageFormat == HLImageFormatNV12Full) {
            if (v_Texture0Coordinate.s > 0.0 && v_Texture0Coordinate.s < 1.0 && v_Texture0Coordinate.t > 0.0 && v_Texture0Coordinate.t < 1.0) {
                float y = texture(s_Texture0, v_Texture0Coordinate).r;
                vec2 uv = texture(s_Texture1, v_Texture1Coordinate).ra;
                rgb = hl_ConvertYUV2RGB_FullRange(vec3(y, uv));
            }
        } else if (u_ImageFormat == HLImageFormatI420) {
            if (v_Texture0Coordinate.s > 0.0 && v_Texture0Coordinate.s < 1.0 && v_Texture0Coordinate.t > 0.0 && v_Texture0Coordinate.t < 1.0) {
                float y = texture(s_Texture0, v_Texture0Coordinate).r;
                float u = texture(s_Texture1, v_Texture1Coordinate).r;
                float v = texture(s_Texture2, v_Texture2Coordinate).r;
                rgb = hl_ConvertYUV2RGB_VideoRange(vec3(y, u, v));
            }
        }
        if (u_Blending == HLBlendingStandard) {
            rgb = hl_BlendPixels_Standard(rgb, fragColor.rgb);
        } else if (u_Blending == HLBlendingBackgroundMask) {
            rgb = hl_BlendPixels_BackgroundMask(fragColor.rgb, rgb);
        }
    }

    fragColor = vec4(rgb, 1.0);
}
