
+ Sample {
	*celesta {
		var n = Array.series(7,65,7);
		var arrows = n.collect({ |in|
			var v;
			v = in -> ((in-4)..(in+2));
			if(in==65,  { v=65 ->(0..67) });
			if(in==107, { v=107->(103..128) });
			v
		});
		var path = PathName(thisMethod.filenameSymbol.asString).pathOnly;
		var paths = Array.fill(arrows.size, { |i| path +/+ i ++ ".wav"});
		^this.new(paths, arrows);
	}
}