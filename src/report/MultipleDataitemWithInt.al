report 50178 MultipleitemwithIntReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MultipleitemwithInt.rdl';


    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = where("No." = const('20000'));

            column(No_; "No.") { }

            dataitem(Integer; Integer)
            {

                column(CustoNo_; "CustoNo.") { }
                column(DocNO_; "DocNO.") { }
                column(LineNo_; "LineNo.") { }
                column(TypeValue; TypeValue) { }
                column(ItemNo; ItemNo) { }
                column(Amt; Amt) { }
                column(DocType; DocType) { }

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    CountInvCrmemo(Vendor."No.");
                    if (SalesInvRecord + SalesCrRecord) = 0 then
                        CurrReport.Break();
                    Integer.SetFilter(Number, '%1..%2', 1, (SalesInvRecord + SalesCrRecord));
                    SalesInvLine.FindSet();
                    SalesCrMemo.FindSet();


                end;


                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    if Integer.Number <= SalesInvRecord then begin
                        "CustoNo." := SalesInvLine."Sell-to Customer No.";
                        "DocNO." := SalesInvLine."Document No.";
                        TypeValue := Format(SalesInvLine.Type);
                        ItemNo := SalesInvLine."No.";
                        "LineNo." := SalesInvLine."Line No.";
                        DocType := 'Invoice';
                        Amt := SalesInvLine.Amount;
                        SalesInvLine.Next();
                    end
                    else begin
                        "CustoNo." := SalesCrMemo."Sell-to Customer No.";
                        "DocNO." := SalesCrMemo."Document No.";
                        TypeValue := Format(SalesCrMemo.Type);
                        ItemNo := SalesCrMemo."No.";
                        "LineNo." := SalesCrMemo."Line No.";
                        DocType := 'CrMemo';
                        Amt := SalesCrMemo.Amount;
                        SalesCrMemo.Next();
                    end
                end;
            }


        }


    }

    procedure CountInvCrmemo(CustNo: Code[20])
    var
        myInt: Integer;
    begin
        SalesInvLine.Reset();
        SalesInvLine.SetFilter("Sell-to Customer No.", CustNo);
        SalesInvRecord := SalesInvLine.Count;
        SalesCrMemo.Reset();
        SalesCrMemo.SetFilter("Sell-to Customer No.", CustNo);
        SalesCrRecord := SalesCrMemo.Count;


    end;









    var
        myInt: Integer;
        SalesInvCrMemoCodeunit: Codeunit CollectInvcrmemo;

        CustomerRec: Record Customer;
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemo: Record "Sales Cr.Memo Line";
        SalesInvRecord: Integer;
        SalesCrRecord: Integer;
        "CustoNo.": Code[20];
        "DocNO.": Code[20];
        "LineNo.": Integer;
        TypeValue: Text[20];
        ItemNo: Code[20];
        DocType: Text;
        Amt: Decimal;

}