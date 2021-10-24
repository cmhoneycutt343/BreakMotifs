(
/*---CAGE---*/
/*creates '/_-_-' type*/
~cage = {arg
	indexa=1, //index of sample 1
	indexb=0, //index of sample 2
	indexc=3, //index of sample 3
	notedur=1, //note env 'hold'
	reltime=0.05, // note env 'release'
	eventdur=0.5, //scale of time between note events
	strindex=0, //index of first sound to include
	stpindex=4; //index of last sound to include
	(
		~metaKick = ~buf1[indexa];
		~metaRoll1 = ~buf1[indexb];
		~metaRoll2 = ~buf1[indexc];

		~classrate = 2;

		~cagearray = [eventdur,eventdur/2,eventdur/2,eventdur/2,eventdur/2];
		~cagearray = ~cagearray[strindex..stpindex];

		~bufferarray = [~metaKick,~metaRoll1,~metaRoll2,~metaRoll1,~metaRoll2];
		~bufferarray = ~bufferarray[strindex..stpindex];

		Pbind(
			\instrument,
			\oneLoop,
			\bufnum, Pseq(~bufferarray, inf),
			\amp,1,
			\dur, Pseq(~cagearray, 1),
			\sus_time, notedur,
			\rel_time, reltime,
			\rate, Pfunc { ~classrate },
			\legato, 1

		).play();

		~motifleng = 0;
		~cagearray.do({arg item; ~motifleng=~motifleng+item});
		~motifleng;

)};

//ex
/*~cage.value(1,0,3);*/

/*---ROLL---*/
//creates roll
~pitchroll = {arg
	index=0, //index of sample
	eventdur=0.5, //scale of time between note events
	notedur=1, //note env 'hold'
	reltime=0.05,// note env 'release'
	stepsin = 2, //number of steps
	rampdir="down", //direction of run
	repeats=1; //number of repeats
	(

		if (rampdir == "down",
			{~pseqRate = Pseq((stepsin..1), repeats);},
			{~pseqRate = Pseq((1..stepsin), repeats);}
		);


		~metaHit = ~buf1[index];
		Pbind(
			\instrument,
			\oneLoop,
			\bufnum, ~metaHit,
			\amp, 1,
			\dur, eventdur,
			\sus_time, notedur,
			\rel_time, reltime,
			\rate, ~pseqRate,
		).play();

		~motifleng = eventdur*stepsin*repeats;

)};

//ex
// ~pitchroll.value(1, eventdur:1,rampdir:"up",repeats:20,stepsin:4);

/*---RUN---*/
/*creates '/_-_-' type*/
~run = {arg
	indexa=0, //index of sample 1
	indexb=1, //index of sample 2
	indexc=2, //index of sample 3
	indexd=3, //index of sample 4
	eventdur=0.25, //event duration
	notedur=1, //note duration
	reltime=0.05, //release time of env
	strindex=0, //index of first sound to include
	stpindex=3, //index of last sound to include
	noteamp=0.5;
	(
		~metaPerc0 = ~buf1[indexa];
		~metaPerc1 = ~buf1[indexb];
		~metaPerc2 = ~buf1[indexc];
		~metaPerc3 = ~buf1[indexd];

		~classrate = 2;

		~runarray = [eventdur,eventdur,eventdur,eventdur];
		~runarray = ~runarray[strindex..stpindex];

		~bufferarray = [~metaPerc0,~metaPerc1,~metaPerc2,~metaPerc3];
		~bufferarray = ~bufferarray[strindex..stpindex];

		Pbind(
			\instrument,\oneLoop,
			\bufnum, Pseq(~bufferarray, 1),
			\amp,noteamp,
			\dur, Pseq(~runarray, 1),
			\sus_time, notedur,
			\rel_time, reltime,
			\rate, Pfunc { ~classrate },
			\legato, 0.1

		).play();

		~motifleng = 0;
		~runarray.do({arg item; ~motifleng=~motifleng+item});
		~motifleng;

)};

/*---RUN---*/
/*creates '/_-_-' type*/
~coderun = {arg
	in_str,
	eventdur=0.5, //event duration
	notedur=1, //note duration
	reltime=0.05, //release time of env
	noteamp=0.5,
	relrate=1;
	(
		//parse string
		//**string should load up a buffer called '~unicodebufferarray'
		~chuckparse.value(in_str);

		~classrate = relrate;

		~runarray.fill(eventdur);

		~unicodebufferarray.do{arg i; ~runarray.add(0.5)};


		Pbind(
			\instrument,\oneLoop,
			\bufnum, Pseq(~unicodebufferarray, 1),
			\amp,noteamp,
			\dur, eventdur,
			\sus_time, notedur,
			\rel_time, reltime,
			\rate, Pfunc { ~classrate },
			\legato, 0.1

		).play();

		~motifleng = 0;
		~runarray.do({arg item; ~motifleng=~motifleng+item});
		~motifleng=~motifleng*(eventdur*2);

)};

~coderun.value("aaaa",eventdur:0.5);

)





