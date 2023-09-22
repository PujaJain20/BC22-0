page 50180 "Employee setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Employee setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Employee No. series"; Rec."Employee No. series")
                {
                    ApplicationArea = All;

                }
            }

        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if Rec.IsEmpty then
            Rec.Insert()
    end;



    var
        myInt: Integer;
}