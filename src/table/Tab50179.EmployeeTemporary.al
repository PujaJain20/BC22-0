table 50179 "Employee Temporary"
{
    DataClassification = ToBeClassified;
    TableType = Temporary;





    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Address; Text[100])
        {
            DataClassification = ToBeClassified;

        }


    }

    keys
    {
        key(Key1; "No.")
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