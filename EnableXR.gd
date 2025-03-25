extends XROrigin3D

func _ready()->void:
	get_viewport().use_xr = true;
	return
	var xr_interface: XRInterface = XRServer.find_interface("OpenXR")
	
	
	if xr_interface and xr_interface.is_initialized():
		var acceptable_modes = [XRInterface.XR_ENV_BLEND_MODE_OPAQUE, XRInterface.XR_ENV_BLEND_MODE_ADDITIVE]
		var modes = xr_interface.get_supported_environment_blend_modes()
		for mode in acceptable_modes:
			if mode in modes:
				xr_interface.set_environment_blend_mode(mode)
				break
