#version 150

uniform sampler2D diffuseTex;
uniform bool texturingOn;
uniform mat4 texture_matrix;

in vec2 fTexCoord;
in vec4 fColor;

out vec4 fragColor;

void main(void)
{
   fragColor = texturingOn ? fColor * texture(diffuseTex, (vec4(fTexCoord, 0, 1) * texture_matrix).xy) : fColor;
}
