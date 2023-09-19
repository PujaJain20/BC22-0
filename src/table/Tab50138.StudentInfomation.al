table 50138 StudentInfomation
{
    Caption = 'Test1';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(2; Id; Text[100])
        {
            Caption = 'Id';
        }
        field(3; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = Tobeclassified;
        }
        field(4; City; Text[100])
        {
            DataClassification = Tobeclassified;
        }
        field(5; State; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
}
