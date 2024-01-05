tableextension 50234 salesLineEx extends "Sales Line"
{
    fields
    {

        field(50235; ToT; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50236; "Reference No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        //AGT_PJ_02122023++
        modify("Planned Delivery Date")
        {
            trigger OnAfterValidate()
            var

            begin
                styexptext := Changecolor.Changefieldvaluecolor(Rec);
            end;
        }
        modify("Planned Shipment Date")
        {
            trigger OnAfterValidate()
            var

            begin
                styexptext := Changecolor.Changefieldvaluecolor(Rec);
            end;
        }
        modify("Shipment Date")
        {
            trigger OnAfterValidate()
            var

            begin
                styexptext := Changecolor.Changefieldvaluecolor(Rec);
            end;
        }

        //AGT_PJ_02122023--
        field(50237; "Qty. on Available"; Decimal)
        {
            //AGT_PJ_05012023 ++
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Qty. available" where("No." = field("No.")));
            Editable = false;
            //AGT_PJ_05012023 --
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

        styexptext: Text;
        Changecolor: Codeunit "Custom Codeunit";
}