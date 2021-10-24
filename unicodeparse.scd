/*---parse apart mixed Unicode / Ascii String---*/
//~mystring = "♥*¡｡";
//in dec [ -30, -103, -91, 42, -62, -95, -17, -67, -95 ]
//should output:

//*Unicode - 3 Byte;
//*ascii
//*Unicode - 2 Byte;
//*Unicode - 4 Byte;
(
~chuckparse = { arg mystring;
	~mystring = mystring;

	"\r\nString input: %\r\n\r\n".postf(~mystring);

	//get Char Byte Values
	~mybbody = ~mystring.ascii;

	//set to true when first byte of a unicode character is detected
	~unicodebyte_start = false;
	//counts through bytes of unicode character
	~unicodebyte_counter = 0;
	//length of current unicode character
	~unicodebyte_len = 0;

	//total characters detected
	~totchar = 0;
	//general byte counter
	~byteindex = 0;

	//buffer that will hold buffer objects
	~unicodebufferarray = List.new;

	//scan each byte in string
	~mybbody.do({ arg i;

		//each byte
		//i.postln;

		//if postive; is Ascii
		if( (i > 0) ,
			{
				"[%] Byte %; Char % -> Ascii Char [Hex: %] \r\n".postf(i.asAscii,~byteindex, ~totchar,i.asHexString(2));

				~palette_scancounter=0;
				~cursam = nil;

				//scan the ascii palette
				~asciiPalette.do({ arg fin_char;

					//if a match is found..
					if((fin_char[0][0].ascii == i.postln ),{
						~cursam = ~asciiPalette[~palette_scancounter][1];
						~unicodebufferarray.add(Buffer.read(s, ~curpath++"/samples/"++~cursam));
					});

					~palette_scancounter=~palette_scancounter+1;
				});


				"Sample Referenced: %\r\n\r\n".postf(~cursam);
				~totchar = ~totchar+1;
			},
			//if negative; is unicode
			{
				//if a Unicode Char Start
				if( (~unicodebyte_start == false),
					{
						//unicode byte parsing now active
						~unicodebyte_start = true;

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
					},
					{
						//add it to the list
						~uni_charbuf = ~uni_charbuf++i.asAscii;
				});

				~unicodebyte_counter=~unicodebyte_counter+1;

				//if end byte
				if(~unicodebyte_counter==~unicodebyte_len,
					{
						~unibiddispbuf=~uni_charbuf.ascii;
						"[%] Byte %; Char % -> Unicode Char [Hex: %] (% byte)\r\n".postf(~uni_charbuf,~byteindex-~unicodebyte_len+1, ~totchar,~unibiddispbuf.collect(_.asHexString(2)),~unicodebyte_len);
						~totchar = ~totchar+1;

						~unicodebyte_counter = 0;
						~unicodebyte_start = false;
				});

		});

		~byteindex=~byteindex+1;


	});

	"Total Symbols in String: %\r\n".postf(~totchar);

};

)