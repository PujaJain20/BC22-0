tableextension 50199 PurchaselineExtensionpage extends "Purchase Line"
{
    fields
    {
        field(50168; BagTag; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(50169; "Total Amount Invoice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50270; "Reference No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}