
+ Sample {
	*celesta {
		var arrows = [
			66 -> (0..57),
			78 -> (58..67),
			80 -> (68..78),
			84 -> (79..127)
		];
		var path = PathName(thisMethod.filenameSymbol.asString).pathOnly;
		var paths = Array.fill(arrows.size, { |i| path +/+ i ++ ".wav"});
		^this.new(paths, arrows);
	}
}