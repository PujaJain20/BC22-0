pageextension 50119 postedsalesShipment extends "Posted Sales Shipment"
{
    layout
    {
        addbefore("Order No.")
        {
            field("NO. of Item"; Rec."NO. of Item")
            {
                ApplicationArea = all;
                Caption = 'No. of Item';
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