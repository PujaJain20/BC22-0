// reportextension 50284 PickinstructionEx extends "Pick Instruction"
// {
//     dataset
//     {
//         // Add changes to dataitems and columns here
//     }

//     requestpage
//     {
//         // Add changes to the requestpage here
//     }

//     rendering
//     {
//         layout(LayoutName)
//         {
//             Type = RDLC;
//             LayoutFile = 'mylayout.rdl';
//         }
//     }
//     trigger OnPostReport()
//     var
//         myInt: Integer;
//     begin
//         Report.Run(50281);
//     end;
// }