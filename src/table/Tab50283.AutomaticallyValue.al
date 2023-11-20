table 50283 AutomaticallyValue
{
    DataClassification = ToBeClassified;

    fields
    {
        
        field(3; Id; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; StandardEnum; Enum Enumobject)
        {


        }
    }

    keys
    {
        key(Key1; Id)
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