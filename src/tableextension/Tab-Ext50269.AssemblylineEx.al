tableextension 50269 AssemblylineEx extends "Assembly Line"
{
    fields
    //AGT_PJ_04/01/2023++
    {
        // Add changes to table fields here

        field(50270; "Qty. on Hand"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50271; "Qty. on Available"; Decimal)
        {

            CalcFormula = lookup(Item."Qty. available" where("No." = field("No.")));
            FieldClass = FlowField;
            Editable = false;

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
    //AGT_PJ_04/01/2023--


    var
        Items: Record Item;
}