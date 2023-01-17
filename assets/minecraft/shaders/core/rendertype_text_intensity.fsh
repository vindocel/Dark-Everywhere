#version 150

uniform sampler2D Sampler0;
uniform vec4 ColorModulator;

in vec2 texCoord0;
in vec4 vertexColor;
in vec3 vertexPosition;

out vec4 fragColor;

vec4 textColor = vec4(0.66, 0.66, 0.66, 1.0);
vec4 shadowColor = vec4(0, 0, 0, 0.8);

void main() {
    vec4 color = texture(Sampler0, texCoord0).rrrr * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    float distance = distance(vertexPosition, vec3(800.0));
    if (distance > 900.0
        && color.r > 0.2479 && color.r < 0.2481
        && color.g > 0.2479 && color.g < 0.2481
        && color.b > 0.2479 && color.b < 0.2481) {
        fragColor = textColor + shadowColor * 0.1;
    } else {
        fragColor = color;
    }
}