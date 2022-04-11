//*1.-----run (or Hit cmd + B)------*/
(
//basic command to start super collider server
s.boot;

)


/*2. -------SETUP---------*/
(
//make network available
~b = NetAddr.new("127.0.0.1", 12000);
~b.sendMsg("/hello", "there");


//all sub-files are relative to this file)
~curpath = thisProcess.nowExecutingPath.dirname.postln;

//Synthesizer Definitions
(~curpath++"/synthdefpad.scd").load;

//Sample Arrays
(~curpath++"/samplepad.scd").load;

//Random Seed control
(~curpath++"/seedctrlpad.scd").load;

//Score Composition
(~curpath++"/scoresectionspad.scd").load;

//Unicode Parsing Fcn
(~curpath++"/unicodeparse.scd").load;

//Motif Generating Functions
(~curpath++"/motiffcnpad.scd").load;

//Unicode Sample Array
(~curpath++"/unicodereferencesamps.scd").load;

//more score sections
(~curpath++"/scratchpad2.scd").load;



//GUI Window
//(~curpath++"/gui.scd").load;



)


/*3. --------Motif SCORE---------*/
(

"\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n".postln;

//stop  running code and free up buffer
//CmdPeriod.runc
// Buffer.freeAll;

~riff_index;

~unicodebufferarray;

~score3 = {
	~bpm = 100;
	TempoClock.tempo = ~bpm/60;
	//öↇ-𝑎

	~riff_event.value(0 );
	~coderun.value("ↇ", eventdur:0.5);

	~leng = ~coderun.value("⁜_⊘_☥_⠀⫂⠀⫂⊕◹☨◹⏚_", eventdur:0.25);
	~riff_event.value(~leng);


	~leng = ~coderun.value("☨☨☨☨", eventdur:0.25,
		           pitch_str:"2468");
	~riff_event.value(~leng);
	//

	~leng = ~coderun.value("⏚_☦⏚_☦⏚_",
		         pitch_str:"___d__i_");
	~leng = ~coderun.value("____________☨☨☨☨", eventdur:0.25,
		           amp_str:"____________2468");
	~riff_event.value(~leng);

	~leng = ~coderun.value("☧_⠆⫂⠆⫂", eventdur:0.25,rep_num:4);~riff_event.value(~leng);
	~leng = ~coderun.value("☧_⠆⫂", eventdur:0.25,rep_num:1);~riff_event.value(~leng);
	~leng = ~coderun.value("☥☥",
		         pitch_str:"6e");~riff_event.value(~leng);

	~leng = ~coderun.value("☥☧☥☧☥☧☥☧", eventdur:0.25,
		         pitch_str:"34566543");~riff_event.value(~leng);

	~leng = ~coderun.value("⊖☨⊖☨⊖☨⊖☨☨⊖☨☨", pitch_gbl:2);~riff_event.value(~leng);
	~leng = ~coderun.value("⏚☩⏚☩", eventdur:0.25, pitch_gbl:2);~riff_event.value(~leng);
	~leng = ~coderun.value("⊖⊖☨☨", eventdur:0.25, pitch_gbl:2);~riff_event.value(~leng);
	~leng = ~coderun.value("⊖☨⊖☨⊖☨⊖☨☨⊖☨☨", pitch_gbl:2);
	~leng = ~coderun.value("☩☩☩☩☩☩☩☩☩☩☩☩",
		amp_str:"__2222444455"
		);~riff_event.value(~leng);
	~leng = ~coderun.value("☩☩☩☩",
		amp_str:"6789",eventdur:0.25,
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊖☨⊖☨⊖☨☨⊖☨☨", pitch_gbl:0.75);~riff_event.value(~leng);
	~leng = ~coderun.value("⏚☩⏚☩", eventdur:0.25, pitch_gbl:0.75);~riff_event.value(~leng);
	~leng = ~coderun.value("⊖☨☨⊖☨☨", pitch_gbl:0.75);~riff_event.value(~leng);
	~leng = ~coderun.value("⊖☨⊖☨⊖☨⊖☨⊖☨⊖☨", eventdur:0.25, pitch_gbl:0.75,
		amp_str:"____76543210"
		);
	~leng = ~coderun.value("☩☩☩☩☩☩☩☩",
		amp_str:"__224455"
		);~riff_event.value(~leng);
	~leng = ~coderun.value("☩☩☩☩",
		amp_str:"6789",
		pitch_str:"cdef",
		eventdur:0.25,
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊕_⠆◹",
		amp_str:"6789",eventdur:0.25,rep_num:4
		);~riff_event.value(~leng);
	~leng = ~coderun.value("⊕",
		eventdur:0.5
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊕_⠆◹",
		amp_str:"6789",eventdur:0.25,rep_num:3
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊕⊕⊕⊕",
		eventdur:0.25
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊗⊗",
		eventdur:0.5
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊕_☧◹",
		amp_str:"6789",eventdur:0.25,rep_num:4
		);~riff_event.value(~leng);
	~leng = ~coderun.value("⊕",
		eventdur:0.5
		);~riff_event.value(~leng);
	~leng = ~coderun.value("⠆⠆☧☧⫁⫁☨☨",
		eventdur:0.25
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊕_☧◹",
		amp_str:"6789",eventdur:0.25,rep_num:4
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⠆⠆☧☧⫁⫁☨☨⊕⊕⏚⏚◸◸⠅⠅",
		eventdur:0.25
		);~riff_event.value(~leng);

	~leng = ~coderun.value("⊕◸⫃⊕◸⫃⊕◸⫃⊕◸⫃⊕◸⫃⊕",eventdur:0.25,
		amp_str:"FEDCBA9876543210",
		pitch_str:"0c0c0c0c0c0c0c0c"
		);
	~leng = ~coderun.value("____________☨☨☨☨☨☨☨☨☨☨☨☨☨☨☨☨",eventdur:0.25,
		amp_str:"____________0123456789ABCDEF",
		pitch_str:"____________0c0c0c0c0c0c0c0c"
		);~riff_event.value(~leng);

	~scorepart2.fork;

	/*
	    //kicks......"⊖⊘⊙⊚⊛"
	    //kick hat..."⊗⊕"
	....//snares....."☥☦☧☨☩"
	    //hihats....."⠀⠁⠂⠃⠄⠅⠆⠇"
	    //rides......"◸◹"
	    //perccs....."⫀⫁⫂⫃⫄⫅⫆⫇⫈"
	    //ride stop..."⏚"
*/

};


//plays the parts
//~scorepart2.fork;
~score3.fork;

)