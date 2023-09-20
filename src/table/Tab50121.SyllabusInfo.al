table 50195 SyllabusInfo
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; id; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Syllabus_Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Duration; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; fees; Decimal)
        {
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(Key1; id)
        {
            Clustered = true;
        }
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