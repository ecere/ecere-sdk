#version 100

precision highp float;

uniform sampler2D diffuseTex;
uniform bool texturingOn;
uniform bool lightingOn;
uniform mat4 texture_matrix;
uniform bool matTwoSided;

/*
in vec2 fTexCoord;
in vec4 fColor;
in vec4 fColorBack;
*/

varying vec2 fTexCoord;
varying  vec4 fColor;
varying  vec4 fColorBack;

// out vec4 fragColor;

void main(void)
{
   vec4 c = (matTwoSided && lightingOn && !gl_FrontFacing) ? fColorBack : fColor;
   gl_FragColor = texturingOn ? c * texture2D(diffuseTex, (vec4(fTexCoord, 0, 1) * texture_matrix).xy) : c;
}
