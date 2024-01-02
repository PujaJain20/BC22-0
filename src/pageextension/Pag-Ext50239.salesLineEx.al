pageextension 50239 salesLineEx extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Qty. to Ship")
        {
            field("Reference No."; Rec."Reference No.")
            {
                ApplicationArea = all;
            }

        }
        //AGT_PJ_02122023++
        modify("Planned Delivery Date")
        {
            StyleExpr = styexptext;
        }
        modify("Planned Shipment Date")
        {
            StyleExpr = styexptext;

        }
        modify("Shipment Date")
        {
            StyleExpr = styexptext;
        }
    }
    trigger OnAfterGetRecord()
    var

    begin
        styexptext := Changecolor.Changefieldvaluecolor(Rec);
    end;


    //AGT_PJ_02122023--

    var

        styexptext: Text;
        Changecolor: Codeunit "Custom Codeunit";
}