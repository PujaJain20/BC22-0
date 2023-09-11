report 50114 ProductDetails
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'ProductDetails.rdl';
    DefaultLayout = RDLC;




    dataset
    {
        dataitem(Item; Item)
        {
            column(Description; Description)
            {

            }
            column(Inventory; Inventory) { }
        }
    }





    var
        myInt: Integer;
}