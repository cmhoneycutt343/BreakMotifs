//*1.-----run (or Hit cmd + B)------*/
(
//basic command to start super collider server
s.boot;
)


/*2. -------SETUP---------*/
(
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

//Unicode Sample Array
(~curpath++"/unicodereferencesamps.scd").load;

//Motif Generating Functions
(~curpath++"/motiffcnpad.scd").load;

)


/*3. --------Motif SCORE---------*/
(
~bpm = 120;
TempoClock.tempo = ~bpm/60;

//stop running code and free up buffer
//CmdPeriod.run
Buffer.freeAll;

~scorepart1 = {


/*	    //kicks
		~leng = ~coderun.value("⊖⊘⊙⊚⊛", eventdur:1, notedur:0.1);
        ~leng.wait;

	    //kick hat
	    ~leng = ~coderun.value("⊗⊕", eventdur:1, notedur:0.1);
	    ~leng.wait;

	    //snares
	    ~leng = ~coderun.value("☥☦☧☨☩", eventdur:1, notedur:0.1);
        ~leng.wait;

	    //hihats
	    ~leng = ~coderun.value("⠀⠁⠂⠃⠄⠅⠆⠇", eventdur:1, notedur:0.1);
        ~leng.wait;

	    //rides
	    ~leng = ~coderun.value("◸◹", eventdur:1, notedur:0.1);
        ~leng.wait;

	    //perccs
	    ~leng = ~coderun.value("⫀⫁⫂⫃⫄⫅⫆⫇⫈", eventdur:0.5, notedur:0.1);
    	~leng.wait;

	    //ride stop
	    ~leng = ~coderun.value("⏚", eventdur:1);
	    ~leng.wait;*/
	//

	~leng = ~coderun.value(
		         "☨_☨_☨_☨_☨_☨_☨___",
		pitchstr:"________________",
		eventdur:0.25, notedur:1);
	~leng.wait;

	// ~leng = ~coderun.value("⊖⠀⊘⠀☥◹⠀⫂⠀⫂⊕⫀☨_⏚_", eventdur:0.25, notedur:1);
	// ~leng.wait;
	//
	// ~leng = ~coderun.value("⊖_⊘_☥_⊖_⊘_☥_⫀⫀⫀⫀", eventdur:0.25, notedur:1);
	// ~leng.wait;
	//
	// ~leng = ~coderun.value("⊖_⊘_☥_⠀⫂⠀⫂⊕_☨_⏚_", eventdur:0.25, notedur:1);
	// ~leng.wait;
	//
	// ~leng = ~coderun.value("⏚___☨_⏚___☨_☩_⫂☨", eventdur:0.25, notedur:1);
	// ~leng.wait;
	//
	// ~leng = ~coderun.value("⊖_⊘_☥_⠀⫂⠀⫂⊕_☨_⏚_", eventdur:0.25, notedur:1);
	// ~leng.wait;
	//
	// ~leng = ~coderun.value("⊖_⊘_☥_⊖_⊘_☥_⫀⫀⫀⫀", eventdur:0.25, notedur:1);
	// ~leng.wait;
	//
	// ~leng = ~coderun.value("⊖_⊘_☥_⠀⫂⠀⫂⊕_☨_⏚_", eventdur:0.25, notedur:1);
	// ~leng.wait;
	//
	// ~leng = ~coderun.value("☧_⠀⫂⠀⫂☧_⠀⫂⠀⫂⫃⫄⫅⫆", eventdur:0.25, notedur:1);
	// ~leng.wait;

		//loops the sub
		~scorepart1.fork;
};

//plays the parts
~scorepart1.fork;

)