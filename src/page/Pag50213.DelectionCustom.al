page 50213 DelectionCustom
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Delete)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                end;






            }
        }
    }

    var
        myInt: Integer;
        salesheader: Record "Sales Invoice Header";
        salesInvoiceLine: Record "Sales Invoice Line";

}