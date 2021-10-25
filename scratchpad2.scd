(
~scorepart2 = {
	~bpm = 120;
	TempoClock.tempo = ~bpm/60;


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
		pitch_str:"_6a_b_c_d_e_f_g_",
		eventdur:0.25,
		notedur:1);

	~leng.wait;

	~leng = ~coderun.value("⊖⊖⊘⊘☥☥⊖⊖⊘_☥_⫀⫀⫀_", eventdur:0.25, notedur:1);
	~leng = ~coderun.value(
		          "☨☨☨☨☨☨☨☨☨☨☨☨☨☨⏚_",
		pitch_str:"_6aabbccddeef_g_",
		eventdur:0.25,
		notedur:1);

	~leng.wait;

	~leng = ~coderun.value("⊖⠀⊘⠀☥◹⠀⫂⠀⫂⊕⫀☨_⏚_", eventdur:0.25, notedur:1);
	~leng = ~coderun.value(
		          "☨☨☨_☨_☨_☨_☨_☨_☨_",
		pitch_str:"_6a_b_c_d_e_f_g_",
		eventdur:0.25,
		notedur:1);

	~leng.wait;

	~leng = ~coderun.value("⊖⊖⊘⊘☥☥⊖", eventdur:0.25, notedur:1);
	~leng = ~coderun.value(
		          "☨☨☨☨☨☨☨☨",
		pitch_str:"_6aabbcc",
		eventdur:0.25,
		notedur:1);
	~leng.wait;

	~leng = ~coderun.value("☥☥☥☥☥☥☥☥☥☥☥☥☥☥☥☥",eventdur:0.125, notedur:1,
	               amp_str:"445566778899AABB");
	~leng = ~coderun.value("⠇⠇⠇⠇⠇⠇⠇⠇",eventdur:0.25, notedur:1,
		           amp_str:"456789AB",
		         pitch_str:"c_c_c_c_");
	~leng = ~coderun.value("____⏚⏚⏚⏚",eventdur:0.25, notedur:0.1,
		            amp_str:"456789AB",
		          pitch_str:"____63_f"  );
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

	~scorepart2.fork;
};



)
