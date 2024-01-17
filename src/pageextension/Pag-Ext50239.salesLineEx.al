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
            field("Qty. on Available"; Rec."Qty. on Available")
            {
                ApplicationArea = all;
            }
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = all;
                Editable = true;

            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = all;
                Editable = true;

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
    actions
    {
        //AGT_PJ_16012024++

        addafter("F&unctions")
        {
            action(Createjobforresource)
            {
                ApplicationArea = All;
                Caption = 'Create job for resource';

                trigger OnAction()
                var
                    jobs: Record Job;
                    jobtask: Record "Job Task";
                    jobtaskRec: Record "Job Task";

                begin

                    if rec.Type = rec.Type::Resource then begin
                        jobs.SetRange("No.", rec."No.");
                        jobs.SetRange("No.", jobtask."Job No.");
                        if jobs.FindFirst() then begin
                            if rec."Job No." = '' then begin
                                jobs.Init();
                                jobs.Validate("job type", rec."No.");
                                jobs.Validate("Sell-to Customer No.", rec."Sell-to Customer No.");
                                jobs.Validate(Description, rec.Description);
                                jobs.Insert(true);
                                jobtask.Validate("Job Task No.", jobtask."Job Task No.");
                                jobtask.Insert(true);
                                rec.Validate("Job No.", jobs."No.");
                                rec."Job Task No." := '101';
                                Message('job Has been created ');

                            end;

                        end
                        else
                            Message('job already created');


                    end
                    else
                        Message('This resource does not exist');

                end;
                //  end;
            }
        }
    }
    //AGT_PJ_16012024 --

    trigger OnAfterGetRecord()
    var

    begin
        styexptext := Changecolor.Changefieldvaluecolor(Rec);
    end;


    //AGT_PJ_02122023--

    var

        styexptext: Text;
        Changecolor: Codeunit "Custom Codeunit";
        jobs: Record Job;
        salesheader: Record "Sales Header";
}