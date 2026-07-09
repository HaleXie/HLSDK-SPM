
#version 300 es

/*#hl_include<<hl_image_renderer_config.glsl>>*/

uniform mat4 modelViewProjectionMatrix;
uniform mat4 u_Texture0Matrix;
uniform mat4 u_Texture1Matrix;
uniform mat4 u_Texture2Matrix;

in vec4 position;
in vec2 a_Texture0Coordinate;
in vec2 a_Texture1Coordinate;
in vec2 a_Texture2Coordinate;

out vec2 v_Texture0Coordinate;
out vec2 v_Texture1Coordinate;
out vec2 v_Texture2Coordinate;

uniform mat4 u_TaskFieldMatrix;
in vec2 a_TaskFieldCoordinate;
out vec2 v_TaskFieldCoordinate;

void main() {
    if (u_ImageFormat == HLImageFormatBGRA) {
        v_Texture0Coordinate = (u_Texture0Matrix * vec4(a_Texture0Coordinate, 0.0, 1.0)).xy;
    } else if (u_ImageFormat == HLImageFormatNV12Video || u_ImageFormat == HLImageFormatNV12Full) {
        v_Texture0Coordinate = (u_Texture0Matrix * vec4(a_Texture0Coordinate, 0.0, 1.0)).xy;
        v_Texture1Coordinate = (u_Texture1Matrix * vec4(a_Texture1Coordinate, 0.0, 1.0)).xy;
    } else if (u_ImageFormat == HLImageFormatI420) {
        v_Texture0Coordinate = (u_Texture0Matrix * vec4(a_Texture0Coordinate, 0.0, 1.0)).xy;
        v_Texture1Coordinate = (u_Texture1Matrix * vec4(a_Texture1Coordinate, 0.0, 1.0)).xy;
        v_Texture2Coordinate = (u_Texture2Matrix * vec4(a_Texture2Coordinate, 0.0, 1.0)).xy;
    }
    
    if (u_Blending == HLBlendingBackgroundMask) {
        v_TaskFieldCoordinate = (u_TaskFieldMatrix * vec4(a_TaskFieldCoordinate, 0.0, 1.0)).xy;
    }
    
    gl_Position = modelViewProjectionMatrix * position;
}
