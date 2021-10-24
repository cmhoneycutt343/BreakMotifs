(
/*---CODERUN---*/
/*creates '/_-_-' type*/
~coderun = {arg in_str,
	eventdur=0.5, //event duration
	notedur=1, //note duration
	reltime=0.05, //release time of env
	noteamp=0.5,
	relrate=1,
	pitch_str = "";
	(
		/*----parse sample sequence string----*/
		//**string should load up a buffer called '~unicodebufferarray'
		~chuckparse.value(in_str, lumode:"sample");

		~runarray.fill(eventdur);

		//for each element of the sample array
		//add up the duration (for wait time output)
		~unicodebufferarray.do{arg i; ~runarray.add(0.5)};

		/*----parse pitch sequence string----*/
		if(pitch_str != "",{
			//**string should load up a buffer called '~pitchrunarray'
			~chuckparse.value(pitch_str, lumode:"pitch");

			~chromsc = Scale.chromatic;
			~chromsc.ratios[1];

			//stores lists of chroma (pre-Pseq)
			~chromseq = List.new;
			~chromrat_temp=1;

			//for each element of the pitch array
			~pitchrunarray.do{arg i;

				i.postln;

				//get ratio (positive or negative)
				if (i>=0,{
					~chromrat_temp=~chromsc.ratios[i];
					"pos".postln;
				});
				if (i<0,{
					~chromrat_temp=1/~chromsc.ratios[i.abs];
					"neg".postln;
				});

				//add to list of chromas
				~chromseq.add(~chromrat_temp);
			};

			~classrate = Pseq(~chromseq,1);

			"did the !==".postln;

		},{
			//stores lists of chroma (pre-Pseq)
			~chromseq = List.new;

			~unicodebufferarray.do{arg i; ~chromseq.add(1)};

			~classrate = Pseq(~chromseq,1);

			"did the !==".postln;

		});

		~chromseq.postln;

/*		~classrate = Pseq([1,~chromsc.ratios[1],~chromsc.ratios[2],~chromsc.ratios[3],
			                 ~chromsc.ratios[4],~chromsc.ratios[5],~chromsc.ratios[6],~chromsc.ratios[7]
		], 1);*/

/*        ~classrate = Pseq([1,1/~chromsc.ratios[1],1/~chromsc.ratios[2],1/~chromsc.ratios[3],
			                 1/~chromsc.ratios[4],1/~chromsc.ratios[5],1/~chromsc.ratios[6],1/~chromsc.ratios[7]
		], 1);*/

/*		~unicodebufferarray.postln;

		~pitchrunarray.postln;*/

		Pbind(
			\instrument,\oneLoop,
			\bufnum, Pseq(~unicodebufferarray, 1),
			\amp,noteamp,
			\dur, eventdur,
			\sus_time, notedur,
			\rel_time, reltime,
			\rate, ~classrate,
			\legato, 0.1

		).play();

		~motifleng = 0;
		~runarray.do({arg item; ~motifleng=~motifleng+item});
		~motifleng=~motifleng*(eventdur*2);

)};

~coderun.value("cccccccc",
	pitch_str:"0123210a",
	eventdur:0.25
);


);
//~coderun.value("⊖☥⊖");

)


