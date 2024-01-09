pageextension 50279 jobsetupEx extends "Jobs Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Job Nos.")
        {
            field("New job"; Rec."New job")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}