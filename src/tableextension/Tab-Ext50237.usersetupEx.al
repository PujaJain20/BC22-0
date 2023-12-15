tableextension 50237 usersetupEx extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50238; "Approver E-mail"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50239; "Approver Name"; Text[50])
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