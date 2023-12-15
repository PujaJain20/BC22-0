tableextension 50240 GejournalLine extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50235; "Discount Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50236; "Approver status"; Boolean)
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