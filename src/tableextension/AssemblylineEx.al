tableextension 50269 AssemblylineEx extends "Assembly Line"
{
    fields
    {
        // Add changes to table fields here
        field(50270; "Qty. on Hand"; Decimal)
        {

            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            FieldClass = FlowField;

        }
        field(50271; "Qty. on Available"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Assembly Line"."Qty Available");



        }
        field(50272; "Qty Available"; Decimal)
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