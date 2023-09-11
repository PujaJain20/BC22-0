pageextension 50142 salesorder extends "Sales Order"
{
    layout
    {
        addafter("Due Date")
        {

            field("No. of Item"; Rec."NO.of Item")
            {
                ApplicationArea = all;
                Caption = 'NO. of Item Lines';

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    // trigger OnAfterGetRecord()
    // var

    // begin
    //     sales_line.Reset();
    //     sales_line.SetRange("Document Type", Rec."Document Type");
    //     sales_line.SetRange("Document No.", Rec."No.");

    //     if sales_line.FindSet() then
    //         repeat
    //             if sales_line.Type = sales_line.Type::Item then begin
    //                 Rec."No.of item" += 1;
    //             end;

    //         until sales_line.Next() = 0;

    // end;








    var
        myInt: Integer;
        sales_line: Record "Sales Line";
        salesHeader: Record "Sales Header";
        SampleCodeunit: Codeunit SampleCodeunit;
}