importScript("data/modchart/Modchart");
importScript("data/modchart/NoteCameras");

function postCreate(){
    for (camera in [camNotes, camSustains, camStrums]){
        camera.alpha = 0.0001;
        camera.zoom = 0.75;
    }

    camHUD.alpha = 0.0001;
}

function onSongStart()
    for (camera in [camNotes, camSustains, camStrums]){
        FlxTween.tween(camera, {alpha: 1, zoom: 1}, (Conductor.stepCrochet * 32) / 1000, {
            ease: FlxEase.circIn,
            onComplete: function(){
                camHUD.alpha = 1;
            }
        });
    }

function beatHit(beat:Int){
    switch(beat){
        case 168:
            // middlescroll time
            for (camera in [camNotes, camSustains, camStrums]){
                camera.angle = 5;
                FlxTween.tween(camera, {x: camera.x + 320, angle: 0}, (Conductor.stepCrochet * 8) / 1000, {ease: FlxEase.backOut});
            }

            for (lol in 0...4){
                tweenStrumAlpha(0, lol, 1, 8, FlxEase.backOut);
                tweenStrumAlpha(1, lol, 0.0001, 8, FlxEase.backOut);
            }

            FlxTween.tween(camHUD, {y: -125}, (Conductor.stepCrochet * 16) / 1000, {ease: FlxEase.circIn});
        case 180:
            for (camera in [camNotes, camSustains, camStrums]){
                FlxTween.tween(camera, {x: camera.x - 640}, (Conductor.stepCrochet * 16) / 1000, {ease: FlxEase.quartIn});
            }

            for (lol in 0...4){
                tweenStrumAlpha(0, lol, 0.0001, 16, FlxEase.quartIn);
                tweenStrumAlpha(1, lol, 1, 16, FlxEase.quartIn);
            }
        case 200:
            for (camera in [camNotes, camSustains, camStrums]){
                FlxTween.tween(camera, {x: camera.x + 320, angle: 0}, (Conductor.stepCrochet * 8) / 1000, {ease: FlxEase.backOut});
            }

            for (lol in 0...4){
                tweenStrumAlpha(0, lol, 1, 8, FlxEase.backOut);
            }

            FlxTween.tween(camHUD, {y: 0}, (Conductor.stepCrochet * 8) / 1000, {ease: FlxEase.circOut});
    }
}