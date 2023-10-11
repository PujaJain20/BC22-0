codeunit 50156 "Custom Codeunit"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Standard Purchase - Order" then
            NewReportId := Report::CustomPurchaseorder;
    end;



    var
        myInt: Integer;
}