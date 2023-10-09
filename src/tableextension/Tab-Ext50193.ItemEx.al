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
    }

    var
        myInt: Integer;
}