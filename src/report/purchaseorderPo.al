report 50227 "Purchase order PO"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'purchaseorder.docx';
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(No_; "No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Vendor_Order_No_; "Vendor Order No.") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(Shipment_Method_Code; "Shipment Method Code") { }
            column(Your_Reference; "Your Reference") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
            column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
            column(Buy_from_Address_2; "Buy-from Address 2") { }
            column(Buy_from_City; "Buy-from City") { }
            column(Buy_from_Contact; "Buy-from Contact") { }
            column(Buy_from_Contact_No_; "Buy-from Contact No.") { }
            column(Ship_to_Address_2; "Ship-to Address 2")
            {
            }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Contact; "Ship-to Contact") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Code; "Ship-to Code") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }





            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(No; "No.") { }
                column(Description; Description) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Quantity; Quantity) { }
                column(Unit_Price__LCY_; "Unit Price (LCY)") { }
                column(Inv__Discount_Amount; "Inv. Discount Amount") { }
                column(Job_No_; "Job No.") { }
                column(Line_Amount; "Line Amount") { }
                column(Amount; Amount) { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(CustomAmount; CustomAmount) { }
                column(InsvoiceAmount; InsvoiceAmount) { }
                column(LineAmount; LineAmount) { }
                column(Total; Total) { }
                column(VAT__; "VAT %") { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;


                begin
                    PurchaseLIne.Reset();
                    PurchaseLIne.SetRange("Document No.", "Purchase Header"."No.");


                    if PurchaseLIne.FindSet() then
                        repeat
                            CustomAmount += purchaseLIne.amount;
                            InsvoiceAmount += PurchaseLIne."Inv. Discount Amount";
                            LineAmount += PurchaseLIne."Line Amount";
                        until purchaseLIne.next = 0;
                    Total := Total + CustomAmount + InsvoiceAmount + LineAmount;



                end;






            }

        }
    }

    requestpage
    {
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
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        myInt: Integer;
        TotalAmount: Decimal;
        CustomAmount: Decimal;
        InsvoiceAmount: Decimal;
        LineAmount: Decimal;
        Total: Decimal;
        PurchaseLIne: Record "Purchase Line";
}