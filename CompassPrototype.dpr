program CompassPrototype;

uses
  Forms,
  CompassPrototype1 in 'CompassPrototype1.pas' {Form5},
  CompassPullSamples in 'CompassPullSamples.pas',
  CompassPushSamples in 'CompassPushSamples.pas',
  liss.Students in '..\LISS\liss.Students.pas',
  liss.hello in '..\LISS\liss.hello.pas',
  liss.Teachers in '..\LISS\liss.Teachers.pas',
  liss.base in '..\LISS\liss.base.pas',
  liss.Classes in '..\LISS\liss.Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
