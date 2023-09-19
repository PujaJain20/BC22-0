report 50113 Barcodetask
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Barcodetask.rdl';
    DefaultLayout = RDLC;



    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(No_; "No.") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(name; name) { }
            column(city; city) { }
            column(Address; Address) { }
            column(Phone_no; Phone_no) { }
            column(weight; weight) { }
            column(ITEM_NR; ITEM_NR) { }
            column(Location_Code; "Location Code") { }


            trigger OnAfterGetRecord()
            var
                myInt: Integer;
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

                Phone_no := locationInfo."Phone No.";
                weight := sales_invoice_line."Net Weight" * 2.2;

                ITEM_NR := sales_invoice_line."No.";

                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::Code39;
                BarcodeString := sales_invoice_line."No.";
                BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
                ITEM_NR := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);


            end;
        }
    }








    var
        myInt: Decimal;
        locationInfo: Record Location;
        Address: Text[100];
        name: Text[100];
        city: Text[100];
        Phone_no: Text[100];
        weight: Decimal;
        ITEM_NR: Text[100];
        sales_invoice_line: Record "Sales Invoice Line";
}