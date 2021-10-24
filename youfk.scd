/*---parse apart mixed Unicode / Ascii String---*/
//~mystring = "♥*¡｡";
//in dec [ -30, -103, -91, 42, -62, -95, -17, -67, -95 ]
//should output:

//*Unicode - 3 Byte;
//*ascii
//*Unicode - 2 Byte;
//*Unicode - 4 Byte;

(
~mystring = "♥*¡｡🃏";
"String input: %\r\n\r\n".postf(~mystring);

//get Char Byte Values
~mybbody = ~mystring.ascii;

//set to true when first byte of a unicode character is detected
~unicodebyte_start = false;
//counts through bytes of unicode character
~unicodebyte_counter = 0;
//length of current unicode character
~unicodebyte_len = 0;

//checks signedness (negative / positive) of byte
~mybbody.do({ arg i;

	i.postln;

	//if postive; is Ascii
	if( (i > 0) ,
	{
		"Found Ascii Char [%]\r\n".postf(i.asAscii);
    },
	//if negative; is unicode
	{
		//if a Unicode Char Start
		if( (~unicodebyte_start == false),
		{
			//unicode byte parsing now active
			~unicodebyte_start == true;

			//get length by masking off first 4 bytes
			~bytelen_masked = i & 240;

			//begin unicode char buffer
			~uni_charbuf = i.asAscii;

			//get length
			switch(~bytelen_masked,
				208, {~unicodebyte_len=2;},
				192, {~unicodebyte_len=2;},
				224, {~unicodebyte_len=3;},
				240, {~unicodebyte_len=4;}
			);
		}, //else  (if unicode char byte but not start)
		{
			~uni_charbuf = ~uni_charbuf++i.asAscii;
		});

		~unicodebyte_counter=~unicodebyte_counter+1;

		//if end byte
		if(~unicodebyte_counter==~unicodebyte_len,
		{
			//"% Byte Unicode Char [%]".postf(~unicodebyte_len,~uni_charbuf);

			~uni_charbuf.postln;
			~unicodebyte_counter = 0;
			~unicodebyte_start = false;
		});

    });



	});

)