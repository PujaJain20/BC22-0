tableextension 50193 "Item Ex" extends Item
{
    fields
    {
        field(50194; color; Option)
        {
            OptionMembers = Red,Black,Green,Yellow,Blue;
            DataClassification = ToBeClassified;
        }
        field(50195; Style; Option)
        {
            OptionMembers = Arial,"Arial Narrow","Bell Mt";
            DataClassification = ToBeClassified;
        }
        field(50196; "Vendor Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));

        }
        field(50197; "Qty. available"; Decimal)
        {
            DataClassification = ToBeClassified;

        }


        modify("Qty. on Asm. Component")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                CalculateQtyonAvalible();
            end;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                //  CalculateQtyonAvalible();
            end;
        }


    }


    procedure CalculateQtyonAvalible()
    var

    begin
        Rec.CalcFields(Inventory, "Qty. on Sales Order", "Qty. on Asm. Component");
        Rec."Qty. available" := Rec.Inventory - Rec."Qty. on Sales Order" - Rec."Qty. on Asm. Component";

        //CurrPage.Update(true);
        rec.Modify();


    end;


    var
        ven: Record Vendor;
        item: Record item;
}