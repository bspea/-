
function profileImageGet(value) {
	if (value.profileImage == null) {
		if (value.gender == 'M')
			return getContext() + "/resources/image/jong/noImageM.jpg";
		else
			return getContext() + "/resources/image/jong/noImageF.jpg";
	} else {
		return value.profileImage;
	}
}