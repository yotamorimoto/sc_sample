+ Sample {
	*celesta {
        var lowest = 65;
        var next = lowest + 7;
        var highest = 107;
        var n = lowest.series(next, highest);
		var arrows = n.collect { |in|
			var v;
			v = in -> ((in-4)..(in+2));
			if(in == lowest,  { v = in -> (0..(in+2)) });
			if(in == highest, { v = in -> ((in-4)..128) });
			v
		};
		var path = thisMethod.filenameSymbol.asString.dirname;
		var paths = Array.fill(arrows.size, { |i| path +/+ i ++ ".wav" });
		^this.new(paths, arrows);
	}
}