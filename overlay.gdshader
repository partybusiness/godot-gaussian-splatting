shader_type spatial;
render_mode unshaded;

uniform sampler2D left_texture:source_color, repeat_disable;
uniform sampler2D right_texture:source_color, repeat_disable;

void vertex() {
	POSITION = vec4(UV * 2.0 -vec2(1.0), 1.0, 1.0); // make full screen
}

void fragment() {
	vec4 sample;
	if (VIEW_INDEX == 0)
		sample = texture(left_texture, 1.0 - UV);
	else
		sample = texture(right_texture, UV);
	ALBEDO = sample.rgb;
	ALPHA = sample.a;
}
