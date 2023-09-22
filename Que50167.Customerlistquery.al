query 50167 "Customer list query"
{
    // Caption = 'Customer list query';
    QueryType = Normal;
    QueryCategory = 'Customer List';


    elements
    {
        dataitem(Customer; Customer)
        {
            column(Address; Address)
            {
            }
            column(Amount; Amount)
            {
            }
            column(Balance; Balance)
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(BillToNoofInvoices; "Bill-To No. of Invoices")
            {
            }
            column(City; City)
            {
            }
            column(Contact; Contact)
            {
            }
            column(ContactID; "Contact ID")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(County; County)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
