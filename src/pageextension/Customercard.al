pageextension 50166 Customer extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("No.of item"; Rec."No.of item") { }


        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}