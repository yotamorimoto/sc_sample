Sample {
	var buffers, <map;

	*new { |paths, arrows|
		^super.new.init(paths, arrows);
	}
	init { |paths, arrows|
		this.load(paths);
		this.associate(arrows);
	}
	load { |paths|
		buffers = paths.collect { |path|
            Buffer.readChannel(Server.default, path, channels: [0])
        };
	}
	free {
		buffers.do(_.free);
		map = nil;
	}
	associate { |arrows|
		// sample map
		map = ();
		arrows.do { |arrow, i|
			arrow.value.do { |note|
				// map to buffer & rate
				map.put(note, [buffers[i], midiratio(note - arrow.key)]);
			}
		}
	}
	nrtMsg {
		var msg = Array.newClear(buffers.size + 1);
		msg[0] = 0.0;
		buffers.do { |b,i| msg[i+1] = ["/b_allocReadChannel", b.bufnum, b.path, 0,-1, 0] };
		^msg
	}
}