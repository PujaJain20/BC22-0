pageextension 50268 ContactCardEX extends "Contact Card"
{
    layout
    {

        // Add changes to page layout here
        addafter("E-Mail")
        {
            field("BIlling E-mail"; Rec."BIlling E-mail")
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