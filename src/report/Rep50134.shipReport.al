report 50134 shipReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    RDLCLayout = 'shipReport.rdl';
    DefaultLayout = RDLC;

    dataset
    {

        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {

            column(Ship_to_Address; "Ship-to Address") { }

            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Post_Code; "Ship-to Post Code") { }
            column(External_Document_No_; "External Document No.") { }
            column(Location_Code; "Location Code") { }
            column(Address; Address) { }
            column(name; name) { }
            column(city; city) { }
            column(post_code; post_code) { }
            column(item_no_; "item no.") { }
            column(Desc; Desc) { }
            column(Carton; Carton) { }
            column(SalesItemNo; SalesItemNo) { }


            trigger OnAfterGetRecord()
            var
                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";
                BarcodeString: Text[100];
            begin
                locationInfo.SetFilter(Code, "Sales Invoice Header"."Location Code");
                sales_invoice_line.SetFilter("Document No.", "Sales Invoice Header"."No.");
                if sales_invoice_line.FindFirst() then
                    if locationInfo.FindFirst() then
                        Address := locationInfo.Address;
                name := locationInfo.Name;
                city := locationInfo.City;
                post_code := locationInfo."Post Code";
                "item no." := sales_invoice_line."No.";
                Desc := sales_invoice_line.Description;
                repeat
                    Carton := Carton + sales_invoice_line.Quantity;
                until sales_invoice_line.Next() = 0;

                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::Code39;
                BarcodeString := "No.";
                BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
                SalesItemNo := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);

            end;






        }



    }
    var
        myInt: Integer;
        locationInfo: Record Location;
        Address: Text[100];
        name: Text[100];
        city: Text[100];
        post_code: text[100];
        sales_invoice_Header: Record "Sales Invoice Header";
        "item no.": Code[20];
        Desc: Text[100];
        sales_invoice_line: Record "Sales Invoice Line";
        Carton: Decimal;

        SalesItemNo: Text[100];
}
