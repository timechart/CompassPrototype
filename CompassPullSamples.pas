unit CompassPullSamples;

interface

const

xml_hello =
          '<?xml version="1.0"?>'+#13+
          '<methodCall>'+#13+
          '<methodName>liss.hello</methodName>'+#13+        //  liss.getRooms    liss.hello
          '</methodCall>';

//getTimetableStructures(auth : AuthorisationObject, asAtDate : timestamp)
xml_getTimetableStructures =
'<?xml version="1.0"?>'+#13+
          '<methodCall>'+#13+
          '<methodName>liss.getTimetableStructures</methodName>'+#13+        //  liss.getRooms    liss.hello
          '<params>'+#13+
             '<param>'+#13+
              '<value>'+#13+
                '<struct>'+#13+
                 '<member><name>School</name><value>TimeChart</value></member>'+#13+
                 '<member><name>UserName</name><value>TTUSER1</value></member>'+#13+
                 '<member><name>Password</name><value>26c5d2f9-aac0-43d8-959b-7a4c14d8b223</value></member>'+#13+
                 '<member><name>LissVersion</name><value><i4>10002</i4></value></member>'+#13+
                 '<member><name>UserAgent</name><value>Timetable Software v1</value></member>'+#13+
                 '<member><name>cyclicalPath</name><value>C:\MyFile.timetableFile</value></member>'+#13+
                 '</struct>'+#13+
              '</value>'+#13+
             '</param>'+#13+
             '<param>'+#13+
             '  <value>'+#13+
             '     [TIMESTAMP]'+#13+     //<dateTime.iso8601>20160714T23:59:00</dateTime.iso8601>'+#13+
             '  </value> '+#13+
             '</param>'+#13+
          '</params>'+#13+
          '</methodCall>';


//liss.getTeachers(auth : AuthorisationObject, asAtDate : timestamp)
xml_getTeachers =
'<?xml version="1.0"?>'+#13+
          '<methodCall>'+#13+
          '<methodName>liss.getTeachers</methodName>'+#13+        //  liss.getRooms    liss.hello
          '<params>'+#13+
             '<param>'+#13+
              '<value>'+#13+
                '<struct>'+#13+
                 '<member><name>School</name><value>TimeChart</value></member>'+#13+
                 '<member><name>UserName</name><value>TTUSER1</value></member>'+#13+
                 '<member><name>Password</name><value>26c5d2f9-aac0-43d8-959b-7a4c14d8b223</value></member>'+#13+
                 '<member><name>LissVersion</name><value><i4>10002</i4></value></member>'+#13+
                 '<member><name>UserAgent</name><value>Timetable Software v1</value></member>'+#13+
                 '<member><name>cyclicalPath</name><value>C:\MyFile.timetableFile</value></member>'+#13+
                 '</struct>'+#13+
              '</value>'+#13+
             '</param>'+#13+
             '<param>'+#13+
             '  <value>'+#13+
             '     [TIMESTAMP]'+#13+     //<dateTime.iso8601>20160714T23:59:00</dateTime.iso8601>'+#13+
             '  </value> '+#13+
             '</param>'+#13+
          '</params>'+#13+
          '</methodCall>';


xml_GetRooms =
              '<?xml version="1.0"?>'+#13+
              '<methodCall>'+#13+
                '<methodName>liss.getRooms</methodName>'+ #13+             // liss.getRooms
                '<params>'+#13+
                 '<param>'+#13+
                  '<value>'+#13+
                    '<struct>'+#13+
                     '<member><name>School</name><value>TimeChart</value></member>'+#13+
                     '<member><name>UserName</name><value>TTUSER1</value></member>'+#13+
                     '<member><name>Password</name><value>26c5d2f9-aac0-43d8-959b-7a4c14d8b223</value></member>'+#13+
                     '<member><name>LissVersion</name><value><i4>10002</i4></value></member>'+#13+
                     '<member><name>UserAgent</name><value>Timetable Software v1</value></member>'+#13+
                     '<member><name>cyclicalPath</name><value>C:\MyFile.timetableFile</value></member>'+#13+
                     '</struct>'+#13+
                  '</value>'+#13+
                 '</param>'+#13+
                '</params>'+#13+
              '</methodCall>';


xml_getStudents =
          '<?xml version="1.0"?>'+#13+
          '<methodCall>'+#13+
          '<methodName>liss.getStudents</methodName>'+#13+        //  liss.getRooms    liss.hello
          '<params>'+#13+
             '<param>'+#13+
              '<value>'+#13+
                '<struct>'+#13+
                 '<member><name>School</name><value>TimeChart</value></member>'+#13+
                 '<member><name>UserName</name><value>TTUSER1</value></member>'+#13+
                 '<member><name>Password</name><value>26c5d2f9-aac0-43d8-959b-7a4c14d8b223</value></member>'+#13+
                 '<member><name>LissVersion</name><value><i4>10002</i4></value></member>'+#13+
                 '<member><name>UserAgent</name><value>Timetable Software v1</value></member>'+#13+
                 '<member><name>cyclicalPath</name><value>C:\MyFile.timetableFile</value></member>'+#13+
                 '</struct>'+#13+
              '</value>'+#13+
             '</param>'+#13+
             '<param>'+#13+
             '  <value>'+#13+
             '     [TIMESTAMP]'+#13+     //<dateTime.iso8601>20160714T23:59:00</dateTime.iso8601>'+#13+
             '  </value> '+#13+
             '</param>'+#13+
          '</params>'+#13+
          '</methodCall>';



implementation

end.
