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

    begin

        if Customer.Get(customerNo) then begin
            repeat
                salesInvoiceHeader."Customer Group" := Customer."Customer Group";
                salesInvoiceHeader.Modify();
            until salesInvoiceHeader.Next() = 0;


        end;





    end;








    var

        Customer: Record Customer;
        salesInvoiceHeader: Record "Sales Invoice Header";
        CustomerRecref: RecordRef;
        SalesInvoiveHeader: RecordRef;
        CustomerFieldref: FieldRef;


}