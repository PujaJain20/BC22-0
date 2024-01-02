pageextension 50210 postedpurchaseinvoice extends "Posted Purch. Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        modify("VAT %")
        {
            Visible = true;


        }


    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}