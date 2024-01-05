pageextension 50213 companyInformationEx extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
        modify("VAT Registration No.")
        {
            Visible = true;
            ApplicationArea = all;
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}