report 55003 "Quality Test Worksheet"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/QualityTestWorkSheet.docx';
    DefaultLayout = Word;    
    dataset
    {
        dataitem(QualityTestHeader; "Quality Test Header")
        {
            column(No; "No.")
            {
            }
            column(ItemNo; "Item No.")
            {
            }
            column(ItemDescription; "Item Description")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(Lot_SerialNo; "Lot_Serial No.")
            {
            }
            column(TestItemLedgerEntryNo; "Test Item Ledger Entry No.")
            {
            }
            column(Status; Status)
            {
            }
            column(CreationDate; "Creation Date")
            {
            }
            dataitem("Quality Test Line";"Quality Test Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                DataItemLinkReference = QualityTestHeader;
                column(Quality_Measure;"Quality Measure"){}
                column(Measure_Description;"Measure Description"){}
                column(Quality_Method;"Quality Method"){}
                column(Method_Description;"Method Description"){}
                column(Lower_Limit;"Lower Limit"){}
                column(Upper_Limit;"Upper Limit"){}
                column(Nominal_Value;"Nominal Value"){}
            }            
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnInitReport()
    begin
        currDay := Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>');
        currTime := Format(CurrentDateTime, 0, '<Hours12,2>:<Minutes,2>:<Seconds,2>');
    end;
    var
        currDay: Text;
        currTime: Text;
}
