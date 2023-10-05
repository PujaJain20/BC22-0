report 50173 "Sales invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesInvoice.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")

        {
            column(Order_No_; "Order No.")
            { }
            column(Posting_Date; "Posting Date") { }
            column(Currency_Code; "Currency Code") { }
            column(VAT_Registration_No_; "VAT Registration No.") { }
            column(Vendor_Name; "Vendor Name") { }
            column(Vendor_NO_; "Vendor NO.") { }
            column(Vendor_City; "Vendor City") { }
            column(Phone_NO; "Phone NO") { }
            column(Address; Address) { }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(No_; "No.") { }
                column(Description; Description) { }
                //column(Quantity; Quantity) { }
                column(qty; qty) { }
                column(qty1; qty1) { }

                column(Unit_Price; "Unit Price") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Document_No_; "Document No.") { }
                column(Line_No_; "Line No.") { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    clear(qty);
                    clear(qty1);
                    ITem_Ledger_entry.SetRange("Item No.", "Sales Invoice Line"."No.");


                    if ITem_Ledger_entry.FindSet() then
                        repeat
                            if ITem_Ledger_entry."Location Code" = 'YELLOW' then
                                qty := ITem_Ledger_entry.Quantity + qty;
                            if ((ITem_Ledger_entry."Location Code" = 'YELLOW') OR (ITem_Ledger_entry."Location Code" = 'GREEN')) then
                                qty1 := ITem_Ledger_entry.Quantity + qty1;

                        until ITem_Ledger_entry.Next() = 0;

                end;
            }
            dataitem("Company Information"; "Company Information")
            {
                column(Name; Name) { }
                column(City; City) { }
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;

            begin
                Clear("Vendor Name");
                Clear(Address);
                Clear("Vendor City");
                Clear("Vendor NO.");
                Clear("Phone NO");

                Customer.SetFilter("No.", "Sales Invoice Header"."Sell-to Customer No.");

                if Customer.FindFirst() then begin

                    "Vendor Name" := Customer.Name;
                    Address := Customer.Address;
                    "Vendor City" := Customer.City;
                    "Vendor NO." := Customer."No.";
                    "Phone NO" := Customer."Phone No.";

                end;

            end;

        }
    }
    var
        myInt: Integer;
        "Sales_invoiceheader": Record "Sales Invoice Header";
        "Vendor Name": Text[100];
        Customer: Record Customer;
        Address: text[100];
        "Vendor City": Text[30];
        "Vendor NO.": Code[20];
        "Phone NO": text[30];
        "ITem_Ledger_entry": Record "Item Ledger Entry";
        "Sales_Invoiceline": Record "Sales Invoice Line";
        qty: Decimal;
        qty1: Decimal;
        "Item NO.": Code[20];



}