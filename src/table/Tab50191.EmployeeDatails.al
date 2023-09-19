table 50191 "Employee Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Text[50])
        {
            DataClassification = ToBeClassified;


        }
        field(2; "Emp Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "City"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Company Name"; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Contact Information"; BigInteger)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Contact Information" <> 10 then begin
                    Error('Invalid number');

                end;
            end;

        }
        field(6; Deapartment; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "ID proof Name"; Option)
        {
            OptionMembers = " ","Aadhar Card","Pan Card","Voter ID";



        }
        field(11; "ID Proof"; Text[50])
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "ID proof Name" = "ID proof Name"::"Aadhar Card" then begin
                    if StrLen("ID Proof") <> 12 then
                        Error('Invalid Aadhar  Number');
                end;

                if "ID proof Name" = "ID proof Name"::"Pan Card" then begin
                    if StrLen("ID Proof") <> 10 then
                        Error('Invalid Pan number');
                end;
                if "ID proof Name" = "ID proof Name"::"Voter ID" then begin
                    if StrLen("ID Proof") <> 10 then
                        Error('Invalid Pan number');
                end;







            end;

        }
        field(8; "Joining Date"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Emp Position"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Company City"; Text[50])
        {
            DataClassification = ToBeClassified;
        }






    }

    keys
    {
        key(Key1; ID, "Emp Name", "ID Proof")
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