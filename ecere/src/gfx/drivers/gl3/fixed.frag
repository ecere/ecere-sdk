#version 150

uniform sampler2D diffuseTex;

in vec2 fTexCoord;
in vec4 fColor;

out vec4 fragColor;

void main(void)
{
   fragColor = fColor * texture(diffuseTex, fTexCoord);
}
