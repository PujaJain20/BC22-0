tableextension 50282 SalesHeaderEx extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50283; DateCalculation; Integer)
        {
            DataClassification = ToBeClassified;

        }
        modify("Document Date")
        {
            trigger OnAfterValidate()
            var
                WDate: Date;
            begin
                WDate := System.Today();
                if ("Document Date" > WDate) then
                    Rec.DateCalculation := 0
                else
                    Rec.DateCalculation := Abs(Rec."Document Date" - WDate);




            end;
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


}