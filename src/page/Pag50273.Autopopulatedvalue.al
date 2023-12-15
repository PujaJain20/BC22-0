page 50273 Autopopulatedvalue
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = standardvalue;



    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;

                }
                field(StandardEnum; Rec.StandardEnum)
                {
                    ApplicationArea = all;
                }

            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;





            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        rec.Insert(true);

    end;

    var
        myInt: Integer;
        value: Text[100];
        No: Text[100];
        Populatedvalue: Page Autopopulatedvalue;
        updatevalue: Record standardvalue;


}