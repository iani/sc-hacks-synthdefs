{arg out = 0, freq1 = 240, freq2 = 60, amp = 1, ringTime = 10, rel = 1, dist = 0.5, pan = 0;
    var snd, env;
	snd = Ringz.ar(
		in: Impulse.ar(0), // single impulse
		freq: XLine.ar(freq1, freq2, 0.1),
		decaytime: ringTime);
	env = EnvGen.ar(Env.perc(0.001, rel, amp), doneAction: 2);
	snd = (1.0 - dist) * snd + (dist * (snd.distort));
	snd = snd * env;
	Out.ar(0, Pan2.ar(snd, pan));
//
//By Bruno Ruviaro
//https://github.com/brunoruviaro/SynthDefs-for-Patterns/blob/master/kick808.scd
}