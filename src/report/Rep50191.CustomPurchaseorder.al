report 50191 CustomPurchaseorder
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'CustomPurchaseOrder.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Contact; "Ship-to Contact") { }
            column(Ship_to_County; "Ship-to County") { }
            column(No_; "No.") { }
            column(Buy_from_Address; "Buy-from Address") { }
            column(Buy_from_City; "Buy-from City") { }
            column(Buy_from_County; "Buy-from County") { }
            column(Buy_from_Contact; "Buy-from Contact") { }

            column(Posting_Date; "Posting Date") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }



            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(No; "No.") { }
                column(Description; Description) { }
                column(Unit_Price__LCY_; "Unit Price (LCY)") { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
                column(Document_No_; "Document No.") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Responsibility_Center; "Responsibility Center") { }
                column(Purchasing_Code; "Purchasing Code") { }
                column(Amount; Amount) { }
                column(SalesTax; SalesTax) { }


                dataitem("Company Information"; "Company Information")
                {
                    column(Name; Name) { }
                    column(Address; Address) { }
                    column(County; County) { }
                    column(Picture; Picture) { }

                }
                trigger OnAfterGetRecord()
                begin
                    PurchaseLIne.Reset();
                    PurchaseLIne.SetRange("Document No.", "Purchase Header"."No.");
                    if PurchaseLIne.FindFirst() then begin
                        PurchaseLIne.CalcSums("Amount Including VAT");
                        Amount := PurchaseLIne."Amount Including VAT";

                        PurchaseLIne.CalcSums("Line Discount %");
                        SalesTax := PurchaseLIne."Line Discount %";
                    end;
                end;

            }

        }


    }
    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        PurchaseLIne: Record "Purchase Line";
        Amount: Decimal;
        SalesTax: Decimal;
}