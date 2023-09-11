pageextension 50139 SalesinvoiceHeader extends "Posted Sales Invoice"
{
    layout
    {
        addfirst(General)
        {
            field(Student_No; Rec.Student_No)
            {
                ApplicationArea = all;
            }
            field(Student_Name; Rec.Student_Name)
            {
                ApplicationArea = all;
            }
            field(Student_Address; Rec.Student_Address)
            {
                ApplicationArea = all;
            }
            field(Student_city; Rec.Student_city)
            {
                ApplicationArea = all;
            }
            field("No. of Item"; Rec."No. of Item")
            {
                ApplicationArea = all;
                Caption = 'No. of item';
            }
        }
    }


    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin

    end;

    var
        myInt: Integer;
}