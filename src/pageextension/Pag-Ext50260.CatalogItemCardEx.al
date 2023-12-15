pageextension 50260 CatalogItemCardEx extends "Catalog Item Card"
{
    layout
    {
        addafter("Vendor Item No.")
        {
            field("Lead time calculation"; Rec."Lead time calculation")
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