// one loop segment
(
SynthDef(\oneLoop, { |out, bufnum, start, sus_time, rel_time=0.5, amp, rate = 1|

	//creates signal from playbuffer
	var sig = PlayBuf.ar(2, bufnum,
		rate: rate * BufRateScale.kr( bufnum),
		startPos: start, loop: 0
	),

	//creates envelope
	env = EnvGen.kr(Env.linen(0.01, sus_time, rel_time, level: amp),
		doneAction: Done.freeSelf);

	//writes signal to audio bus
	Out.ar(out, ((sig ! 2) * env).dup);

}).add;

//EXAMPLE
b = Array.new(1);
b.add(Buffer.read(s, ~curpath++"/samples/chime.wav"));
//b.add(Buffer.read(s, ~curpath++"/samples/Amen Sliced-bounce-64.wav"));

//b = Buffer.read(s, ~curpath++"/samples/chime2.wav");
//b = Buffer.read(s, ~curpath++"/samples/chime2.wav");

~listlen = 0;
b.do{var i=0;~listlen=~listlen+1};
~listlen.postln;


Pbind(
		\instrument,\oneLoop,
	    \bufnum,b,
		\amp,1,
		\dur, 1,
		\sus_time, 1,
		\rel_time, 1,
		\rate, 1
).play();

)

(
Buffer.freeAll;
)