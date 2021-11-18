///@description camera motion and camera shake
//camera follows the cam_t coords on a loose lerp

camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), global.camXT, 0.99) - camera_get_view_width(view_camera[0])/2, 
									lerp(camera_get_view_y(view_camera[0]), global.camYT, 0.99) - camera_get_view_height(view_camera[0])/2);

//camera shake
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + random_range(-1,1)*global.shakevar, camera_get_view_y(view_camera[0]) + random_range(-.25,.25)*global.shakevar);
//this controls camera position and shake; invoke it after we set camera position.
//as such, whenever we alter global.shakevar, we cause the screen to shake by THAT much
global.shakevar *= shakewane; 
if(global.shakevar <= 0.5) global.shakevar = 0;