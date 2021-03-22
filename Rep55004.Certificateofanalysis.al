report 55004 "Certificate of analysis"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/CertificateOfAnalysis.docx';
    DefaultLayout = Word;       
    dataset
    {
        dataitem(QualityTestHeader; "Quality Test Header")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(ItemDescription; "Item Description")
            {
            }
            column(Lot_SerialNo; "Lot_Serial No.")
            {
            }
            column(No; "No.")
            {
            }
            column(CreationDate; "Creation Date")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(TestStartDate; "Test Start Date")
            {
            }
            column(TestStartTime; "Test Start Time")
            {
            }
            column(TestItemLedgerEntryNo; "Test Item Ledger Entry No.")
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(LastModifiedDate; "Last Modified Date")
            {
            }
            column(Status; Status)
            {
            }
            column(SalesCode;SalesCode){}
            column(SalesName;SalesName){}
            column(ExpirationYear;ExpirationYear){}
            column(currDay;currDay){}
            column(currTime;currTime){}
            column(CompanyLogo;CompanyInformation.Picture){}
            column(CompanyAddresses;CompanyAddresses){}
            column(CompanyName;CompanyInformation.Name){}
            dataitem(QCLine;"Quality Test Line")
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
                column(Conditions;Conditions){}
                column(Condition_Results;"Condition Results"){}
                column(MethodDescription;MethodDescription){}
                column(ResultDescription;ResultDescription){}                
                trigger OnAfterGetRecord()
                begin
                    Clear(MethodDescription);
                    Clear(ResultDescription);
                    if "Result Type" = "Result Type"::QCOption then
                    begin
                        MethodDescription := Conditions;
                        ResultDescription := Result;
                    end else if "Result Type" = "Result Type"::Number then
                    begin
                        MethodDescription := Format("Lower Limit") + ' - ' + FORMAT("Upper Limit");
                        ResultDescription := Format("Actual Measure");
                    end else if "Result Type" = "Result Type"::Condition then
                    begin
                        MethodDescription := Conditions;
                        ResultDescription := "Condition Results";
                    end;
                end;
            }      
            trigger OnAfterGetRecord()
            var
                Item: Record Item;
                ItemRef: Record "Item Reference";
            begin
                Item.Reset();
                Item.SetRange("No.",QualityTestHeader."Item No.");
                if Item.Find('-') then
                begin
                    ItemRef.Reset();
                    ItemRef.SetRange("Item No.",Item."No.");
                    if QualityTestHeader."Customer No." <> '' then 
                    begin
                        ItemRef.SetRange("Reference Type",ItemRef."Reference Type"::Customer);
                        ItemRef.SetRange("Reference Type No.",QualityTestHeader."Customer No.");
                        if ItemRef.Find('-') then
                        begin
                            SalesCode := ItemRef."Reference No.";
                            SalesName := ItemRef.Description;
                        end                         
                    end else 
                    begin
                        SalesCode := "Item No.";
                        SalesName := "Item Description";
                    end;
                end;
            end;                 
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
                    Caption = '🏷Remark';
                    field(ExpirationYear;ExpirationYear)
                    {
                        CaptionML = ENU='Expiration Year',KOR='유효년수';
                        ApplicationArea = All;
                    }
                    field(Remark;Remark)
                    {
                        CaptionML = ENU='Remark',KOR='Remark';
                        ApplicationArea = All;
                    }
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
    var
        CRLF: Text[2];
    begin
        if ExpirationYear = '' then
            ExpirationYear := '2'; //기본 연한을 2년으로 입력함.

        CRLF := '';
        CRLF[1] := 13;
        CRLF[2] := 10;        
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
        Clear(CompanyAddresses);
        CompanyAddresses += CompanyInformation.Address;
        CompanyAddresses += ' ';
        CompanyAddresses += CompanyInformation."Address 2";
        CompanyAddresses += CRLF;
        CompanyAddresses += 'TEL: '+CompanyInformation."Phone No.";
        CompanyAddresses += ' ';
        CompanyAddresses += 'FAX: '+CompanyInformation."Fax No.";
        CompanyAddresses += CRLF;
        CompanyAddresses += 'EMAIL: '+CompanyInformation."E-Mail";

        currDay := Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>');
        currTime := Format(CurrentDateTime, 0, '<Hours12,2>:<Minutes,2>:<Seconds,2>');
        
    end;
    var
        currDay: Text;
        currTime: Text;    
        Remark: Text;
        ExpirationYear: Code[3];
        SalesCode: Code[20];
        SalesName: Text;
        CompanyInformation: Record "Company Information";        
        CompanyAddresses: Text;
        MethodDescription: Text;
        ResultDescription: Text;        
}
