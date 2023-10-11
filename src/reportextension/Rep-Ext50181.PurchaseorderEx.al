reportextension 50181 "Purchase order Ex" extends "Purchase Order"
{

    dataset
    {
        // Add changes to dataitems and columns here
        add("Purchase Line")
        {
            column(Type; Type) { }
        }

    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'PurchaseorderEx.rdl';
        }
    }
}