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
                field(value; value)
                {
                    ApplicationArea = All;

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

                trigger OnAction()
                var
                    Populatedvalue: Page Autopopulatedvalue;

                begin
                    //  if Populatedvalue.RunModal() = Action::OK then
                    //    AutopopulateValue();

                end;
            }
        }
    }
    procedure AutopopulateValue(new: Code[20])
    var
        Autopopulate: Record AutomaticallyValue;

    begin
        new := value;

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        Autopopulate: Record AutomaticallyValue;

    begin
        No := value;
    end;

    var
        myInt: Integer;
        value: Text[100];
        No: Text[100];

}