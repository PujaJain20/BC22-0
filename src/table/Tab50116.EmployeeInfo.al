table 50116 EmployeeInfo
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Emp id"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Emp Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Emp Salary"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Emp address"; Code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Emp City"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Language"; Enum Subjects)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Emp id")
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