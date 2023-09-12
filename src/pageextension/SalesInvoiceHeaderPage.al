pageextension 50127 SalesinvoiceHeader extends "Posted Sales Invoice"
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
        }
    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}