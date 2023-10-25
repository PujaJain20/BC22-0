pageextension 50175 CustomerCardEx extends "Customer Card"
{
    layout
    {
        addafter(Payments)
        {
            field("Payment selection method"; Rec."Payment selection method")
            {
                ApplicationArea = all;
            }
        }
        addafter(General)
        {
            field("Customer Group"; Rec."Customer Group")
            {
                ApplicationArea = all;
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin


    end;



    var
        myInt: Integer;
}