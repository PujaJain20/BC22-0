tableextension 50259 jobsetupEx extends "Jobs Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50260; "New job"; Code[20])
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