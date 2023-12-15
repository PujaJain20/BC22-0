pageextension 50206 postedsalesshipmentEx extends "Posted Sales Shipments"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("F&unctions")
        {
            action(BlindWc)
            {
                ApplicationArea = All;
                Caption = 'Blind Report';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(salesshipmentHeader);
                    Report.Run(50248, true, false, salesshipmentHeader);
                end;
            }
        }
    }

    var

        salesshipmentHeader: Record "Sales Shipment Header";
}