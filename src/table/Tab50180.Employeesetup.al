table 50180 "Employee setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee No. series"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;

        }
        field(2; Pk; Code[30])
        {
            DataClassification = ToBeClassified;


        }
    }

    keys
    {
        key(Key1; Pk)
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