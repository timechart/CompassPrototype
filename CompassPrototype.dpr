program CompassPrototype;

uses
  Forms,
  CompassPrototype1 in 'CompassPrototype1.pas' {Form5},
  CompassPullSamples in 'CompassPullSamples.pas',
  CompassPushSamples in 'CompassPushSamples.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
