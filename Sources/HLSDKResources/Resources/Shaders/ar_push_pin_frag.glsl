/**
 * Simple fragment shader
 */
precision mediump float;

varying vec3 v_Normal;
varying vec3 v_FragPos;

uniform float u_AmbientCoefficient;   // Ambient reflection coefficient
uniform float u_DiffuseCoefficient;   // Diffuse reflection coefficient
uniform float u_SpecularCoefficient;   // Specular reflection coefficient
uniform float u_Shininess; // Shininess

uniform vec3 u_AmbientColor;
uniform vec3 u_SpecularColor;
uniform vec3 u_ObjectColor;

uniform vec3 u_LightPos;
uniform vec3 u_ViewPos;

void main() {
    // ambient
    vec3 ambient = u_AmbientCoefficient * u_AmbientColor;
      
    // diffuse
    vec3 norm = normalize(v_Normal);
    vec3 lightDir = normalize(u_LightPos - v_FragPos);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = u_DiffuseCoefficient * diff * u_ObjectColor;
    
    // specular
    vec3 viewDir = normalize(u_ViewPos - v_FragPos);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), u_Shininess);
    vec3 specular = u_SpecularCoefficient * spec * u_SpecularColor;
        
    vec3 result = ambient + diffuse + specular;
    
    gl_FragColor = vec4(result, 1.0);
}
