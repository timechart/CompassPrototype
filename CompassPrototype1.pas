unit CompassPrototype1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Chilkat_v9_5_0_TLB, StdCtrls, Registry, ExtCtrls, clipBrd, CompassPullSamples,
  compassPushSamples, OXmlPDOM, OXmlUtils, liss.Students, liss.hello, liss.Teachers;

type
  TForm5 = class(TForm)
  // test change for tower git
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    XML_file: string;
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
    success := http.UnlockComponent('JMSCRK.CB11017_bkdBWCzt3clW');
    if (success <> 1) then
    begin
      Memo1.Lines.Add(http.LastErrorText);
      Exit;
    end;
    _xml_toGo := xml_hello;
    _xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);
    xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
    if not LissHello.loadFromXML(xmlResponse) then
      exit;
    _xml_toGo := xml_getStudents;
    _xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);
    xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
    if not LissStudentList.loadFromXML(xmlResponse) then
      exit;
    _xml_toGo := xml_getTeachers; //xml_getTeachers;     //xml_publishTeachers
    _xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);
    clipboard.AsText:=   _xml_toGo;
    showMessage(_xml_toGo);
    xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
    clipboard.AsText:=   xmlResponse;
    memo1.Text := xmlResponse;
    if (http.LastMethodSuccess <> 1) then
    begin
        Memo1.Lines.Add(http.LastErrorText);
        Exit;
    end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
   XML_file := ExtractFIlePath(APplication.exename)+'xml_from_compass.xml';
end;

end.
