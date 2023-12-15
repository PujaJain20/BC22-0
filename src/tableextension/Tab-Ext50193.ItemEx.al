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



    }

    var
        ven: Record Vendor;
        item: Record item;
}