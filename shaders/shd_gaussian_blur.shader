//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
// Pixel position.
varying vec3 v_vPosition;

void main()
{
    v_vPosition = in_Position;
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;

uniform vec2 screenSize;
uniform vec2 center;

const int Quality = 6;
const int Directions = 6;
// pi * 2.
const float Pi = 6.28318530718;
// The radius is in percentage from the center of the screen.
const float Radius = 0.6;
const float MinRadius = 0.2;
const float MaxRadius = 0.7;
const float MaxBlur = 6.0;

void main()
{
    vec3 size = vec3(512, 512, MaxBlur);
    
    // Compute distance between the current pixel and the blur center.
    float dist = distance(v_vPosition.xy, center.xy);
    
    if (dist > ((screenSize.x / 2.0) * MaxRadius)) {
        size.z = MaxBlur;
    } else if (dist < ((screenSize.x / 2.0) * MinRadius)) {
        size.z = 0.0;
    } else {
        size.z = MaxBlur * ((dist - (MinRadius * (screenSize.x / 2.0))) / (MaxRadius * (screenSize.x / 2.0)));
    }
    
    vec2 radius = size.z / size.xy;
    vec4 Color = texture2D(gm_BaseTexture, v_vTexcoord);
    for (float d = 0.0; d < Pi; d += Pi / float(Directions)) {
        for (float i = 1.0 / float(Quality); i <= 1.0; i += 1.0 / float(Quality)) {
                Color += texture2D(gm_BaseTexture, v_vTexcoord + vec2(cos(d), sin(d)) * radius * i);
        }
    }
    Color /= float(Quality) * float(Directions) + 1.0;
    gl_FragColor =  Color * v_vColour;
}
