
s.boot;
x=Sample.test;
x=Sample.harp0(true);
x=Sample.plate(true);
x.map[52];
x=Sample.strings(true);
x=Sample.felt(true);

x.free;

MIDIFunc.trace;
~mod.get

x = Sample.felt;
b = Pcb((1.0!100).rand2,0.5,0.1).asStream;
(
SynthDef(\samplay, { |gate=1, buf, rate=1, amp=1|
	var sig, env, map;
	sig = PlayBuf.ar(1, buf, rate);
	env = Env.linen(0,0,1).kr(2);
	// env = Env.sine(2).kr(2);
	sig = LinPan2.ar(sig, Rand(-1,1), env);
	Out.ar(0, sig);
}).add;
// SynthDef(\samplay, { |gate=1, buf, rate, amp=1|
// 	var sig, env, trig, dur, gRate, pos, ipol, pan;
// 	ipol = 1;
// 	trig = Impulse.kr(20);
// 	dur = 1;
// 	gRate = TChoose.kr(trig, [rate,rate.neg,rate*2,rate*1.5,rate*1.5.neg,rate*0.5]);
// 	pos = TExpRand.kr(0.01, 0.4, trig);
// 	pan = TRand.kr(-1, 1, trig);
// 	sig = GrainBuf.ar(2, trig, dur, buf, gRate, pos, ipol, pan, -1);
// 	env = Env.linen(0,0,1).kr(2);
// 	sig = sig * amp * env;
// 	Out.ar(0, sig);
// }).add;

)
x.map.printAll;
Convolution2
a = Scale.melodicMinor;
a = Scale.ionian;
a = Scale.phrygian;
a = Scale.dorian;
b = Pcb((1.0!50).rand2,0.5,1.01).asStream;
b = Pcml((1.0!50).rand2,1.6,0.3).asStream;
12.keyToDegree(a);
12.degreeToKey(a);
-13%7
14/7
a.degrees.wrapAt(-14)
-14/7
(
Routine {
	var map = x.map;
	loop {
		var brown = b.next;
		var key = a.degrees[(brown[0].linlin(-1,1,0,6)).asInt];
		brown.postln;
		Synth.grain(\samplay, [buf:map[key+60][0], rate:map[key+60][1], amp: brown[1].linlin(-1,1,-24,0).dbamp]);
		key = a.degrees[(brown[2].linlin(-1,1,0,6)).asInt];
		Synth.grain(\samplay, [buf:map[key+48][0], rate:map[key+48][1], amp: brown[3].linlin(-1,1,-24,0).dbamp]);
		key = a.degrees[(brown[4].linlin(-1,1,0,6)).asInt];
		Synth.grain(\samplay, [buf:map[key+72][0], rate:map[key+72][1], amp: brown[5].linlin(-1,1,-24,0).dbamp]);
		1.5.wait;
	}
}.play;
)