/**
 * Simple vertex shader for just showing the local view
 */
uniform mat4 u_ProjectionMatrix;
uniform mat4 u_ViewMatrix;
uniform mat4 u_ModelMatrix;
uniform mat4 u_NormalMatrix;
uniform mat4 u_TransformationMatrix;
attribute vec3 a_Position;
attribute vec3 a_Normal;
varying vec3 v_Normal;
varying vec3 v_FragPos;

void main() {
    //see this page for details: http://www.songho.ca/opengl/gl_transform.html
    vec4 clip0 = u_ProjectionMatrix * u_ViewMatrix * u_ModelMatrix * vec4(a_Position, 1.0);
    vec4 ndc0 = vec4(clip0.x / clip0.w, clip0.y / clip0.w, clip0.z / clip0.w, 1.0);
    
    vec4 ndc1 = u_TransformationMatrix * ndc0;
    vec4 clip1 = ndc1 * clip0.w;
    gl_Position = clip1;
    
    
    // phong shading source
    // see http://www.cs.toronto.edu/~jacobson/phong-demo/
    // see https://learnopengl.com/Lighting/Basic-Lighting
    // There is a bug in jacobson's implementation. We should use the model matrix to calculate the normal matrix, instead of the view model matrix
    // The camera position and direction is fixed in jacobson's implementation. So the view matrix doesn't cause any problem in the demo
    
    v_FragPos = vec3(u_ModelMatrix * vec4(a_Position, 1.0));
    v_Normal = vec3(u_NormalMatrix * vec4(a_Normal, 0.0));
    
}
