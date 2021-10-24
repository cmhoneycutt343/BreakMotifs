// one loop segment
(
SynthDef(\oneLoop, { |out, bufnum, start, sus_time, rel_time=0.5, amp, rate = 1|
	var sig = PlayBuf.ar(1, bufnum,
		rate: rate * BufRateScale.kr(bufnum),
		startPos: start, loop: 0
	),
	env = EnvGen.kr(Env.linen(0.01, sus_time, rel_time, level: amp),
		doneAction: Done.freeSelf);
	Out.ar(out, (sig * env).dup);
}).add;
)
