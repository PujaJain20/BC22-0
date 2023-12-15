tableextension 50255 NonstockEx extends "Nonstock Item"
{
    fields
    {
        // Add changes to table fields here
        field(50256; "Lead time calculation"; DateFormula)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Lead Time Calculation" where("Vendor No." = field("Vendor No."),
            "Vendor Item No." = field("Vendor Item No.")));
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