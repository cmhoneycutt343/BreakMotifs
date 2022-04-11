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
	pitch_gbl = 1,
	rep_num = 1,
	amp_str = "";
	(
		/*----parse sample sequence string----*/
		//**string should load up a buffer called '~unicodebufferarray'

		~chuckparse.value(in_str, lumode:"sample");

		~runarray.fill(eventdur);

		//for each element of the sample array
		//add up the duration (for wait time output)


		// /*----parse pitch sequence string----*/
		//**string should load up a buffer called '~pitchrunarray'
		if(pitch_str != "",{
			~chuckparse.value(pitch_str, lumode:"pitch");

			~chromsc = Scale.chromatic;
			~chromsc.ratios[1];

			//stores lists of chroma (pre-Pseq)
			~chromseq = List.new;
			~chromrat_temp=1;

			//for each element of the pitch array
			~pitchrunarray.do{arg i;

				//get ratio (positive or negative)
				if (i>=0,{
					~chromrat_temp=~chromsc.ratios[i];
				});
				if (i<0,{
					~chromrat_temp=1/~chromsc.ratios[i.abs];
				});

				//add to list of chromas
				~chromseq.add(~chromrat_temp*pitch_gbl);
			};

		},{
			//stores lists of chroma (pre-Pseq)
			~chromseq = List.new;

			~unicodebufferarray.do{arg i; ~chromseq.add(1*pitch_gbl)};

		});

		/*----parse pitch sequence string----*/
		//**string should load up a buffer called '~amprunarray'
		if(amp_str != "",{

			~chuckparse.value(amp_str, lumode:"amp");

		},{
			//stores lists of chroma (pre-Pseq)
			~amprunarray = List.new;

			~unicodebufferarray.do{arg i; ~amprunarray.add(noteamp)};

		});


		~listlen = 0;
		~unicodebufferarray.do{var i=0;~listlen=~listlen+1};
		~listlen;

		//print repeat number
		if(rep_num !==1,{
			"x%\r\n".postf(rep_num);
		});

		if(~listlen>0,{
			Pbind(
				\instrument,\oneLoop,
				\bufnum, Pseq(~unicodebufferarray, rep_num),
				\amp,Pseq(~amprunarray, rep_num),
				\dur, eventdur,
				\sus_time, notedur,
				\rel_time, reltime,
				\rate, Pseq(~chromseq, rep_num),
				\legato, 0.1

			).play();
		});

		~unicodebufferarray.do{arg i; ~runarray.add(0.5)};
		~motifleng = 0;
		~runarray.do({arg item; ~motifleng=~motifleng+item});
		~motifleng=~motifleng*(eventdur*2)*rep_num;

)};

~totreps = 4;

/*~coderun.value("cccccccccccccccc",eventdur:0.125/2, notedur:0.001,
	 pitch_str:"____5555eeee2222",

);*/

/*~coderun.value("cccc",eventdur:0.25, notedur:0.1,pitch_gbl:0.5,
	   amp_str:"2468",
);*/

// coderun.value("*__*__*_*__*__*_",
// 	pitch_str:"___1__b____1__5_",
// 	rep_num:4
// );


/*~coderun.value("⊖⠃⠄⊖⠃⠄⊖⠃", eventdur: 0.5, rep_num:4*~totreps);*/
//~coderun.value("⊖⠃☧⊖⠃☧⊖⠃", eventdur: 0.25, rep_num:4*~totreps);


//packet seperation function
~riff_event = {arg time_wait = 0;
	(
		~riff_index = 0;

		"-*re-\r\n".postln;
		~b.sendMsg("/pkt_end", "->>-\r\n");
		time_wait.wait;
	)};
);






