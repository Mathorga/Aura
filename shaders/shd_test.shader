attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition; // <- added
//
void main() {
   v_vPosition = in_Position; // <- added
   gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]
       * vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
   v_vColour = in_Colour;
   v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition; // <- added
//
void main() {
   // (v_vPosition will contain XYZ of the current pixel)
   vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
   col.a *= float(mod(v_vPosition.y, 10.0) < 5.0); // make every other stripe transparent, for example
   gl_FragColor = col;
}
