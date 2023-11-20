reportextension 50169 JobActualtobudgetEx extends "Job Actual to Budget (Cost)"
{
    //RDLCLayout = 'JobActualtoBudgetCost.rdl';
    RDLCLayout = 'AGTJobActualtoBudgetCost1.rdl';
    dataset

    {
        // Add changes to dataitems and columns here

        add(PageHeader)
        {
            column(Togglemark; Togglemark) { }
        }


    }

    requestpage
    {
        // Add changes to the requestpage here
        layout
        {

            addafter(PrintToExcel)
            {
                field(Togglemark; Togglemark)
                {
                    ApplicationArea = all;
                }

            }
        }
    }



    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'JobActualToBudget.rdl';
    //     }
    // }
    var
        Togglemark: Boolean;
}
