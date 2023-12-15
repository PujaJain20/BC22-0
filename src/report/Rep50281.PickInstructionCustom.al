report 50281 PickInstructionCustom
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'pickinstruction.rdl';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(No_; "No.") { }
            column(External_Document_No_; "External Document No.") { }
            column(Bill_to_Customer_No_; "Bill-to Customer No.") { }
            column(Tax_Exemption_No_; "Tax Exemption No.") { }
            column(Quote_No_; "Quote No.") { }
            column(Document_Date; "Document Date") { }
            column(Due_Date; "Due Date") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(Payment_Method_Code; "Payment Method Code") { }
            column(Tax_Liable; "Tax Liable") { }
            column(Salesperson_Code; "Salesperson Code") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_County; "Ship-to County") { }


            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(No; "No.") { }
                column(Item_No; "Item No") { }
                column(Total_qty_; "Total qty.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(ToT; ToT) { }
                column(Type; Type) { }
                column(Line_No_; "Line No.") { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Unit_Price; "Unit Price") { }
                column(Line_Amount; "Line Amount") { }
                dataitem("Company Information"; "Company Information")
                {
                    column(Name; Name) { }
                    column(E_Mail; "E-Mail") { }
                    column(Phone_No_; "Phone No.") { }
                    column(Giro_No_; "Giro No.") { }
                    column(Home_Page; "Home Page") { }
                    column(IBAN; IBAN) { }
                    column(SWIFT_Code; "SWIFT Code") { }
                    column(Address; Address) { }
                    column(Address_2; "Address 2") { }
                    column(Location_Code; "Location Code") { }

                }



            }

        }

    }

    var
        salesLine: Record "Sales Line";
        "Total qty.": Decimal;
        "Item No": Code[20];

}