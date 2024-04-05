import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteCreationEvent;

public final camNotes:HudCamera;
public final camSustains:HudCamera;
public final camStrums:HudCamera;

function create(){
    camSustains = new HudCamera();
    camSustains.bgColor = '#00000000';

    camNotes = new HudCamera();
    camNotes.bgColor = '#00000000';

    camStrums = new HudCamera();
    camStrums.bgColor = '#00000000';

    camNotes.downscroll = downscroll;
    camSustains.downscroll = downscroll;
    camStrums.downscroll = downscroll;

    FlxG.cameras.add(camStrums, false);
    FlxG.cameras.add(camSustains, false);
    FlxG.cameras.add(camNotes, false);
}

function onNoteCreation(event:NoteCreationEvent){
    final note = event.note;
    final line  = note.strumLine;
    
    note.cameras = [note.isSustainNote ? camSustains : camNotes];
    
    for (strum in line.members) {
        strum.cameras = [camStrums];
    }
}