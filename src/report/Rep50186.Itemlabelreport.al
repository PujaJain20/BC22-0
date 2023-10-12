report 50186 "Item label report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Itemlabelreport.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            dataitem(copyloop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(pageloop; Integer)
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(OutputNo; OutputNo) { }
                    column(Unit_Price; Item."Unit Price") { }
                    column(No_; Item."No.") { }
                    column(Style; Item.Style) { }
                    column(color; Item.color) { }
                    column(Variantcode1; Variantcode1) { }
                    column(VariantCode; VariantCode) { }
                }
                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                ITEMVariant.Reset();
                "ItemVariant".SetRange("Item No.", Item."No.");
                if "ITEMVariant".FindFirst() then begin
                    Variant[1] := '';
                    repeat
                        Variant[1] := Variant[1] + '/' + ITEMVariant.Code;
                    until ITEMVariant.Next() = 0;
                    VariantCode1 := DelStr(Variant[1], 1, 1);
                end;
            end;
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
                    field(NoOfCopies; NoOfCopies)
                    {


                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var

        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
        "ITEMVariant": Record "Item Variant";
        "Variantcode": Code[500];
        "Variant": array[5] of Text[100];
        Variantcode1: Text[500];


}