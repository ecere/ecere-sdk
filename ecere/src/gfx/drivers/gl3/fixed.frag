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
varying vec3 fSpec;
varying vec3 fSpecBack;

void main(void)
{
   vec4 c;
   if(lightingOn)
   {
      vec3 specSrc = (matTwoSided && !gl_FrontFacing) ? fSpecBack : fSpec;
      vec4 colrSrc = (matTwoSided && !gl_FrontFacing) ? fColorBack : fColor;
      vec3 d1 = dFdx(specSrc), d2 = dFdy(specSrc);
      float b = max(dot(d1, d1), dot(d2, d2));
      vec3 s = (b > 0.9) ? vec3(0) : specSrc / (1.0 + b);
      c = vec4(min(vec3(1.0), colrSrc.xyz + s), colrSrc.w);
   }
   else
      c = fColor;
   vec4 texel = texture2D(diffuseTex, (vec4(fTexCoord, 0, 1) * texture_matrix).xy);
   if(swizzleMode != 0) texel = (swizzleMode == 1) ? vec4(1,1,1,texel.a) : vec4(1,1,1,texel.r);
   gl_FragColor = texturingOn ? c * texel : c;
}
