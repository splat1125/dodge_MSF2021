if(battleBoundsActive && !transitionPhase)
{
	if(_player.bbox_left <= BB_x1)
	{
		_player.x += BB_x1 - _player.bbox_left;
	}
	if(_player.bbox_right >= BB_x2)
	{
		_player.x -= _player.bbox_right - BB_x2;
	}
	if(_player.bbox_top <= BB_y1)
	{
		_player.y += BB_y1 - _player.bbox_top;
	}
	if(_player.bbox_bottom >= BB_y2)
	{
		_player.y -= _player.bbox_bottom - BB_y2;
	}
}