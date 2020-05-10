//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~/* shd_motion_blur
 * All thanks to Xor who provided this amazing motion blur shader:
 * http://xorshaders.weebly.com/tutorials/blur-shaders-5-part-2
 */

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 origin;//x,y
const int quality = 16;

void main()
{
    vec4 colour;
    for (float i = 0.0; i < 1.0; i += 1.0 / float(quality)) {
        colour += texture2D(gm_BaseTexture, v_vTexcoord + (0.5 - origin) * (i / 8.0));
    }
    colour /= float(quality);
    gl_FragColor =  colour * v_vColour;
}
