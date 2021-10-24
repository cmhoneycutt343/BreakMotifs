(
~scorepart1 = {
	//set seed


	~seeddistrib.value(410);

	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1);
	~leng.wait;
	~leng = ~pitchroll.value(~x2, eventdur:0.25);
	~leng.wait;
	~leng = ~pitchroll.value(~x5, rampdir:"up",stepsin:4,eventdur:0.25,reltime:0.01,notedur:0.1);
	~leng.wait;
	~leng = ~pitchroll.value(~x1, rampdir:"down", notedur:0.1);
	~leng.wait;

	~seeddistrib.value(225);
	~leng = ~run.value(~x0,~x1,~x2,~x3, eventdur:0.5, notedur:0.1);
	~leng.wait;
	~leng = ~run.value(~x0,~x0,~x0,~x0, eventdur:0.25, notedur:0.1,noteamp:3);
	~leng.wait;
	~leng = ~run.value(~x1,~x1,~x3,~x3, eventdur:0.25, notedur:0.1);
	~leng.wait;

	"meas 2".postln;
	~seeddistrib.value(573);
	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1);
	~leng.wait;
	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1);
	~leng.wait;
	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1,stpindex:0);
	~leng.wait;
	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1,stpindex:0,eventdur:0.25);
	~leng.wait;
	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1,stpindex:0,eventdur:0.25);
	~leng.wait;

	"meas 3".postln;
	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1);
	~leng.wait;
	~seeddistrib.value(441);
	~leng = ~run.value(~x0,~x1,~x2,~x3, eventdur:0.25, notedur:0.1,noteamp:1);
	~leng.wait;
	~seeddistrib.value(588);
	~leng = ~run.value(~x0,~x1,~x2,~x3, eventdur:0.25, notedur:0.1,noteamp:1);
	~leng.wait;
	~seeddistrib.value(432);
	~leng = ~run.value(~x0,~x1, eventdur:0.25, notedur:0.1, stpindex:1,noteamp:1);
	~leng.wait;

	//makes it loop?
	~scorepart1.fork;

}
)