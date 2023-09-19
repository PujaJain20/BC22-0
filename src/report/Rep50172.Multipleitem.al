report 50172 Multipleitem
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Multipleitem.rdl';


    dataset
    {
        dataitem(Vendor; Vendor)
        {
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {

                DataItemLinkReference = Vendor;

                DataItemLink = "Sell-to Customer No." = field("No.");
                DataItemTableView = sorting("Sell-to Customer No.", Type, "Document No.");
                column(No_; "No.") { }
                column(Description; Description) { }
                column(Type; Type) { }
                column(Document_No_; "Document No.") { }
                column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
                column(Line_No_; "Line No.") { }

            }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {

                DataItemLinkReference = Vendor;

                DataItemLink = "Sell-to Customer No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");
                column(Sell_to_Customer_No; "Sell-to Customer No.") { }
                column(No; "No.") { }
                column(Type_; Type) { }
                column(Document_No; "Document No.") { }
                column(Line_No; "Line No.") { }
                column(Description_; Description) { }






            }


        }
    }








    var
        myInt: Integer;
}