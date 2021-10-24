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
~bpm = 140;
TempoClock.tempo = ~bpm/60;

//stop running code and free up buffer
//CmdPeriod.run
Buffer.freeAll;

~scorepart1 = {

	~leng = ~coderun.value("g  g  g  g  g g ", eventdur:0.5);



	~leng = ~coderun.value("ajijijij", eventdur:0.25);
	~leng = ~coderun.value("a  a  a ", eventdur:0.25);
	~leng = ~coderun.value("b  db d ", eventdur:0.25);
	~leng.wait;
	//

	/*--potentiall soon deprecated examples--*/
	// ~leng = ~cage.value(1,0,2,notedur:0.1,eventdur:1);
	// ~leng.wait;
	//
	// ~leng = ~pitchroll.value(3, eventdur:0.25,stepsin:4);
	// ~leng.wait;
	//
	// ~leng = ~run.value(5,6,7,8, eventdur:0.5, notedur:0.1);
	// ~leng.wait;
};


~scorepart1.fork;

)


(
~bpm = 180;
TempoClock.tempo = ~bpm/60;
~chuckparse.value("顔文字");
)
