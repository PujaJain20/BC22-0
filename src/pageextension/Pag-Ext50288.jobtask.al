pageextension 50288 jobtask extends "Job Task Lines Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Schedule (Total Cost)")
        {
            field(Buyout; Rec.Buyout)
            {
                ApplicationArea = all;

            }


        }
       


    }



    var

        JobTask: Record "Job Task";
        JobNo: code[20];


}