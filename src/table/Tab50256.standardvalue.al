table 50256 standardvalue
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; value; text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; value)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}