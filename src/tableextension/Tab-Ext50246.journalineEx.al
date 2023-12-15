tableextension 50246 journalineEx extends "Item Journal Line"
{
    fields
    {
        field(50247; "Reference No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}