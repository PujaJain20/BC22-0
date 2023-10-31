codeunit 50156 "Custom Codeunit"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Standard Purchase - Order" then
            NewReportId := Report::CustomPurchaseorder;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Templ. Mgt.", OnBeforeApplyTemplate, '', false, false)]
    procedure ApplyTemplate(var Customer: Record Customer; CustomerTempl: Record "Customer Templ."; var IsHandled: Boolean)
    var
        myInt: Integer;
    begin
        Customer."Payment selection method" := CustomerTempl."Payment selection method";
    end;

    procedure Onactionapply(customerNo: code[20])
    var
        Customer: Record Customer;
        salesInvoiceHeader: Record "Sales Invoice Header";

    begin

        if Customer.Get(customerNo) then begin
            repeat
                salesInvoiceHeader."Customer Group" := Customer."Customer Group";
                salesInvoiceHeader.Modify();
            until salesInvoiceHeader.Next() = 0;


        end;

    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesDoc, '', false, false)]
    // local procedure OnAfterPostSalesDoc(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var SalesHeader: Record "Sales Header")
    // begin

    //     SendEmailWithAttachment(SalesHeader."No.");


    // end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Header", OnAfterInsertEvent, '', false, false)]
    local procedure OnafterInsertEvent(var Rec: Record "Sales Invoice Header")
    var
        myInt: Integer;
    begin
        sendemailAttechment(Rec);
    end;

    procedure sendemailAttechment(salesInvoiceHeader: Record "Sales Invoice Header")
    var
        ReportExample: Report "Standard Sales - Invoice";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        InStr: Instream;
        OutStr: OutStream;
        ReportParameters: Text;
        recref: RecordRef;
        reportSelections: Record "Report Selections";
        EmailAddress: Text;
        Xmlparemeter: Text;
        SalesReceiveSetup: Record "Sales & Receivables Setup";
        Customer: Record Customer;
        Rec: Record "Sales Invoice Header";
    // salesInvoiceHeader: Record "Sales Invoice Header";
    begin
        // if not Customer.Get(SalesInvHdrNo) then
        //     exit;
        if not Customer.Get(salesInvoiceHeader."Sell-to Customer No.") then
            exit;
        if Customer."E-Mail" = '' then
            exit;
        Rec := salesInvoiceHeader;
        Rec.SetRecFilter;
        recref.Open(Database::"Sales Invoice Header");
        recref.SetView(Rec.GetView);
        recref.SetTable(Rec);
        //ReportParameters := ReportExample.RunRequestPage();
        TempBlob.CreateInStream(InStr);
        TempBlob.CreateOutStream(OutStr);
        reportSelections.Reset();
        reportSelections.SetRange(Usage, reportSelections.Usage::"S.Invoice");
        reportSelections.FindFirst;
        reportSelections.TestField("Report ID");
        if Report.SaveAs(reportSelections."Report ID", ReportParameters, ReportFormat::Pdf, OutStr, recref) then begin
            EmailAddress := Customer."E-Mail";
            EmailMessage.Create(EmailAddress, 'This is the subject', 'This is the body');
            EmailMessage.AddAttachment('FileName.pdf', 'PDF', InStr);
            if Email.Send(EmailMessage) then
                Message('Email sent %1', Customer."E-Mail");


        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', true, true)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        employeeInformation: Record EmployeeInformation;
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::EmployeeInformation:
                begin
                    RecRef.Open(DATABASE::EmployeeInformation);
                    if EmployeeInformation.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(employeeInformation);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', true, true)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::EmployeeInformation:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', true, true)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::EmployeeInformation:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;























    var


        CustomerRecref: RecordRef;
        SalesInvoiveHeader: RecordRef;
        CustomerFieldref: FieldRef;


}