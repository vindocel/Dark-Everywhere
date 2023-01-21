#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

vec4 textColor = vec4(0.66, 0.66, 0.66, 1.0);
vec4 shadowColor = vec4(0, 0, 0, 0.8);

void main() {
    vec4 color = texture(Sampler0, texCoord0).rrrr * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
	
	if (vertexDistance > 800.0
        && color.r > 0.2479 && color.r < 0.2481
        && color.g > 0.2479 && color.g < 0.2481
        && color.b > 0.2479 && color.b < 0.2481) {
        color = textColor + shadowColor * 0.1;
    }
	
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}

//by Vindocel