tableextension 50178 CustomerTemplateEx extends "Customer Templ."
{
    fields
    {
        field(50171; "Payment selection method"; Option)
        {
            OptionMembers = Days,Week,Monthly,Year;
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
}