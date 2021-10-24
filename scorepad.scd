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


/*
	    //kicks......"⊖⊘⊙⊚⊛"
	    //kick hat..."⊗⊕"
	    //snares....."☥☦☧☨☩"
	    //hihats....."⠀⠁⠂⠃⠄⠅⠆⠇"
	    //rides......"◸◹"
	    //perccs....."⫀⫁⫂⫃⫄⫅⫆⫇⫈"
	    //ride stop..."⏚"
*/

	~leng = ~coderun.value("⊖⠀⊘⠀☥◹⠀⫂⠀⫂⊕⫀☨_⏚_", eventdur:0.25, notedur:1);
	~leng = ~coderun.value(
		          "☨☨☨_☨_☨_☨_☨_☨_☨_",
		pitch_str:"06a0b0c0d0e0f0g0",
		eventdur:0.25,
		notedur:1);
	"weird leng".postln;
	~leng.wait.postln;

	~leng = ~coderun.value("⊖⊖⊘⊘☥☥⊖⊖⊘_☥_⫀⫀⫀_", eventdur:0.25, notedur:1);
	~leng = ~coderun.value(
		          "☨☨☨☨☨☨☨☨☨☨☨☨☨☨⏚_",
		pitch_str:"06aabbccddeef0g0",
		eventdur:0.25,
		notedur:1);
	"weird leng".postln;
	~leng.wait.postln;

	~leng = ~coderun.value("⊖⠀⊘⠀☥◹⠀⫂⠀⫂⊕⫀☨_⏚_", eventdur:0.25, notedur:1);
	~leng = ~coderun.value(
		          "☨☨☨_☨_☨_☨_☨_☨_☨_",
		pitch_str:"06a0b0c0d0e0f0g0",
		eventdur:0.25,
		notedur:1);
	"weird leng".postln;
	~leng.wait.postln;

	~leng = ~coderun.value("⊖⊖⊘⊘☥☥⊖", eventdur:0.25, notedur:1);
	~leng = ~coderun.value(
		          "☨☨☨☨☨☨☨☨",
		pitch_str:"06aabbcc",
		eventdur:0.25,
		notedur:1);
	~leng.wait.postln;

	~leng = ~coderun.value("☥☥☥☥☥☥☥☥☥☥☥☥☥☥☥☥",eventdur:0.125, notedur:1,
	               amp_str:"445566778899AABB");
	~leng = ~coderun.value("⠇⠇⠇⠇⠇⠇⠇⠇",eventdur:0.25, notedur:1,
		           amp_str:"456789AB",
		         pitch_str:"c_c_c_c_");
	~leng = ~coderun.value("____⏚⏚⏚⏚",eventdur:0.25, notedur:0.1,
		            amp_str:"456789AB",
		          pitch_str:"____630f"  );
   ~leng.wait;




















	// ~leng = ~coderun.value("⊖_⊘_☥_⠀⫂⠀⫂⊕_☨_⏚_", eventdur:0.25, notedur:1);
	// ~leng.wait;
	// //
	// ~leng = ~coderun.value("⏚___☨_⏚___☨_☩_⫂☨", eventdur:0.25, notedur:1);
	// ~leng.wait;
	// //
	// ~leng = ~coderun.value("⊖_⊘_☥_⠀⫂⠀⫂⊕_☨_⏚_", eventdur:0.25, notedur:1);
	// ~leng.wait;
	// //
	// ~leng = ~coderun.value("⊖_⊘_☥_⊖_⊘_☥_⫀⫀⫀⫀", eventdur:0.25, notedur:1);
	// ~leng.wait;
	// //
	// ~leng = ~coderun.value("⊖_⊘_☥_⠀⫂⠀⫂⊕_☨_⏚_", eventdur:0.25, notedur:1);
	// ~leng.wait;
	// //
	// ~leng = ~coderun.value("☧_⠀⫂⠀⫂☧_⠀⫂⠀⫂⫃⫄⫅⫆", eventdur:0.25, notedur:1);
	// ~leng.wait;

	~scorepart1.fork;
};

//plays the parts
~scorepart1.fork;

)