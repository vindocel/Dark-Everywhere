#version 150

uniform sampler2D Sampler0;
uniform vec4 ColorModulator;

in vec3 vertexPosition;
in vec4 vertexColor;
in vec2 texCoord0;
in float vertexDistance;

out vec4 fragColor;

vec4 textColor = vec4(0.66, 0.66, 0.66, 1.0);
vec4 shadowColor = vec4(0, 0, 0, 0.8);
const float DGColor = 0.2479;
const float DG2Color = 0.2481;

void main() {
    vec4 color = texture(Sampler0, texCoord0).rrrr * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    
    if (vertexDistance > 800.0) {
        if (color.r > DGColor && color.r < DG2Color
            && color.g > DGColor && color.g < DG2Color
            && color.b > DGColor && color.b < DG2Color) {
            fragColor = textColor + shadowColor * 0.1;
        } else {
            fragColor = color;
        }
    }
}
//by Vindocel