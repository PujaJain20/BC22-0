page 50129 MyRoleCenter
{
    PageType = RoleCenter;
    Caption = 'My Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; listpart)
                {
                    ApplicationArea = All;
                }

                part(Part2; CardpartPage)
                {
                    Caption = 'Invoices';
                }
            }
        }
    }


    actions
    {
        area(Sections)
        {
            group(PostedInvoices)
            {
                Caption = 'Student Information';
                Image = RegisteredDocs;
                action(StudentInformation)
                {
                    Caption = 'Student Information';
                    RunObject = Page StudentInfo;
                    ApplicationArea = All;
                }

                action(SyllabusInfo)
                {
                    Caption = 'Syllabus Information';
                    RunObject = Page SyllbusInfo;
                    ApplicationArea = All;
                }

                group(SalesDocuments)
                {
                    Caption = 'Posted sales invoice';
                    action("Sales Document Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Order";
                    }
                    action("Sales Document Line Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Posted Sales Shipment";
                    }
                }
            }
        }

        area(Embedding)
        {

            action(Sales)
            {
                Caption = 'Sales lists';
                RunObject = Page "Sales list";
                ApplicationArea = All;
            }

            action(Services)
            {
                Caption = 'Service lists';
                RunObject = Page "Service list";
                ApplicationArea = All;

            }


        }

        area(Processing)
        {
            action(SeeSalesInvoices)
            {
                Caption = 'See Student information';
                RunObject = Page StudentInfo;
            }

        }

        area(Creation)
        {
            action(AddSalesInvoice)
            {
                Caption = 'Add Student Information';
                Image = NewInvoice;
                RunObject = Page StudentInfo;
                RunPageMode = Create;
            }
        }

        area(Reporting)
        {
            action(SeeStudentInformation)
            {
                Caption = 'Student Information';
                Image = "Report";
                //RunObject = Report ;
            }
        }
    }
}

// Creates a profile that uses the Role Center
profile MyProfile
{
    ProfileDescription = 'Sample Profile';
    RoleCenter = MyRoleCenter;
    Caption = 'My profile';
}