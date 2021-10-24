(
/*---CODERUN---*/
/*creates '/_-_-' type*/
~coderun = {arg in_str,
	eventdur=0.5, //event duration
	notedur=1, //note duration
	reltime=0.05, //release time of env
	noteamp=0.5,
	relrate=1,
	pitch_str = "",
	rep_num = 1;
	(
		/*----parse sample sequence string----*/
		//**string should load up a buffer called '~unicodebufferarray'
		~chuckparse.value(in_str, lumode:"sample");

		~runarray.fill(eventdur);

		//for each element of the sample array
		//add up the duration (for wait time output)


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
				});
				if (i<0,{
					~chromrat_temp=1/~chromsc.ratios[i.abs];
				});

				//add to list of chromas
				~chromseq.add(~chromrat_temp);
			};

			~classrate = Pseq(~chromseq,rep_num);

			"did the !==".postln;

		},{
			//stores lists of chroma (pre-Pseq)
			~chromseq = List.new;

			~unicodebufferarray.do{arg i; ~chromseq.add(1)};

			~classrate = Pseq(~chromseq,rep_num);

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
			\bufnum, Pseq(~unicodebufferarray, rep_num),
			\amp,noteamp,
			\dur, eventdur,
			\sus_time, notedur,
			\rel_time, reltime,
			\rate, ~classrate,
			\legato, 0.1

		).play();

		~unicodebufferarray.do{arg i; ~runarray.add(0.5)};
		~motifleng = 0;
		~runarray.do({arg item; ~motifleng=~motifleng+item});
		~motifleng=~motifleng*(eventdur*2);

)};

~totreps = 4;

~coderun.value("*__*__*_*__*__*_",
	 pitch_str:"___1__b____1__5_",
	rep_num:~totreps
);
~coderun.value("⊖__⊖__⊖_", eventdur: 0.25, rep_num:4*~totreps);
);

);




);


