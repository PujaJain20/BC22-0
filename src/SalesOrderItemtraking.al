// pageextension 50138 SalesOrderItemTracking extends "Item Tracking Lines"
// {
//     layout
//     {
//         // Add changes to page layout here
//     }

//     actions
//     {


//         addafter(Line_PackageNoInfoCard)
//         {

//             action(PrintLot)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Print Lot';
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 trigger OnAction()
//                 var
//                     LotNoreport: Report LotNoReport;
//                     item: Record "Item";


//                 begin
//                     if item.Get(Rec."Item No.") then begin

//                         LotNoreport.Lot_No(Rec."Lot No.", Rec."Quantity (Base)", Rec."Appl.-from Item Entry", Rec."Item No.");

//                         LotNoreport.Run();

//                     end;
//                 end;


//             }


//         }

//     }



//     var
//         myInt: Integer;
//         Tracking_Specification: Record "Tracking Specification";
//         Reservation_entry: Record "Reservation Entry";


// }