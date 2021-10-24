(
~scorepart1 = {
	//set seed


	~seeddistrib.value(410);

	~leng = ~cage.value(~x1,~x0,~x3,notedur:0.1);
	~leng.wait;

	~leng = ~pitchroll.value(~x2, eventdur:0.25);
	~leng.wait;

	~leng = ~run.value(~x0,~x1,~x2,~x3, eventdur:0.5, notedur:0.1);
	~leng.wait;


	~leng = ~run.value(~x0,~x1,~x2,~x3, eventdur:0.5, notedur:0.1);
	~leng.wait;

	//makes it loop?
	~scorepart1.fork;

}
)