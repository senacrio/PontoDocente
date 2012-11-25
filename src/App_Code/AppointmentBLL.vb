Imports Microsoft.VisualBasic
Imports System.Net.Mail

Public Class AppointmentBLL
    ' This class formats and sends a meeting request via SMTP email

    Public StartDate As DateTime
    Public EndDate As DateTime
    Public Subject As String
    Public Summary As String
    Public Location As String
    Public AttendeeName As String
    Public AttendeeEmail As String
    Public OrganizerName As String
    Public OrganizerEmail As String

    Public Sub New(ByVal pdtStartDate As DateTime, _
                    ByVal pdtEndDate As DateTime, _
                    ByVal psSubject As String, _
                    ByVal psSummary As String, _
                    ByVal psLocation As String, _
                    ByVal psAttendeeName As String, _
                    ByVal psAttendeeEmail As String, _
                    ByVal psOrganizerName As String, _
                    ByVal psOrganizerEmail As String)

        ' Copy constructor parameters to public propeties

        StartDate = pdtStartDate
        EndDate = pdtEndDate
        Subject = psSubject
        Summary = psSummary
        Location = psLocation
        AttendeeName = psAttendeeName
        AttendeeEmail = psAttendeeEmail
        OrganizerName = psOrganizerName
        OrganizerEmail = psOrganizerEmail
    End Sub
   

    Public Sub EmailAppointment()

        ' Send the calendar message to the attendee

        Dim loMsg As New MailMessage
        Dim loTextView As AlternateView = Nothing
        Dim loHTMLView As AlternateView = Nothing
        Dim loCalendarView As AlternateView = Nothing
        Dim loSMTPServer As New SmtpClient

        'loSMTPServer.EnableSsl = True
        ' SMTP settings set up in web.config such as:
        '  <system.net>
        '   <mailSettings>
        '    <smtp>
        '     <network
        '       host = "exchange.mycompany.com"
        '       port = "25"
        '       userName = "username"
        '       password="password" />
        '    </smtp>
        '   </mailSettings>
        '  </system.net>
        loSMTPServer.Host = "172.16.0.3"
        loSMTPServer.Port = "25"
        loSMTPServer.UseDefaultCredentials = False

        ' Set up the different mime types contained in the message
        Dim loTextType As System.Net.Mime.ContentType = New System.Net.Mime.ContentType("text/plain")
        Dim loHTMLType As System.Net.Mime.ContentType = New System.Net.Mime.ContentType("text/html")
        Dim loCalendarType As System.Net.Mime.ContentType = New System.Net.Mime.ContentType("text/calendar")

        ' Add parameters to the calendar header
        loCalendarType.Parameters.Add("method", "REQUEST")
        loCalendarType.Parameters.Add("name", "meeting.ics")

        ' Create message body parts
        loTextView = AlternateView.CreateAlternateViewFromString(BodyText(), loTextType)
        loMsg.AlternateViews.Add(loTextView)

        loHTMLView = AlternateView.CreateAlternateViewFromString(BodyHTML(), loHTMLType)
        loMsg.AlternateViews.Add(loHTMLView)

        loCalendarView = AlternateView.CreateAlternateViewFromString(VCalendar(), loCalendarType)
        loCalendarView.TransferEncoding = Net.Mime.TransferEncoding.SevenBit
        loMsg.AlternateViews.Add(loCalendarView)

        ' Adress the message

        loMsg.From = New MailAddress(OrganizerEmail)
        loMsg.To.Add(New MailAddress(AttendeeEmail))
        loMsg.Subject = Subject

        ' Send the message
        'loSMTPServer.DeliveryMethod = SmtpDeliveryMethod.Network
        loSMTPServer.Send(loMsg)
    End Sub

    Public Function BodyText() As String

        ' Return the Body in text format

        Const BODY_TEXT = _
            "Tipo:" & vbCrLf & _
            "Organizador: {0}" & vbCrLf & _
            "Começo:{1}" & vbCrLf & _
            "Término:{2}" & vbCrLf & _
            "Time Zone:{3}" & vbCrLf & _
            "Local: {4}" & vbCrLf & _
            vbCrLf & _
            "*~*~*~*~*~*~*~*~*~*" & vbCrLf & _
            vbCrLf & _
            "{5}"

        Return String.Format(BODY_TEXT, _
                            OrganizerName, _
                            StartDate.ToLongDateString & " " & StartDate.ToLongTimeString, _
                            EndDate.ToLongDateString & " " & EndDate.ToLongTimeString, _
                            System.TimeZone.CurrentTimeZone.StandardName, _
                            Location, _
                            Summary)

    End Function

    Public Function BodyHTML() As String

        ' Return the Body in HTML format

        Const BODY_HTML = _
                "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 3.2//EN"">" & vbCrLf & _
                "<HTML>" & vbCrLf & _
                "<HEAD>" & vbCrLf & _
                "<META HTTP-EQUIV=""Content-Type"" CONTENT=""text/html; charset=utf-8"">" & vbCrLf & _
                "<META NAME=""Generator"" CONTENT=""MS Exchange Server version 6.5.7652.24"">" & vbCrLf & _
                "<TITLE>{0}</TITLE>" & vbCrLf & _
                "</HEAD>" & vbCrLf & _
                "<BODY>" & vbCrLf & _
                "<!-- Converted from text/plain format -->" & vbCrLf & _
                "<P><FONT SIZE=2>Type:Single Meeting<BR>" & vbCrLf & _
                "Organizador:{1}<BR>" & vbCrLf & _
                "Começo:{2}<BR>" & vbCrLf & _
                "Término:{3}<BR>" & vbCrLf & _
                "Time Zone:{4}<BR>" & vbCrLf & _
                "Local:{5}<BR>" & vbCrLf & _
                "<BR>" & vbCrLf & _
                "*~*~*~*~*~*~*~*~*~*<BR>" & vbCrLf & _
                "<BR>" & vbCrLf & _
                "{6}<BR>" & vbCrLf & _
                "</FONT>" & vbCrLf & _
                "</P>" & vbCrLf & _
                vbCrLf & _
                "</BODY>" & vbCrLf & _
                "</HTML>"

        Return String.Format(BODY_HTML, _
                            Summary, _
                            OrganizerName, _
                            StartDate.ToLongDateString & " " & StartDate.ToLongTimeString, _
                            EndDate.ToLongDateString & " " & EndDate.ToLongTimeString, _
                            System.TimeZone.CurrentTimeZone.StandardName, _
                            Location, _
                            Summary)

    End Function

    Public Function VCalendar() As String

        ' Return the Calendar text in vCalendar format, compatible with most calendar programs

        Const lcDateFormat = "yyyyMMddTHHmmssZ"
        Dim loGUID As Guid = Guid.NewGuid  ' Or use the guid of an exiting meeting?

        Const VCAL_FILE = "BEGIN:VCALENDAR" & vbCrLf & _
        "METHOD:REQUEST" & vbCrLf & _
        "PRODID:Microsoft CDO for Microsoft Exchange" & vbCrLf & _
        "VERSION:2.0" & vbCrLf & _
        "BEGIN:VTIMEZONE" & vbCrLf & _
        "TZID:(GMT-06.00) Central Time (US & Canada)" & vbCrLf & _
        "X-MICROSOFT-CDO-TZID:11" & vbCrLf & _
        "BEGIN:STANDARD" & vbCrLf & _
        "DTSTART:16010101T020000" & vbCrLf & _
        "TZOFFSETFROM:-0500" & vbCrLf & _
        "TZOFFSETTO:-0600" & vbCrLf & _
        "RRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=11;BYDAY=1SU" & vbCrLf & _
        "END:STANDARD" & vbCrLf & _
        "BEGIN:DAYLIGHT" & vbCrLf & _
        "DTSTART:16010101T020000" & vbCrLf & _
        "TZOFFSETFROM:-0600" & vbCrLf & _
        "TZOFFSETTO:-0500" & vbCrLf & _
        "RRULE:FREQ=YEARLY;WKST=MO;INTERVAL=1;BYMONTH=3;BYDAY=2SU" & vbCrLf & _
        "END:DAYLIGHT" & vbCrLf & _
        "END:VTIMEZONE" & vbCrLf & _
        "BEGIN:VEVENT" & vbCrLf & _
        "DTSTAMP:{8}" & vbCrLf & _
        "DTSTART:{0}" & vbCrLf & _
        "SUMMARY:{7}" & vbCrLf & _
        "UID:{5}" & vbCrLf & _
        "ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TRUE;CN=""{9}"":MAILTO:{9}" & vbCrLf & _
        "ACTION;RSVP=TRUE;CN=""{4}"":MAILTO:{4}" & vbCrLf & _
        "ORGANIZER;CN=""{3}"":mailto:{4}" & vbCrLf & _
        "LOCATION:{2}" & vbCrLf & _
        "DTEND:{1}" & vbCrLf & _
        "DESCRIPTION:{7}\N" & vbCrLf & _
        "SEQUENCE:1" & vbCrLf & _
        "PRIORITY:5" & vbCrLf & _
        "CLASS:" & vbCrLf & _
        "CREATED:{8}" & vbCrLf & _
        "LAST-MODIFIED:{8}" & vbCrLf & _
        "STATUS:CONFIRMED" & vbCrLf & _
        "TRANSP:OPAQUE" & vbCrLf & _
        "X-MICROSOFT-CDO-BUSYSTATUS:BUSY" & vbCrLf & _
        "X-MICROSOFT-CDO-INSTTYPE:0" & vbCrLf & _
        "X-MICROSOFT-CDO-INTENDEDSTATUS:BUSY" & vbCrLf & _
        "X-MICROSOFT-CDO-ALLDAYEVENT:FALSE" & vbCrLf & _
        "X-MICROSOFT-CDO-IMPORTANCE:1" & vbCrLf & _
        "X-MICROSOFT-CDO-OWNERAPPTID:-1" & vbCrLf & _
        "X-MICROSOFT-CDO-ATTENDEE-CRITICAL-CHANGE:{8}" & vbCrLf & _
        "X-MICROSOFT-CDO-OWNER-CRITICAL-CHANGE:{8}" & vbCrLf & _
        "BEGIN:VALARM" & vbCrLf & _
        "ACTION:DISPLAY" & vbCrLf & _
        "DESCRIPTION:REMINDER" & vbCrLf & _
        "TRIGGER;RELATED=START:-PT00H15M00S" & vbCrLf & _
        "END:VALARM" & vbCrLf & _
        "END:VEVENT" & vbCrLf & _
        "END:VCALENDAR" & vbCrLf

        Return String.Format(VCAL_FILE, _
                            StartDate.ToUniversalTime().ToString(lcDateFormat), _
                            EndDate.ToUniversalTime().ToString(lcDateFormat), _
                            Location, _
                            OrganizerName, _
                            OrganizerEmail, _
                            "{" & loGUID.ToString() & "}", _
                            Summary, _
                            Subject, _
                            Now.ToUniversalTime().ToString(lcDateFormat), _
                            AttendeeEmail)
    End Function

End Class