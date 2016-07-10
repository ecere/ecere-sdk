#version 100

precision highp float;

uniform sampler2D diffuseTex;
uniform bool texturingOn;
uniform bool lightingOn;
uniform mat4 texture_matrix;
uniform bool matTwoSided;
uniform int swizzleMode; // 0: off   1: alpha     2: red

varying vec2 fTexCoord;
varying vec4 fColor;
varying vec4 fColorBack;

void main(void)
{
   vec4 c = (lightingOn && matTwoSided && !gl_FrontFacing) ? fColorBack : fColor;
   vec4 texel = texture2D(diffuseTex, (vec4(fTexCoord, 0, 1) * texture_matrix).xy);
   if(swizzleMode != 0) texel = (swizzleMode == 1) ? vec4(1,1,1,texel.a) : vec4(1,1,1,texel.r);
   gl_FragColor = texturingOn ? c * texel : c;
}
