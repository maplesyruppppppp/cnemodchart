importScript("data/scripts/pixel");
importScript("data/modchart/Modchart");

function create() {
	pixelNotesForBF = false;
	enablePixelUI = true;
	enableCameraHacks = false;
	playCutscenes = true;
}

function postCreate() {
	for(i in 0...6) {
		var name = "tank" + Std.string(i);
		stage.getSprite(name).visible = false;
	}
}

function postUpdate(elapsed) {
	for(i in 0...4) {
        setStrumAngle(0, i, Math.sin(curBeatFloat + (i * 0.45)) * 35);
        setStrumAngle(1, i, Math.sin(curBeatFloat + (i * 0.45)) * 35);
	}
}