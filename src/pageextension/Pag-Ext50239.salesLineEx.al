pageextension 50239 salesLineEx extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Qty. to Ship")
        {
            field("Reference No."; Rec."Reference No.")
            {
                ApplicationArea = all;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}