page 50276 Automaticallyvalue
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = AutomaticallyValue;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(value; Rec.value)
                {
                    ApplicationArea = all;

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
            action(updatevalue)
            {
                ApplicationArea = All;


                trigger OnAction()
                var
                    Populatedvalue: Page Autopopulatedvalue;
                    updatevalue: Record standardvalue;
                begin

                    if Page.RunModal(50273) = action::LookupOK then begin
                        if updatevalue.ID <> ' ' then
                            Rec.value := updatevalue.ID;
                        Rec.StandardEnum := updatevalue.StandardEnum::Complete
                    end;








                end;
            }
        }
    }




    var
        myInt: Integer;

}