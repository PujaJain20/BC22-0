table 50256 standardvalue
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; ID; text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; StandardEnum; Enum Enumobject)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; ID)
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