pageextension 50132 salesInvoiceLine extends "Posted Sales Invoice Subform"
{
    layout
    {
        addbefore(Description)
        {
            field(Student_Name2; Rec.Student_Name2) { }
            field(Student_Address2; Rec.Student_Address2) { }
            field(Student_email; Rec.Student_email) { }
            field(Student_city; Rec.Student_city) { }
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}