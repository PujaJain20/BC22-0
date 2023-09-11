report 50129 LotNoReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'LotNoReport.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Item; Item)
        {





            column(Lotno; Lotno) { }
            column(qty_base; qty_base) { }
            column(Appl_to_item_entry; Appl_to_item_entry) { }
            column(No_; "No.") { }
            column(item_NO; item_NO) { }
            column(Qty_To_Handle; Qty_To_Handle) { }
            column(Qty_To_Invoice; Qty_To_Invoice) { }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin


            end;


        }

    }

    procedure Lot_No(Lot_No: Code[50]; qty: Decimal; qty_invoice: Decimal; Itemno: Code[20])
    var
    begin

        Lotno := Lot_No;

        qty_base := qty;
        Appl_to_item_entry := qty_invoice;
        item_NO := Itemno;



    end;





    var

        Lotno: Code[50];
        qty_base: Decimal;
        Appl_to_item_entry: Decimal;
        item_l: Record "Item";
        Tracking_Specification: Record "Tracking Specification";
        LotNoreport: Report LotNoReport;
        item_NO: Code[20];
        Qty_To_Handle: Decimal;
        Qty_To_Invoice: Decimal;
        Reservation_entry: Record "Reservation Entry";




}