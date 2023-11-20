tableextension 50234 salesLineEx extends "Sales Line"
{
    fields
    {

        field(50235; ToT; Decimal)
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