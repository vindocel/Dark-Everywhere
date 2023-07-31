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

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }

    if((color.r < 66/255.0 && color.r > 63/255.0) && (color.g < 66/255.0 && color.g > 63/255.0) && (color.b < 66/255.0 && color.b > 63/255.0)){
        color = vec4(0.6588, 0.6588, 0.6588, color.a);
    }

    if(color.r < 42/255.0 && color.r > 40/255.0 && color.g < 42/255.0 && color.g > 40/255.0 && color.b < 42/255.0 && color.b > 40/255.0){
        color = vec4(0.1059, 0.1059, 0.1059, color.a);
    }

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
