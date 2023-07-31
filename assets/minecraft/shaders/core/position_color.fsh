#version 150

in vec4 vertexColor;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) {
        discard;
    }

    /* checks for hover colours */
    if (color.r == 255/255.0 && color.g == 255/255.0 && color.b == 255/255.0 && color.a == 128/255.0) {
        color = vec4(0.3882, 0.8157, 0.6588, color.a); /* < < Your colour goes here (#4e315e)*/
    }

    /* checks for loading screen colours */
    if (color.r == 239.0/255.0 && color.g == 50.0/255.0 && color.b == 61.0/255.0) {
        color = vec4(0.098, 0.098, 0.098, color.a); /* < < Your custom colour goes here (#372C32)*/
    }
    
    /* checks for border colours */
    if (color.r >= 0.15686 && color.r <= 0.31373 && color.g == 0 && color.b >= 0.49 && color.b <= 1) {
    color = vec4(0.2157, 0.2157, 0.2157, 1); /* < < Your custom colour goes here*/
    }

    fragColor = color * ColorModulator;
}
