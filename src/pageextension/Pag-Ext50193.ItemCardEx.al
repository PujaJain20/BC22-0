pageextension 50193 "Item Card Ex" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(color; Rec.color)
            {
                ApplicationArea = all;
            }
            field(Style; Rec.Style)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addafter(Functions)
        {
            action(PrintLabel)
            {
                ApplicationArea = All;
                Caption = 'Print Label';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Item);
                    Report.Run(50186, true, false, Item);

                end;
            }

        }
    }

    var
        myInt: Integer;
        Item: Record Item;
}