function bounds_changeTo(_tgtx1, _tgty1, _tgtx2, _tgty2, _timeframe){
	//only use this function with the battle manager or something that invokes battlebounds
	BBx1_diff = _tgtx1 - BB_x1;
	BBy1_diff = _tgty1 - BB_y1;
	BBx2_diff = _tgtx2 - BB_x2;
	BBy2_diff = _tgty2 - BB_y2;
	alarm[2] = _timeframe;
}