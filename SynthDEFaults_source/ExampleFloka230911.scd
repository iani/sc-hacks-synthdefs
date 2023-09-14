(
s.waitForBoot({
	SynthDef("amDepth",  { arg freq=440, amp=0.1, att=0.01, dec=0.3, sus=0.5, rel=0.1, gate = 1, pan = 0, modFreqRatio = 2, modDepth = 1;

		var carrier, modulator, snd, env;

		env = Env.adsr(
			attackTime: att,
			decayTime: dec,
			sustainLevel: sus,
			releaseTime: rel,
			peakLevel: amp
		).kr(gate: gate);

		carrier = SinOsc.ar(freq: freq);
		modulator = SinOsc.ar(freq: freq * modFreqRatio).range(0, modDepth);
		snd = carrier * modulator;
		snd = snd * env;
		snd = Pan2.ar(in: snd, pos: pan);
		Out.ar(0, snd);
		DetectSilence.ar(snd, doneAction: 2);
	}).add;

	{
		var melody, notes, durs;
		melody = [
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[[10, 12], 1], [9, 1/2], [[10, 12], 1/2], [[8, 10], 1/2], [\rest, Rest(1/2)],
			[[10, 12], 1], [9, 1/2], [[10, 12], 1/2], [[8, 10], 1/2], [\rest, Rest(1/2)],
			[[10, 12], 1], [9, 1/2], [[10, 12], 1/2], [[8, 10], 1/2], [\rest, Rest(1/2)],
			[[10, 12, 15], 1/2], [\rest, Rest(1/2)], [15, 1/2], [15, 1/2], [14, 1/2], [13b, 1/2],
			[[8, 10, 12], 1/2], [\rest, Rest(1/2)], [12, 1/2], [12, 1/2], [11, 1/2], [10, 1/2],
			[[6, 8, 11], 1/2], [\rest, Rest(1/2)], [11, 1/2], [11, 1/2], [12, 1/2], [11, 1/2],
			[[5, 8, 10], 1/2], [\rest, Rest(1/2)], [[4, 9], 1/2], [10, 1/2], [[1, 8], 1/2], [\rest, Rest(1/2)],
			[5, 1/2], [6, 1/2], [7s, 1/2], [[5, 8], 1/2], [9, 1/2], [10, 1/2],
			[[5, 11], 1/2], [12, 1/2], [11, 1/2], [5, 1/2], [10, 1],
			[12, 1/2], [13, 1/2], [14s, 1/2], [[12, 15], 1/2], [16, 1/2], [17, 1/2], [[12, 18], 1/2], [19, 1/2], [18, 1/2], [12, 1/2], [17, 1],
		];

		notes = melody.flop[0];
		durs = melody.flop[1];

		~melody = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 1),
			\degree, Pseq(notes, inf),
			\amp, 0.8,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.5,
			\modDepth, 0.4
		).play.stop;
	}.value;

	{
		var melody2, notes, durs;
		melody2 = [
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [5, 1/2],
			[[10, 12], 1], [9, 1/2], [[10, 12], 1/2], [[8, 10], 1/2], [\rest, Rest(1/2)],
			[[10, 12], 1], [9, 1/2], [[10, 12], 1/2], [[8, 10], 1/2], [\rest, Rest(1/2)],
			[[10, 12], 1], [9, 1/2], [[10, 12], 1/2], [[8, 10], 1/2], [\rest, Rest(1/2)],
			[[10, 12, 15], 1/2], [\rest, Rest(1/2)], [15, 1/2], [15, 1/2], [14, 1/2], [13b, 1/2],
			[[8, 10, 12], 1/2], [\rest, Rest(1/2)], [12, 1/2], [12, 1/2], [11, 1/2], [10, 1/2],
			[[6, 8, 11], 1/2], [\rest, Rest(1/2)], [11, 1/2], [11, 1/2], [12, 1/2], [11, 1/2],
			[[5, 8, 10], 1/2], [\rest, Rest(1/2)], [[4, 9], 1/2], [10, 1/2], [[1, 8], 1/2], [\rest, Rest(1/2)],
			[5, 1/2], [6, 1/2], [7s, 1/2], [[5, 8], 1/2], [9, 1/2], [10, 1/2],
			[[5, 11], 1/2], [12, 1/2], [11, 1/2], [5, 1/2], [10, 1],
			[12, 1/2], [13, 1/2], [14s, 1/2], [[12, 15], 1/2], [16, 1/2], [17, 1/2], [[12, 18], 1/2], [19, 1/2], [18, 1/2], [12, 1/2], [17, 1],
		];

		notes = melody2.flop[0];
		durs = melody2.flop[1];

		~melody2 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 1),
			\degree, Pseq(notes, inf),
			\amp, 0.9,
			\sus, 0.3,
			\rel, 0.5,
			\modFreqRatio, 0.7,
			\modDepth, 0.3
		).play.stop;
	}.value;

	{
		var bassline, notes2, durs2;
		bassline = [
			[\rest, Rest(3)],
			[\rest, Rest(3)],
			[\rest, Rest(3)],
			[\rest, Rest(3)],
			[[-4, -1b, 1], 3],
			[[-6, -2, 0], 3],
			[[-6, -3, -1b], 3],
			[[-6, -2], 3],
			[-6, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2],
			[-6, 1/2], [-4, 1/2], [-1b, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2],
			[-6, 1/2], [-4, 1/2], [-1, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2],
			[[-6, -4, -1], 1], [[-8b, -6, -4], 1], [[-11, -8b, -6], 1/2], [-9, 1/4], [-11, 1/4],
			[[-13, -6], 1], [\rest, Rest(2)],
			[[-13, -9, -6], 1], [\rest, Rest(2)],
			[[-8b, -6, -4, -1b], 1], [\rest, Rest(2)],
			[[-9, -2], 1], [[-9, -2], 1], [[-9, -2], 1],
			[-9, 1/2], [-2, 1/2], [-9, 1/2], [-2, 1/2], [-9, 1/2], [-2, 1/2],
			[-2, 1], [-5, 1], [-7s, 1],
			[[-16, -9, -2], 3], [\rest, Rest(3)],
		];

		notes2 = bassline.flop[0];
		durs2 = bassline.flop[1];

		~bassline = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs2, 1),
			\degree, Pseq(notes2, inf),
			\amp, 0.6,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.5,
			\modDepth, 0.8
		).play.stop;
	}.value;

	{
		var bassline2, notes2, durs2;
		bassline2 = [
			[\rest, Rest(3)],
			[\rest, Rest(3)],
			[\rest, Rest(3)],
			[\rest, Rest(3)],
			[[-4, -1b, 1], 3],
			[[-6, -2, 0], 3],
			[[-6, -3, -1b], 3],
			[[-6, -2], 3],
			[-6, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2],
			[-6, 1/2], [-4, 1/2], [-1b, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2],
			[-6, 1/2], [-4, 1/2], [-1, 1/2], [-4, 1/2], [-2, 1/2], [-4, 1/2],
			[[-6, -4, -1], 1], [[-8b, -6, -4], 1], [[-11, -8b, -6], 1/2], [-9, 1/4], [-11, 1/4],
			[[-13, -6], 1], [\rest, Rest(2)],
			[[-13, -9, -6], 1], [\rest, Rest(2)],
			[[-8b, -6, -4, -1b], 1], [\rest, Rest(2)],
			[[-9, -2], 1], [[-9, -2], 1], [[-9, -2], 1],
			[-9, 1/2], [-2, 1/2], [-9, 1/2], [-2, 1/2], [-9, 1/2], [-2, 1/2],
			[-2, 1], [-5, 1], [-7s, 1],
			[[-16, -9, -2], 3], [\rest, Rest(3)],
		];

		notes2 = bassline2.flop[0];
		durs2 = bassline2.flop[1];

		~bassline2 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs2, 1),
			\degree, Pseq(notes2, inf),
			\ctranspose, 12,
			\amp, 0.5,
			\sus, 0.3,
			\rel, 0.2,
			\modFreqRatio, 0.7,
			\modDepth, 0.4
		).play.stop;
	}.value;

	{
		var chordi, notes, durs;
		chordi = [

			[[3, 6b, 1], 1], [[3, 6b, 1], 1/2], [[3, 6b, 1], 1/2], [[3, 6b, 1], 1/2], [[3, 6b, 1], 1/2],
			[[1, 5, 7], 1], [[1, 5, 7], 1/2], [[1, 5, 7], 1/2], [[1, 5, 7], 1/2], [[1, 5, 7], 1/2],
			[[1, 4, 6b], 1], [[1, 4, 6b], 1/2], [[1, 4, 6b], 1/2], [[1, 4, 6b], 1/2], [[1, 4, 6b], 1/2],
			[[4, 6b, 1], 1], [[1, 5, 7], 1], [[1, 4, 6b], 1],
			[[1, 3, 5], 1], [[1, 3, 5], 1], [[1, 3, 5], 1],
			[[4, 6b, 1], 1], [[4, 6b, 1], 1/2], [[3, 6b, 1], 1/2], [[4, 6b, 1], 1],
			[[3, 6b, 1], 1], [[3, 6b, 1], 1/2], [[2, 6b, 1], 1/2], [[3, 6b, 1], 1],
			[[2, 6b, 1], 1], [[2, 6b, 1], 1/2], [[2b, 6b, 1], 1/2], [[2, 6b, 1], 1],
			[[2b, 6b, 1], 1], [[2b, 6b, 1], 1/2], [[1, 3, 5], 1/2], [[2b, 6b, 1], 1],
			[[1, 3, 5], 1], [[1, 3, 5], 1/2], [[1, 3, 6b], 1/2], [[1, 3, 5], 1],
			[[1, 3, 6b], 1], [[1, 3, 6b], 1/2], [[1, 3, 7b], 1/2], [[1, 3, 6b], 1],
			[[1, 3, 7b], 1], [\rest, Rest(1/2)], [[1, 3, 7b], 1/2], [[1, 3, 7b], 1/2], [[1, 3, 7b], 1/2], [\rest, Rest(1/2)],
			[[4, 6b, 1], 1], [[6b, 1, 3], 1], [[1, 3, 6b], 1],
		];

		notes = chordi.flop[0];
		durs = chordi.flop[1];

		~chordi = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 1),
			\degree, Pseq (notes, inf),
			\ctranspose, 5,
			\amp, 0.7,
			\sus, 0.4,
			\rel, 1.5,
			\modFreqRatio, 0.5,
			\modDepth, 1
		).play.stop;
	}.value;

	{
		var chordi2, notes, durs;
		chordi2 = [

			[[3, 6b, 1], 1], [[3, 6b, 1], 1/2], [[3, 6b, 1], 1/2], [[3, 6b, 1], 1/2], [[3, 6b, 1], 1/2],
			[[1, 5, 7], 1], [[1, 5, 7], 1/2], [[1, 5, 7], 1/2], [[1, 5, 7], 1/2], [[1, 5, 7], 1/2],
			[[1, 4, 6b], 1], [[1, 4, 6b], 1/2], [[1, 4, 6b], 1/2], [[1, 4, 6b], 1/2], [[1, 4, 6b], 1/2],
			[[4, 6b, 1], 1], [[1, 5, 7], 1], [[1, 4, 6b], 1],
			[[1, 3, 5], 1], [[1, 3, 5], 1], [[1, 3, 5], 1],
			[[4, 6b, 1], 1], [[4, 6b, 1], 1/2], [[3, 6b, 1], 1/2], [[4, 6b, 1], 1],
			[[3, 6b, 1], 1], [[3, 6b, 1], 1/2], [[2, 6b, 1], 1/2], [[3, 6b, 1], 1],
			[[2, 6b, 1], 1], [[2, 6b, 1], 1/2], [[2b, 6b, 1], 1/2], [[2, 6b, 1], 1],
			[[2b, 6b, 1], 1], [[2b, 6b, 1], 1/2], [[1, 3, 5], 1/2], [[2b, 6b, 1], 1],
			[[1, 3, 5], 1], [[1, 3, 5], 1/2], [[1, 3, 6b], 1/2], [[1, 3, 5], 1],
			[[1, 3, 6b], 1], [[1, 3, 6b], 1/2], [[1, 3, 7b], 1/2], [[1, 3, 6b], 1],
			[[1, 3, 7b], 1], [\rest, Rest(1/2)], [[1, 3, 7b], 1/2], [[1, 3, 7b], 1/2], [[1, 3, 7b], 1/2], [\rest, Rest(1/2)],
			[[4, 6b, 1], 1], [[6b, 1, 3], 1], [[1, 3, 6b], 1],
		];

		notes = chordi2.flop[0];
		durs = chordi2.flop[1];

		~chordi2 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 1),
			\degree, Prand (notes, inf),
			\amp, 0.6,
			\sus, 0.2,
			\rel, 0.5,
			\modFreqRatio, 0.7,
			\modDepth, 1.5
		).play.stop;
	}.value;

	{
		var melodyb, notesb, dursb;
		melodyb = [
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[[8, 10, 12, 15], 1/2], [\rest, Rest(0.5)], [13, 1/2], [14, 1/2], [15, 1/2], [15, 1/2],
			[[5, 8, 10, 12], 1/2], [\rest, Rest(0.5)], [10, 1/2], [11, 1/2], [12, 1/2], [12, 1/2],
			[[4, 6, 8, 11], 1/2], [\rest, Rest(0.5)], [8, 1/2], [10, 1/2], [9, 1/2], [11, 1/2],
			[10, 1/2], [11, 1/2], [12, 1/2], [11, 1/2], [11, 1/2], [\rest, Rest(0.5)],
			[10, 1], [\rest, Rest(0.5)], [11, 1/2], [12, 1/2], [11, 1/2],
			[10, 1/2], [9, 1/2], [8, 1/2],[7s, 1/2], [6, 1/2], [5, 1/2],
			[10, 1/2], [9, 1/2], [8, 1/2], [7s, 1/2], [6, 1/2], [5, 1/2],
			[[5, 9, 11], 3],
		];

		notesb = melodyb.flop[0];
		dursb = melodyb.flop[1];


		~melodyb = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (dursb, 1),
			\degree, Pseq(notesb, inf),
			\amp, 0.6,
			\sus, 0.8,
			\rel, 1.5,
			\modFreqRatio, 1.5,
			\modDepth, 0.8
		).play.stop;
	}.value;

	{
		var basslineb, notesb2, dursb2;
		basslineb = [
			[[4, 6b, 8], 1], [[4, 6b, 8], 1], [[4, 6b, 8], 1],
			[[3, 6b, 8], 1], [[3, 6b, 8], 1], [[3, 6b, 8], 1],
			[[2, 6b, 8], 1], [[2, 6b, 8], 1], [[2, 6b, 8], 1],
			[[2b, 6b, 8], 1], [[2b, 6b, 8], 1], [[2b, 6b, 8], 1],
			[[1, 3, 5], 1], [[1, 3, 5], 1], [[1, 3, 5], 1],
			[[1, 3, 6b], 1], [[1, 3, 6b], 1], [[1, 3, 6b], 1],
			[[1, 3, 7b], 1], [[1, 3, 7b], 1], [[1, 3, 7b], 1],
			[[1, 3, 6b], 1], [[-1b, 1, 3], 1], [[-3, -1b, 1], 1],
			[-2, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-2, 1/2], [-6, 1/2],
			[-2, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-2, 1/2], [-6, 1/2],
			[-2, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-2, 1/2], [-6, 1/2],
			[-1b, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-1b, 1/2], [-6, 1/2],
			[[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 3],
			[[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 3],
		];

		notesb2 = basslineb.flop[0];
		dursb2 = basslineb.flop[1];

		~basslineb = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (dursb2, 1),
			\degree, Pseq(notesb2, inf),
			\amp, 1,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.6,
			\modDepth, 0.5
		).play.stop;
	}.value;

	{
		var melodyb2, notesb, dursb;
		melodyb2 = [
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[[8, 10, 12, 15], 1/2], [\rest, Rest(0.5)], [13, 1/2], [14, 1/2], [15, 1/2], [15, 1/2],
			[[5, 8, 10, 12], 1/2], [\rest, Rest(0.5)], [10, 1/2], [11, 1/2], [12, 1/2], [12, 1/2],
			[[4, 6, 8, 11], 1/2], [\rest, Rest(0.5)], [8, 1/2], [10, 1/2], [9, 1/2], [11, 1/2],
			[10, 1/2], [11, 1/2], [12, 1/2], [11, 1/2], [11, 1/2], [\rest, Rest(0.5)],
			[10, 1], [\rest, Rest(0.5)], [11, 1/2], [12, 1/2], [11, 1/2],
			[10, 1/2], [9, 1/2], [8, 1/2],[7s, 1/2], [6, 1/2], [5, 1/2],
			[10, 1/2], [9, 1/2], [8, 1/2], [7s, 1/2], [6, 1/2], [5, 1/2],
			[[5, 9, 11], 3],
		];

		notesb = melodyb2.flop[0];
		dursb = melodyb2.flop[1];

		~melodyb2 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (dursb, 1),
			\degree, Prand (notesb, inf),
			\amp, 0.6,
			\sus, 0.8,
			\rel, 1.5,
			\modFreqRatio, 1.5,
			\modDepth, 0.8
		).play.stop;
	}.value;

	{
		var basslineb2, notesb2, dursb2;
		basslineb2 = [
			[[4, 6b, 8], 1], [[4, 6b, 8], 1], [[4, 6b, 8], 1],
			[[3, 6b, 8], 1], [[3, 6b, 8], 1], [[3, 6b, 8], 1],
			[[2, 6b, 8], 1], [[2, 6b, 8], 1], [[2, 6b, 8], 1],
			[[2b, 6b, 8], 1], [[2b, 6b, 8], 1], [[2b, 6b, 8], 1],
			[[1, 3, 5], 1], [[1, 3, 5], 1], [[1, 3, 5], 1],
			[[1, 3, 6b], 1], [[1, 3, 6b], 1], [[1, 3, 6b], 1],
			[[1, 3, 7b], 1], [[1, 3, 7b], 1], [[1, 3, 7b], 1],
			[[1, 3, 6b], 1], [[-1b, 1, 3], 1], [[-3, -1b, 1], 1],
			[-2, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-2, 1/2], [-6, 1/2],
			[-2, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-2, 1/2], [-6, 1/2],
			[-2, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-2, 1/2], [-6, 1/2],
			[-1b, 1/2], [1, 1/2], [3, 1/2], [1, 1/2], [-1b, 1/2], [-6, 1/2],
			[[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 3],
			[[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 1], [[-16, -9, -2, 5], 3],
		];

		notesb2 = basslineb2.flop[0];
		dursb2 = basslineb2.flop[1];


		~basslineb2 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (dursb2, 1),
			\degree, Prand (notesb2, inf),
			\amp, 1,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.5,
			\modDepth, 0.5
		).play.stop;
	}.value;

	(
		~melodys1 = Pbind(
			\instrument, "amDepth",
			\degree, Pseq([
				[-3, -1b, 1], [-3, -1b, 1].reverse,Prand([[-3, -1b, 1], [-3, -1b, 1].reverse]),
				[-3, -1b, 1], [-3, -1b, 1].reverse,Prand([[-3, -1b, 1], [-3, -1b, 1].reverse]),
				[-4, -2, 0], [-4, -2, 0].reverse,Prand([[-4, -2, 0], [-4, -2, 0].reverse]),
				[-4, -2, 0], [-4, -2, 0].reverse,Prand([[-4, -2, 0], [-4, -2, 0].reverse]),
				[-5, -3, -1b], [-5, -3, -1b].reverse,Prand([[-5, -3, -1b], [-5, -3, -1b].reverse]),
				[-5, -3, -1b], [-5, -3, -1b].reverse,Prand([[-5, -3, -1b], [-5, -3, -1b].reverse]),
				[-6, -4, -2], [-6, -4, -2].reverse,Prand([[-6, -4, -2], [-6, -4, -2].reverse]),
				[-6, -4, -2], [-6, -4, -2].reverse,Prand([[-6, -4, -2], [-6, -4, -2].reverse]),
				[-4, -1b, 1], [-4, -1b, 1].reverse,Prand([[-4, -1b, 1], [-4, -1b, 1].reverse]),
				[-4, -1b, 1], [-4, -1b, 1].reverse,Prand([[-4, -1b, 1], [-4, -1b, 1].reverse]),
				[-6, -2, 0], [-6, -2, 0].reverse,Prand([[-6, -2, 0], [-6, -2, 0].reverse]),
				[-6, -2, 0], [-6, -2, 0].reverse,Prand([[-6, -2, 0], [-6, -2, 0].reverse]),
				[-6, -3, -1b], [-6, -3, -1b].reverse,Prand([[-6, -3, -1b], [-6, -3, -1b].reverse]),
				[-6, -3, -1b], [-6, -3, -1b].reverse,Prand([[-6, -3, -1b], [-6, -3, -1b].reverse]),
				[-6, -4, -2], [-6, -4, -2].reverse,Prand([[-6, -4, -2], [-6, -4, -2].reverse]),
				[-6, -4, -2], [-6, -4, -2].reverse,Prand([[-6, -4, -2], [-6, -4, -2].reverse]),
			], 1),
			\dur, 1/2,
			\strum, 0.09,
			\rel, 0.4,
			\sus, 1.6,
			\ctranspose, 12
		).play.stop;
	);

	(
		~melodys2 = Pbind(
			\instrument, "amDepth",
			\degree, Pseq ([
				[-6, -4, -2, 1], [-6, -4, -2, 1], [-6, -4, -2, 1],
				[-9, -6, -4, -2], [-9, -6, -4, -2], [-9, -6, -4, -2],
				[-9, -6, -3], [-9, -6, -3], [-9, -6, -3],
				\rest,
				[-9, -7, -2], \rest,
				[-9, -7, -2], \rest,
			], 2),
			\dur, Pseq ([
				1, 1, 1,
				1, 1, 1,
				1, 1, 1,
				Rest(3), 3, Rest(3), 3, Rest(3)], 2),
			\ctranspose, 24,
			\strum, 0.09,
			\rel, 1,
			\sus, 0.6,
			\amp, 0.04,
		).play.stop;
	);

	{
		var basslines1, notes, durs;
		basslines1 = [
			[-4, 1], [-5, 1/2], [-4, 1/2], [-6, 1/2], [\rest, Rest(1/2)],
			[-4, 1], [-5, 1/2], [-4, 1/2], [-6, 1/2], [\rest, Rest(1/2)],
			[-4, 1], [-5, 1/2], [-4, 1/2], [-6, 1/2], [\rest, Rest(1/2)],
			[-4, 1], [-5, 1/2], [-4, 1/2], [-6, 1/2], [\rest, Rest(1/2)],
			[-4, 1/2], [0, 1/2], [-5, 1/2], [-4, 1/2], [1, 1/2], [0, 1/2],
			[-4, 1/2], [0, 1/2], [-5, 1/2], [-4, 1/2], [1, 1/2], [0, 1/2],
			[-4, 1/2], [0, 1/2], [-5, 1/2], [-4, 1/2], [1, 1/2], [0, 1/2],
			[-4, 1/2], [0, 1/2], [-5, 1/2], [-4, 1/2], [1, 1/2], [0, 1/2],
		];

		notes = basslines1.flop[0];
		durs = basslines1.flop[1];

		~basslines1 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 1),
			\degree, Pseq(notes, inf),
			\ctranspose, 12,
			\amp, 0.6,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.5,
		).play.stop;
	}.value;

	{
		var basslines2, notes, durs;
		basslines2 = [
			[[-11, -4,], 1], [[-9, -2], 1], [[-7, 0], 1],
			[[-11, -7, -4,], 1], [[-9, -5, -2], 1], [[-7, -3, 0], 1],
			[[-7, 0], 1], [[-12s, -5s], 1], [[-10, -3], 1],
			[[-13, -6, 1], 1/2], [\rest, Rest(1/2)], [[-13, -6, 1], 1/2], [[-13, -6, 1], 1/2], [[-13, -6, 1], 1/2], [\rest, Rest(1/2)],
			[[-9, -2, 5], 3], [[-9, -2, 5], 3],
			[[-9, -2, 5], 3], [[-9, -2, 5], 3],
		];
		notes = basslines2.flop[0];
		durs = basslines2.flop[1];

		~basslines2 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 2),
			\degree, Pseq(notes, inf),
			\amp, 0.4,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.5,
		).play.stop;
	}.value;

	{
		var chords1, notes, durs;
		chords1 = [
			[[-4, 0, 3], 2], [[-7, -3, 0], 1],
			[[-5, -1b, 2], 2], [[-7, -3, 0], 1],
			[[-6, -2, 1], 2], [[-7, -3, 0], 1],
			[[-5, -1b, 2], 2], [[-7, -3, 0], 1],
			[[-4, 0, 3], 1], [[-7, -3, 0], 1], [[-4, 0, 3], 1],
			[[-5, -1b, 2], 1], [[-7, -3, 0], 1], [[-5, -1b, 2], 1],
			[[-6, -2, 1], 1], [[-7, -3, 0], 1], [[-6, -2, 1], 1],
			[[-5, -1b, 2], 1], [[-7, -3, 0], 1], [[-5s, -1b, 2], 1]
		];

		notes = chords1.flop[0];
		durs = chords1.flop[1];

		~chords1 = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 1),
			\degree, Pseq(notes, inf),
			\amp, 0.6,
			\sus, 0.3,
			\rel, 0.5,
			\modFreqRatio, 0.6,
			\modDepth, 0.5,
		).play.stop;
	}.value;

	{
		var chords2, notes, durs;
		chords2 = [
			[[1, 3, 5, 8], 1], [8, 1/2], [8, 1/2], [7, 1/2], [6b, 1/2],
			[[-2, 1, 3, 5], 1], [5, 1/2], [5, 1/2], [4, 1/2], [3, 1/2],
			[[-2, 1, 4], 1], [4, 1/2], [4, 1/2], [5, 1/2], [4, 1/2],
			[[1, 8], 1/2], [\rest, Rest(1/2)], [[1, 8], 1/2], [[1, 8], 1/2], [[1, 8], 1/2], [\rest, Rest(1/2)],
			[5, 1/2], [6, 1/2], [7s, 1/2], [[5, 8], 1/2], [9, 1/2], [10, 1/2],
			[[5, 11], 1/2], [12, 1/2], [11, 1/2], [5, 1/2], [10, 1],
			[12, 1/2], [13, 1/2], [14s, 1/2], [[12, 15], 1/2], [16, 1/2], [17, 1/2], [[12, 18], 1/2], [19, 1/2], [18, 1/2], [12, 1/2], [17, 1],
		];

		notes = chords2.flop[0];
		durs = chords2.flop[1];
		~chords2 = Pbind(
			\instrument, "amDepth",
			\ctranspose, 7,
			\dur, Pseq (durs, 2),
			\degree, Pseq(notes, inf),
			\amp, 0.8,
			\sus, 0.8,
			\rel, 0.5,
			\legato, 0.25,
			\modFreqRatio, 0.5,
			\modDepth, 0.5,
		).play.stop;
	}.value;

	{
		var melodyo, notes, durs;
		melodyo = [
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [\rest, Rest(1/2)],
			[10, 1], [9, 1/2], [10, 1/2], [8, 1/2], [\rest, Rest(1/2)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[12, 1], [9, 1/2], [12, 1/2], [10, 1/2], [\rest, Rest(1/2)],
			[12, 1], [9, 1/2], [12, 1/2], [10, 1/2], [\rest, Rest(1/2)],

			[[10, 12, 15], 1/2], [\rest, Rest(1/2)], [15, 1/2], [15, 1/2], [14, 1/2], [13b, 1/2],
			[[8, 10, 12], 1/2], [\rest, Rest(1/2)], [12, 1/2], [12, 1/2], [11, 1/2], [10, 1/2],
			[[6, 8, 11], 1/2], [\rest, Rest(1/2)], [11, 1/2], [11, 1/2], [12, 1/2], [11, 1/2],
			[[5, 8, 10], 1/2], [\rest, Rest(1/2)], [[4, 9], 1/2], [10, 1/2], [[1, 8], 1/2], [\rest, Rest(1/2)],

			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[12, 1], [9, 1/2], [12, 1/2], [10, 1/2], [\rest, Rest(1/2)],
			[8, 1], [10, 1/2], [9, 1/2], [10, 1/2], [\rest, Rest(0.5)],
			[12, 1], [9, 1/2], [12, 1/2], [10, 1/2], [\rest, Rest(1/2)],
			[10, 2], [9, 1],
			[10, 1], [8, 2],
			[8, 1], [10, 1], [12, 1],
			[15, 3],
			[[8, 10, 12, 15], 6],
		];

		notes = melodyo.flop[0];
		durs = melodyo.flop[1];

		~melodyo = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs, 1),
			\degree, Pseq(notes, inf),
			\amp, 0.8,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.5,
			\modDepth, 0.4
		).play.stop;
	}.value;

	{
		var basslineo, notes2, durs2;
		basslineo = [
			[[-4, -1b, 1], 3],
			[[-4, -1b, 1], 3],
			[[-6, -2, 0], 3],
			[[-6, -2, 0], 3],
			[[-6, -3, -1b], 3],
			[[-6, -3, -1b], 3],
			[[-13, -6], 3],
			[[-13, -9, -6], 3],
			[[-8b, -6, -4, -1b], 3],
			[[-9, -5, -2], 1], [[-9, -5, -2], 1], [[-9, -5, -2], 1],
			[[-6, -2, 0], 3],
			[[-6, -3, -1b], 3],
			[[-6, -2, 0], 3],
			[[-6, -3, -1b], 3],
			[[-4, -1b, 1], 2], [[-6, -2, 0], 1],
			[[-6, -3, -1b], 1], [[-6, -2], 2],
			[\rest, Rest(3)],
			[\rest, Rest(3)],
			[[-13, -9, -6,], 6]
		];

		notes2 = basslineo.flop[0];
		durs2 = basslineo.flop[1];

		~basslineo = Pbind(
			\instrument, "amDepth",
			\dur, Pseq (durs2, 1),
			\degree, Pseq(notes2, inf),
			\amp, 0.6,
			\sus, 0.6,
			\rel, 1.5,
			\modFreqRatio, 0.5,
			\modDepth, 0.8
		).play.stop;
	}.value;

	~bpm = TempoClock.new(180/60).permanent_(true);
	~bpm2 = TempoClock.new(60/60).permanent_(true);
	~bpm3 = TempoClock.new(120/60).permanent_(true);
	s.volume = -8;

	(
		{
			~bassline.reset.play(~bpm);
			~melody.reset.play(~bpm);
			19.wait;
			~bassline2.reset.play(~bpm);
			~melody2.reset.play(~bpm);
			19.wait;
			~chordi2.reset.play(~bpm);
			13.wait;
			~chordi.reset.play(~bpm);
			13.wait;
			~basslineb.reset.play(~bpm);
			~melodyb.reset.play(~bpm);
			16.wait;
			~chordi2.reset.play(~bpm);
			13.wait;
			~basslineb2.reset.play(~bpm);
			~melodyb2.reset.play(~bpm);
			14.wait;
			~chordi2.reset.play(~bpm);
			13.wait;
			~chordi.reset.play(~bpm3);
			20.wait;
			~basslines1.reset.play(~bpm2);
			~melodys1.reset.play(~bpm2);
			~chords1.reset.play(~bpm2);
			24.wait;
			~basslines2.reset.play(~bpm);
			~melodys2.reset.play(~bpm);
			~chords2.reset.play(~bpm);
			18.wait;
			~bassline.reset.play(~bpm);
			~melody.reset.play(~bpm);
			19.wait;
			~basslineo.reset.play(~bpm3);
			~melodyo.reset.play(~bpm3);

		}.fork;
	);

});
)