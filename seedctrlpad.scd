(
	~seeddistrib = { arg seedin; (

	if (seedin.isNil,
		{thisThread.randSeed = 1000.rand.postln},
		{thisThread.randSeed = seedin.postln}
	);

	~x0 = 56.rand;
	~x1 = 56.rand;
	~x2 = 56.rand;
	~x3 = 56.rand;
	~x4 = 56.rand;
	~x5 = 56.rand;
)}
)