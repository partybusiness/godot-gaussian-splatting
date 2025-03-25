shader_type spatial;
render_mode unshaded;

uniform sampler2D display_texture:source_color, repeat_disable;

void vertex() {
	POSITION = vec4(UV * 2.0 -vec2(1.0), 1.0, 1.0); // make full screen
}

void fragment() {
	vec4 sample = texture(display_texture, UV);
	ALBEDO = sample.rgb;
	ALPHA = sample.a;
}
