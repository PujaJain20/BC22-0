codeunit 50183 CollectInvcrmemo
{
    trigger OnRun()
    begin

    end;

    procedure CountInvCrmemo(CustNo: Code[20])
    var
        myInt: Integer;
    begin
        SalesInvLine.SetRange("Sell-to Customer No.", CustNo);
        SalesInvRecord := SalesInvLine.Count;

        SalesCrMemo.SetRange("Sell-to Customer No.", CustNo);
        SalesCrRecord := SalesCrMemo.Count;


    end;






    var
        myInt: Integer;
        Customer: Record Customer;
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemo: Record "Sales Cr.Memo Line";
        SalesInvRecord: Integer;
        SalesCrRecord: Integer;
}