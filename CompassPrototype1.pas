unit CompassPrototype1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Chilkat_v9_5_0_TLB, StdCtrls, Registry, ExtCtrls, clipBrd, CompassPullSamples,
  compassPushSamples, OXmlPDOM, OXmlUtils, liss.Students, liss.hello, liss.Teachers, liss.Classes;

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
begin
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
    _xml_toGo := LissHello.BuildRequestXML;
    _xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);
    xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
    if not LissHello.loadFromXML(xmlResponse) then
      exit;
    _xml_toGo := LissStudentList.BuildRequestXML;
    _xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);
    xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
    if not LissStudentList.loadFromXML(xmlResponse) then
      exit;
    _xml_toGo := LissTeacherList.BuildRequestXML; //xml_getTeachers;     //xml_publishTeachers
    _xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);
    xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
    if not  LissTeacherList.loadFromXML(xmlResponse) then
      Exit;
    _xml_toGo := LissClassList.BuildPublishXML;
    _xml_toGo := StringReplace(_xml_toGo, '[TIMESTAMP]', make_iso8601_date(Now), [rfReplaceAll, rfIgnoreCase]);
    clipBoard.asText:=  _xml_toGo;
    xmlResponse := http.XmlRpc('https://liss-test.compass.edu.au/Services/Liss/Test/?academicYear=2016',_xml_toGo);
    memo1.Text := xmlResponse;
    if (http.LastMethodSuccess <> 1) then
    begin
        Memo1.Lines.Add(http.LastErrorText);
        Exit;
    end;
(*
<?xml version="1.0"?>
<methodResponse>
  <params>
    <param>
      <value>
        <string />
      </value>
    </param>
  </params>
</methodResponse>
*)
end;


procedure TForm5.FormCreate(Sender: TObject);
begin
   XML_file := ExtractFIlePath(APplication.exename)+'xml_from_compass.xml';
end;

end.
