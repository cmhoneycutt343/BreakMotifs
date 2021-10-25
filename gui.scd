(
~initwin = {
	w = Window.new("GUI Introduction", Rect(200,200,255,100));
	w.front;
	w.background = Color.white;
	~disstring = TextField(w,Rect(100,10,90,30)).string_("BLANK");
};

~initwin.value();

)


~disstring.string = "goofy";

w.close;