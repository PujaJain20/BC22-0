table 50192 "Employee TimeSheet Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "S.No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;




        }


        field(2; Month; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Date; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Project Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Task Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Hours; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Emp Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "ID"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Details".ID;

        }
        field(11; Year; Text[50])
        {
            DataClassification = ToBeClassified;
        }




    }

    keys
    {
        key(Key1; "S.No.")
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