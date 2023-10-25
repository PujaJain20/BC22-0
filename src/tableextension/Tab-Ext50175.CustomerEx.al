tableextension 50175 CustomerEx extends Customer
{
    fields
    {
        field(50176; "Payment selection method"; Option)
        {
            OptionMembers = Days,Week,Monthly,Year;
            DataClassification = ToBeClassified;
        }
        field(50177; "Customer Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
    }


    var
        myInt: Integer;
}