tableextension 50249 ItemledgerentryEx extends "Item Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50250; "Reference No."; Text[50])
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