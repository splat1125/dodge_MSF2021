function afterimage_create(_xx, _yy, _lifetime, _sprite_index, _image_index, _image_angle){
		var aftimg = instance_create_depth(_xx, _yy, depth + 1, obj_afterimage);
		aftimg.lifetime = _lifetime;
		aftimg.sprite_index = _sprite_index;
		aftimg.image_index = _image_index;
		aftimg.image_angle = _image_angle;
}