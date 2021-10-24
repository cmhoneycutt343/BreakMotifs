q = 2

q[0].isNil

/*	if (q[0].isNil,
		{~durIn = 0.5},
		{~durIn = q[0]}
	);*/


//example of getting middle 'chunk of array'
(
~firstindex = 3;
~lastindex = 7;

~myarr = [1,2,3,4,5,6,5,4,3,2,1];
~myarr2= Array.new(maxSize:~myarr.size);

~myarr.postln;
~myarr.do({arg item, count; if((count>=~firstindex)&&(count<=~lastindex)){~myarr2.add(count)}});
~myarr2.postln;
~myarr=~myarr2;
)

(
~firstindex = 3;
~lastindex = 7;

~myarr = [1,2,3,4,5,6,5,4,3,2,1];
~myarr = ~myarr[~firstindex..~lastindex];
)

(
//thisThread.randSeed = 19;
2.rand;
)

(5..3)

~mystring = "down"

if (~mystring == "up",
{"is up".postln;},
{"is not up".postln;}
)





Env.linen(0.01, 0.01, 0.01, level: 1).plot



(
b = ~buf1[0];
x = { |envbuf = -1|
    var pointer, pitch;
    // pointer - move from beginning to end of soundfile over 15 seconds
    //pointer = LFSaw.ar(1/15).range(0, 1);
    // control pitch with MouseX
    Warp1.ar(
        numChannels:1,
        bufnum:b,
        freqScale:1,
        windowSize:0.5,
        envbufnum:envbuf,
        overlaps:1,
        windowRandRatio:1,
        interp:1
    )
}.play

)






~bitwigOSC = NetAddr.new("127.0.0.1", 8000);

~bitwigOSC.sendMsg("/tempo/raw", 120);
~bitwigOSC.sendMsg("/play", 1);
~bitwigOSC.sendMsg("/play", 0);





