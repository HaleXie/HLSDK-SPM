/**
 * Simple vertex shader for just showing the local view
 */
uniform mat4 u_ProjectionMatrix;
uniform mat4 u_ViewMatrix;
uniform mat4 u_ModelMatrix;
uniform mat4 u_TransformationMatrix;
attribute vec4 a_Position;

void main() {
    //see this page for details: http://www.songho.ca/opengl/gl_transform.html
    vec4 clip0 = u_ProjectionMatrix * u_ViewMatrix * u_ModelMatrix * a_Position;
    vec4 ndc0 = vec4(clip0.x / clip0.w, clip0.y / clip0.w, clip0.z / clip0.w, 1.0);
    
    vec4 ndc1 = u_TransformationMatrix * ndc0;
    vec4 clip1 = ndc1 * clip0.w;
    gl_Position = clip1;
}
