pageextension 50178 CustomeremplateEx extends "Customer Templ. Card"
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
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}