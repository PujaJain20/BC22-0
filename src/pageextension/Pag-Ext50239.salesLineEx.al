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
                Editable = false;

            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = all;
                Editable = false;

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
                    jobsrec: Record Job;
                    customer: Record Customer;

                begin
                    jobs.Reset();
                    //AGT_PJ_17012024 ++
                    if rec.Type = rec.Type::Resource then begin
                        jobsrec.SetRange("No.", rec."No.");
                        if jobsrec.FindFirst() then begin
                            if customer.get(rec."Sell-to Customer No.") then
                                if rec."Job No." = '' then begin
                                    jobs.Init();
                                    jobs.Validate("job type", rec."No.");
                                    jobs."Bill-to Customer No." := rec."Sell-to Customer No.";
                                    jobs."Sell-to Customer No." := rec."Sell-to Customer No.";
                                    jobs."Sell-to Customer Name" := customer.Name;
                                    // jobs.Validate("Sell-to Customer No.", rec."Sell-to Customer No.");
                                    jobs.Validate(Description, rec.Description);
                                    jobs.Insert(true);
                                    rec.Validate("Job No.", jobs."No.");
                                    rec."Job Task No." := '101';
                                    jobtask.Reset();
                                    jobtask.SetRange("Job No.", jobsrec."No.");
                                    if jobtask.FindFirst() then begin
                                        jobtaskRec.Init();
                                        repeat
                                            jobtaskRec."Job No." := jobs."No.";
                                            jobtaskRec."Job Task No." := jobtask."Job Task No.";
                                            //  jobtaskRec.Validate("Job No.", jobs."No.");
                                            //  jobtaskRec.Validate("Job Task No.", jobtask."Job Task No.");
                                            jobtaskRec.TransferFields(jobtask, false);
                                            jobtaskRec.Insert(true);
                                        until jobtask.Next() = 0;
                                    end;
                                    Message('job Has been created ');

                                end
                                else
                                    Message('job already created');
                            //AGT_PJ_17012024 --

                        end
                        else begin
                            //if not jobsrec.FindFirst() then begin
                            if rec."Job No." = '' then begin
                                jobs.Init();
                                jobs.Validate("job type", rec."No.");
                                //  jobs.Validate("Sell-to Customer No.", rec."Sell-to Customer No.");
                                jobs."Bill-to Customer No." := rec."Sell-to Customer No.";
                                jobs."Sell-to Customer No." := rec."Sell-to Customer No.";

                                jobs.Validate(Description, rec.Description);
                                jobs.Insert(true);
                                rec.Validate("Job No.", jobs."No.");
                                rec."Job Task No." := '101';
                                Message('job Has been Created');

                            end
                            else
                                Message('jobs already created');
                            // end;
                        end;

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