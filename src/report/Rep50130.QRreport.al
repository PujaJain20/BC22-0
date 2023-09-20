report 50130 QRreport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'QRreport.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {

            }
            column(Description; Description) { }
            column(ItemQR; ItemQR) { }
            trigger OnAfterGetRecord()

            var
                BarcodeSymbology: Enum "Barcode Symbology 2D";
                BarcodeFontProvider: Interface "Barcode Font Provider 2D";
                BarcodeString: Text[100];
            begin
                BarcodeFontProvider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarcodeSymbology := Enum::"Barcode Symbology 2D"::"QR-Code";
                BarcodeString := "No.";
                //BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
                ItemQR := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
            end;

        }
    }





    var
        ItemQR: Text;
}