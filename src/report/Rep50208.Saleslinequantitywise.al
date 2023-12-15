report 50208 "Sales line quantitywise"
//label 3*4
//AGT Sales line quantitywise

{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'saleslinequantitywise.rdl';
    dataset
    {

        dataitem("Sales Line"; "Sales Line")
        {
            dataitem(pageloop; Integer)
            {
                DataItemTableView = sorting(Number);
                column(No_; "Sales Line"."No.")
                { }
                column(Quantity; "Sales Line".Quantity) { }
                column(Description; "Sales Line".Description) { }
                column(OutputNo; OutputNo) { }
                //AGT_PJ 06/12/2023
                trigger OnAfterGetRecord();
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;
                end;


                trigger OnPreDataItem();
                begin
                    if Qty = 0 then begin
                        NoOfLoops := "Sales Line".Quantity;
                        CopyText := '';
                        SETRANGE(Number, 1, NoOfLoops);
                        OutputNo := 1;
                    end
                    else begin
                        NoOfLoops := Qty;
                        CopyText := '';
                        SETRANGE(Number, 1, NoOfLoops);
                        OutputNo := 1;
                    end;
                end;

            }







        }
    }


    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                    field(Qty; Qty)
                    {

                    }


                }
            }
        }


    }







    var

        ShowUnitCost: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
        Tempcopies: Integer;
        salesline: Record "Sales Line";
        Qty: Integer;
}