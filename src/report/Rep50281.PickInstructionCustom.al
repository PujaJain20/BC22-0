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

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(No; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(ToT; ToT) { }
                column(EncodeTextCode39; EncodeTextCode39) { }

                trigger OnAfterGetRecord()
                var
                    salesline: Record "Sales Line";
                    BarcodeSymbology: Enum "Barcode Symbology";
                    BarcodeFontProvider: Interface "Barcode Font Provider";
                    BarcodeString: Text;
                begin


                    BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                    BarcodeSymbology := Enum::"Barcode Symbology"::Code39;
                    BarcodeString := "No.";
                    BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
                    EncodeTextCode39 := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);



                end;
            }
        }
    }

    var
        myInt: Integer;
        EncodeTextCode39: Text;
}