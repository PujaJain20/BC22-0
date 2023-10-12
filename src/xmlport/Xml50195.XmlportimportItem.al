xmlport 50195 "Xmlport import Item"
{
    Format = Xml;
    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                fieldattribute(No; Item."No.")
                {
                }
                fieldattribute(Description; Item.Description) { }
                fieldattribute(Type; Item.Type) { }
                fieldattribute("Unitprice"; Item."Unit Price") { }
                fieldattribute(Quantity; item."Qty. on Sales Order") { }
                fieldattribute("ShelfNo."; item."Shelf No.") { }
            }
        }
    }








    var
        myInt: Integer;
}