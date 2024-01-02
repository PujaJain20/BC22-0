report 50120 "AGTItemLabels"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'AGTItemLabels.rdl';
    Caption = 'Item Label';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {

        dataitem(Item; Item)
        {
            //RequestFilterFields = "No.", "Search Description", "Shelf No.", "Inventory Posting Group";
            column(ItemNo_1_; ItemNo[1])
            {
            }
            column(ItemDescription_1_; ItemDescription[1])
            {
            }
            column(ItemUnit_1_; ItemUnit[1])
            {
            }
            column(ItemShelf_1_; ItemShelf[1])
            {
            }
            column(ColumnNo; ColumnNo)
            {
            }
            column(LabelsPerRow; LabelsPerRow)
            {
            }
            column(Item__No__; Item."No.")
            {
            }
            column(ItemNo_1__Control11; ItemNo[1])
            {
            }
            column(ItemDescription_1__Control13; ItemDescription[1])
            {
            }
            column(ItemUnit_1__Control15; ItemUnit[1])
            {
            }
            column(ItemShelf_1__Control17; ItemShelf[1])
            {
            }
            column(ItemNo_2_; ItemNo[2])
            {
            }
            column(ItemDescription_2_; ItemDescription[2])
            {
            }
            column(ItemUnit_2_; ItemUnit[2])
            {
            }
            column(ItemShelf_2_; ItemShelf[2])
            {
            }
            column(ItemNo_1__Control31; ItemNo[1])
            {
            }
            column(ItemDescription_1__Control33; ItemDescription[1])
            {
            }
            column(ItemUnit_1__Control35; ItemUnit[1])
            {
            }
            column(ItemShelf_1__Control37; ItemShelf[1])
            {
            }
            column(ItemNo_2__Control39; ItemNo[2])
            {
            }
            column(ItemDescription_2__Control41; ItemDescription[2])
            {
            }
            column(ItemUnit_2__Control43; ItemUnit[2])
            {
            }
            column(ItemShelf_2__Control45; ItemShelf[2])
            {
            }
            column(ItemNo_3_; ItemNo[3])
            {
            }
            column(ItemDescription_3_; ItemDescription[3])
            {
            }
            column(ItemUnit_3_; ItemUnit[3])
            {
            }
            column(ItemShelf_3_; ItemShelf[3])
            {
            }
            column(ItemNo_1_Caption; ItemNo_1_CaptionLbl)
            {
            }
            column(ItemDescription_1_Caption; ItemDescription_1_CaptionLbl)
            {
            }
            column(ItemUnit_1_Caption; ItemUnit_1_CaptionLbl)
            {
            }
            column(ItemShelf_1_Caption; ItemShelf_1_CaptionLbl)
            {
            }
            column(ItemNo_1__Control11Caption; ItemNo_1__Control11CaptionLbl)
            {
            }
            column(ItemDescription_1__Control13Caption; ItemDescription_1__Control13CaptionLbl)
            {
            }
            column(ItemUnit_1__Control15Caption; ItemUnit_1__Control15CaptionLbl)
            {
            }
            column(ItemShelf_1__Control17Caption; ItemShelf_1__Control17CaptionLbl)
            {
            }
            column(ItemNo_2_Caption; ItemNo_2_CaptionLbl)
            {
            }
            column(ItemDescription_2_Caption; ItemDescription_2_CaptionLbl)
            {
            }
            column(ItemUnit_2_Caption; ItemUnit_2_CaptionLbl)
            {
            }
            column(ItemShelf_2_Caption; ItemShelf_2_CaptionLbl)
            {
            }
            column(ItemNo_1__Control31Caption; ItemNo_1__Control31CaptionLbl)
            {
            }
            column(ItemDescription_1__Control33Caption; ItemDescription_1__Control33CaptionLbl)
            {
            }
            column(ItemUnit_1__Control35Caption; ItemUnit_1__Control35CaptionLbl)
            {
            }
            column(ItemShelf_1__Control37Caption; ItemShelf_1__Control37CaptionLbl)
            {
            }
            column(ItemNo_2__Control39Caption; ItemNo_2__Control39CaptionLbl)
            {
            }
            column(ItemDescription_2__Control41Caption; ItemDescription_2__Control41CaptionLbl)
            {
            }
            column(ItemUnit_2__Control43Caption; ItemUnit_2__Control43CaptionLbl)
            {
            }
            column(ItemShelf_2__Control45Caption; ItemShelf_2__Control45CaptionLbl)
            {
            }
            column(ItemNo_3_Caption; ItemNo_3_CaptionLbl)
            {
            }
            column(ItemDescription_3_Caption; ItemDescription_3_CaptionLbl)
            {
            }
            column(ItemUnit_3_Caption; ItemUnit_3_CaptionLbl)
            {
            }
            column(ItemShelf_3_Caption; ItemShelf_3_CaptionLbl)
            {
            }
            // AGT_PJ_12/12/2023 ++
            column(Barcode1; Barcode1) { }
            column(barcode2; barcode2) { }
            column(barcode3; barcode3) { }
            // AGT_PJ__12/12/2023 --
            //AGT_MD_121223 ++
            column(ItemManufacturePartNumber_1; ItemManufacturePartNumber[1])
            { }
            column(ItemManufacturePartNumber_2; ItemManufacturePartNumber[2])
            { }
            column(ItemManufacturePartNumber_3; ItemManufacturePartNumber[3])
            { }
            //AGT_MD_121223 --
            dataitem(BlankLine; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(BlankLine_Number; Number)
                {
                }

                trigger OnPreDataItem()
                begin
                    if PrintLinesPerLabel <= 4 then
                        CurrReport.Break();
                    SetRange(Number, 1, PrintLinesPerLabel - 4);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ColumnNo := ColumnNo + 1;
                RecordNo := RecordNo + 1;
                ItemNo[ColumnNo] := "No.";
                ItemDescription[ColumnNo] := Description;
                ItemUnit[ColumnNo] := "Base Unit of Measure";
                ItemShelf[ColumnNo] := "Shelf No.";
                //  ItemManufacturePartNumber[ColumnNo] := "Manufacturer Model / Part #"; //AGT_MD_122023
                if RecordNo = NoRecords then
                    while ColumnNo < LabelsPerRow do begin
                        ColumnNo := ColumnNo + 1;
                        Clear(ItemNo[ColumnNo]);
                        Clear(ItemDescription[ColumnNo]);
                        Clear(ItemUnit[ColumnNo]);
                        Clear(ItemShelf[ColumnNo]);
                        Clear(ItemManufacturePartNumber[ColumnNo]); //AGT_MD_122023
                    end;
                if ColumnNo = LabelsPerRow then
                    ColumnNo := 0;
                // AGT_PJ_12/12/2023 ++
                Barcodeone();
                if ColumnNo = 2 then  //AGT_MD_121223 ++
                    BarcodeTwo(); //AGT_MD_121223 --
                BarcodeThree();
                // AGT_PJ_12/12/2023 --
            end;

            trigger OnPreDataItem()
            begin
                ColumnNo := 0;
                RecordNo := 0;
                NoRecords := Count;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    // AGT_PJ_12/12/2023 ++
                    Visible = false;
                    // AGT_pj_12/12/2023 
                    field(PrintLinesPerLabel; PrintLinesPerLabel)
                    {
                        ApplicationArea = Suite;
                        Caption = 'No. of print lines per label';
                        MaxValue = 99;
                        MinValue = 4;
                        ToolTip = 'Specifies the height of each label in print lines. Since each print line is .16 inches, you can measure the height of the label (top of one label to the top of the next label) in inches and then multiply the result by 6.';
                    }
                    field(NoOfLabelsPerRow; LabelsPerRow)
                    {
                        ApplicationArea = Suite;
                        Caption = 'No. of labels per row';
                        MaxValue = 3;
                        MinValue = 1;
                        ToolTip = 'Specifies the number of labels across one row of labels.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if PrintLinesPerLabel = 0 then
                PrintLinesPerLabel := 6;
            if LabelsPerRow = 0 then
                LabelsPerRow := 3;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if PrintLinesPerLabel < 4 then
            PrintLinesPerLabel := 4;
    end;
    // AGT_PJ_12/12/2023 ++

    local procedure Barcodeone()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
        BarcodeString: Text;
        Barcodestring1: Text;
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::Code128;
        BarcodeString := ItemNo[1];
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        Barcode1 := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    //AGT_MD_121223 ++
    local procedure BarcodeTwo()
    var
        BarcodeSymbology2: Enum "Barcode Symbology";
        BarcodeFontProvider2: Interface "Barcode Font Provider";
        BarcodeString2: Text;
    begin
        BarcodeFontProvider2 := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology2 := Enum::"Barcode Symbology"::Code128;
        BarcodeString2 := ItemNo[2];
        BarcodeFontProvider2.ValidateInput(BarcodeString2, BarcodeSymbology2);
        barcode2 := BarcodeFontProvider2.EncodeFont(BarcodeString2, BarcodeSymbology2);
    end;
    //AGT_MD_121223 --

    local procedure BarcodeThree()
    var
        BarcodeSymbology3: Enum "Barcode Symbology";
        BarcodeFontProvider3: Interface "Barcode Font Provider";
        BarcodeString3: Text;
    begin
        BarcodeFontProvider3 := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology3 := Enum::"Barcode Symbology"::Code128;
        BarcodeString3 := Item."No.";
        BarcodeFontProvider3.ValidateInput(BarcodeString3, BarcodeSymbology3);
        barcode3 := BarcodeFontProvider3.EncodeFont(BarcodeString3, BarcodeSymbology3);
    end;
    // AGT_PJ_12/12/2023 --

    var
        ItemManufacturePartNumber: array[3] of Text[100]; //AGT_MD_122023
        PrintLinesPerLabel: Integer;
        LabelsPerRow: Integer;
        ItemNo: array[3] of Code[20];
        ItemDescription: array[3] of Text;
        ItemUnit: array[3] of Text[10];
        ItemShelf: array[3] of Code[10];
        ColumnNo: Integer;
        RecordNo: Integer;
        NoRecords: Integer;
        ItemNo_1_CaptionLbl: Label 'Inventory Item No.';
        ItemDescription_1_CaptionLbl: Label 'Description';
        ItemUnit_1_CaptionLbl: Label 'Unit of Measure';
        ItemShelf_1_CaptionLbl: Label 'Shelf/Bin No.';
        ItemNo_1__Control11CaptionLbl: Label 'Inventory Item No.';
        ItemDescription_1__Control13CaptionLbl: Label 'Description';
        ItemUnit_1__Control15CaptionLbl: Label 'Unit of Measure';
        ItemShelf_1__Control17CaptionLbl: Label 'Shelf/Bin No.';
        ItemNo_2_CaptionLbl: Label 'Inventory Item No.';
        ItemDescription_2_CaptionLbl: Label 'Description';
        ItemUnit_2_CaptionLbl: Label 'Unit of Measure';
        ItemShelf_2_CaptionLbl: Label 'Shelf/Bin No.';
        ItemNo_1__Control31CaptionLbl: Label 'Inventory Item No.';
        ItemDescription_1__Control33CaptionLbl: Label 'Description';
        ItemUnit_1__Control35CaptionLbl: Label 'Unit of Measure';
        ItemShelf_1__Control37CaptionLbl: Label 'Shelf/Bin No.';
        ItemNo_2__Control39CaptionLbl: Label 'Inventory Item No.';
        ItemDescription_2__Control41CaptionLbl: Label 'Description';
        ItemUnit_2__Control43CaptionLbl: Label 'Unit of Measure';
        ItemShelf_2__Control45CaptionLbl: Label 'Shelf/Bin No.';
        ItemNo_3_CaptionLbl: Label 'Inventory Item No.';
        ItemDescription_3_CaptionLbl: Label 'Description';
        ItemUnit_3_CaptionLbl: Label 'Unit of Measure';
        ItemShelf_3_CaptionLbl: Label 'Shelf/Bin No.';
        // AGT_PJ_12/12/2023 ++
        Barcode1: Text;
        barcode2: Text;
        barcode3: Text;
        barcode: array[3] of Code[20];
    //AGT_pj_12/12/2023 --
}

