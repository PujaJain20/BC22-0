pageextension 50148 CustomerEx extends "Customer list"
{
    layout
    {
        // Add changes to page layout here
    }
    actions
    {
        addafter(PricesAndDiscounts)
        {
            action(Event_subscriber)
            {
                ApplicationArea = All;
                Caption = 'Event Subscriber';

                trigger OnAction()
                begin
                    SampleCodeunit.Run();
                end;
            }
        }
    }


    var
        myInt: Integer;
        SampleCodeunit: Codeunit SampleCodeunit;
}