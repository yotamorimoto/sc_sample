+ Sample {
	*felt {
        var lowest = 21;
		var transDown = 4;
		var transUp = 2;
		var next = lowest + transDown + transUp + 1;
        var highest = 98;
        var n = lowest.series(next, highest);
		var arrows = n.collect { |in|
			var v;
			v = in -> ((in - transDown)..(in + transUp));
			if(in == lowest,  { v = in -> (0..(in + transUp)) });
			if(in == highest, { v = in -> ((in - transDown)..127) });
			v
		};
		var path = thisMethod.filenameSymbol.asString.dirname;
		var paths = Array.fill(arrows.size, { |i| path +/+ i ++ ".wav" });
		arrows.printAll;
		^this.new(paths, arrows);
	}
}