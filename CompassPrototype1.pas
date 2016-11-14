unit CompassPrototype1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Chilkat_v9_5_0_TLB, StdCtrls, Registry, ExtCtrls, clipBrd, CompassPullSamples,
  compassPushSamples, OXmlPDOM, OXmlUtils;

type
  TForm5 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

function make_iso8601_date(_dateTime: TDateTime): string;
var s: string;
begin
  s:= FormatDateTime('YYYYMMDD',_dateTime);
  S:= S+'T';
  s:= S + FormatDateTime('HHNNSS',_dateTime);
  Result := '<dateTime.iso8601>'+s+'</dateTime.iso8601>';
end;


procedure TForm5.Button1Click(Sender: TObject);
var
http: TChilkatHttp;
success: Integer;
_xml_toGo: WideString;
xmlResponse: WideString;
ChilKatInstalled: boolean;
_OkSTring: string;
begin
ChilKatInstalled:= False;
with TRegistry.Create do
try
 RootKey:= HKEY_CLASSES_ROOT;
 ChilKatInstalled:= OpenKeyReadOnly('Chilkat_9_5_0.Http');
 if not ChilKatInstalled then
    ChilKatInstalled:= OpenKeyReadOnly('Chilkat_9_5_0.Http.1');
finally
 free;
end;
if not ChilKatInstalled  then
begin
  MessageDlg('Library for Console connection is not installed please contact Timechart support for more information',
             mtWarning,[mbOk],0);
  exit;
end;

http := TChilkatHttp.Create(Self);
//  Any string unlocks the component for the 1st 30-days.
success := http.UnlockComponent('JMSCRK.CB11017_bkdBWCzt3clW');
if (success <> 1) then
  begin
    Memo1.Lines.Add(http.LastErrorText);
    Exit;
  end;



_xml_toGo := xml_getStudents;
_xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);

//clipBoard.AsText :=  _xml_toGo;
//showMessage(_xml_toGo);

xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
if (http.LastMethodSuccess <> 1) then
  begin
    Memo1.Lines.Add(http.LastErrorText);
    Exit;
  end;

Memo1.Lines.Add(xmlResponse);
clipBoard.AsText :=  xmlResponse;
if pos('<name>lissversion</name>', lowercase(xmlResponse)) > 0 then
begin
   _OkSTring:= 'Connection: OK.  We have sent the "liss.hello" command and got the expected reply.  It works. ';
   Memo1.Lines.Add('=============================================');
   Memo1.Lines.Add(_OkSTring);
   MessageDlg(_OkSTring,mtInformation,[mbOk],0);
  exit;
end
//else
//  MessageDlg('Connection: Not OK.  We have sent the "liss.hello" command and NOT got the expected reply. Please contact Jim.',
//             mtWarning,[mbOk],0);


end;

end.
