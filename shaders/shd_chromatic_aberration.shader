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

//######################_==_YOYO_SHADER_MARKER_==_######################@~/*  shd_chromatic_aberration
 *  kindly shared by Daniel Linssen:
 *  http://ludumdare.com/compo/author/managore/
 *  an incredible source of inspiration.
 *  http://ludumdare.com/compo/ludum-dare-31/?action=preview&uid=3479
 */

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float intensity;

void main() {
    float r1 = 0.025 * intensity;
    float r2 = 2.0 * r1;
    float s1 = 1.0 - r2;
    float s2 = 1.0 - 2.0 * r2;
 
    float xx = v_vTexcoord.x;
    float yy = v_vTexcoord.y;

    vec3 newcoordx = vec3(xx, xx * s1 + r1, xx * s2 + r2);
    vec3 newcoordy = vec3(yy, yy * s1 + r1, yy * s2 + r2);

    gl_FragColor = vec4(0, 0, 0, 1);

    gl_FragColor.r = (v_vColour * texture2D(gm_BaseTexture, vec2(newcoordx.r, newcoordy.r))).r;
    gl_FragColor.g = (v_vColour * texture2D(gm_BaseTexture, vec2(newcoordx.g, newcoordy.g))).g;
    gl_FragColor.b = (v_vColour * texture2D(gm_BaseTexture, vec2(newcoordx.b, newcoordy.b))).b; 
}
