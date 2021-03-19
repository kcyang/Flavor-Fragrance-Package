page 55028 "Quality Test"
{
    
    Caption = 'Quality Test';
    PageType = Document;
    SourceTable = "Quality Test Header";
    PromotedActionCategories = 'New,Process,Report';
    RefreshOnActivate = true;    
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Lot_Serial No."; Rec."Lot_Serial No.")
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = All;
                }
                field("Test Start Date"; Rec."Test Start Date")
                {
                    ApplicationArea = All;
                }
                field("Test Start Time"; Rec."Test Start Time")
                {
                    ApplicationArea = All;
                }
            }
            part(SpecLines; "Quality Test Subform")
            {
                Editable = isEditable;
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }                   
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetSpec)
            {
                Enabled = isEditable;
                ApplicationArea = All;
                CaptionML = ENU = 'Get QC Spec.', KOR = '측정사양가져오기';
                Image = UnitOfMeasure;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = '테스트할 품목에 해당하는 QC 사양을 가져옵니다.';
                trigger OnAction()
                var
                    QCSpec: Record "Quality Specification Header";
                    QCSpecLine: Record "Quality Specification Line";
                    QTestLine: Record "Quality Test Line";
                    LastLineNo: Integer;
                begin
                    if Rec."Item No." = '' then
                        Error('품목번호가 정의되어 있지 않습니다.');
                    QCSpec.Reset();
                    QCSpec.SetRange("Item No.",Rec."Item No.");
                    if Rec."Customer No." <> '' then
                        QCSpec.SetFilter("Customer No.",Rec."Customer No.");
                    if QCSpec.Find('-') then 
                    begin
                        QCSpecLine.Reset();
                        QCSpecLine.SetRange("Document No.",QCSpec."Spec No.");
                        if QCSpecLine.FindSet() then
                        begin
                            Clear(LastLineNo);
                            QTestLine.Reset();
                            QTestLine.SetRange("Document No.",Rec."No.");
                            if QTestLine.find('+') then
                                LastLineNo := QTestLine."Line No.";
                            repeat
                                LastLineNo += 10000;
                                QTestLine.Init();
                                QTestLine."Document No." := Rec."No.";
                                QTestLine."Line No." := LastLineNo;
                                QTestLine.Insert();
                                QTestLine.Validate("Quality Measure",QCSpecLine."Quality Measure");
                                QTestLine.Validate("Quality Method",QCSpecLine."Quality Method");
                                QTestLine.Conditions := QCSpecLine.Conditions;
                                QTestLine."Lower Limit" := QCSpecLine."Lower Limit";
                                QTestLine."Upper Limit" := QCSpecLine."Upper Limit";
                                QTestLine."Nominal Value" := QCSpecLine."Nominal Value";
                                QTestLine.Modify();
                            until QCSpecLine.Next() = 0;
                            CurrPage.Update();
                        end;
                    end else 
                    begin
                        Message('%1 품번에 대한 QC 사양이 정의되어 있지 않습니다.먼저 사양을 정의하세요.\매출처를 정의한경우, 품목과 매출처를 모두 입력한 사양이 필요합니다.',Rec."Item No.");
                    end;;
                end;
            }
            action(Certified)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Complete', KOR = '테스트완료처리';
                Image = CompleteLine;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = '테스트를 완료처리합니다.';
                trigger OnAction()
                var
                    QCTestLine: Record "Quality Test Line";
                    ItemLedger: Record "Item Ledger Entry";
                    isNonCompliance: Boolean;
                begin
                    isNonCompliance := false;
                    if Rec.Status = Rec.Status::Certified then
                        Error('이미 완료처리된 테스트를 다시 처리할 수 없습니다.\문서를 확인하세요.');
                    
                    //Line 점검.
                    QCTestLine.Reset();
                    QCTestLine.SetRange("Document No.",Rec."No.");
                    if QCTestLine.FindSet() then
                    begin
                        repeat
                            if QCTestLine."Test Completion" = false then
                                Error('모든 라인이 테스트가 완료되어야 합니다.\%1 테스트에 대해서 진행을 먼저 해주세요.',QCTestLine."Quality Measure");
                            if QCTestLine."Non Compliance" = true then
                                isNonCompliance := true;
                        until QCTestLine.Next() = 0;

                        //Item Ledger 해당 라인에 업데이트(결과)
                        ItemLedger.Reset();
                        ItemLedger.SetRange("Entry No.",Rec."Test Item Ledger Entry No.");
                        if ItemLedger.Find('-') then
                        begin
                            ItemLedger."QC Compliance" := ItemLedger."QC Compliance"::Yes;
                            if isNonCompliance then
                                ItemLedger."QC Non Compliance" := true;
                            ItemLedger.Modify();
                        end;
                        Rec.Status := Rec.Status::Certified;
                        isEditable := false;
                        CurrPage.Update();
                    end;

                end;
            }
            action(ReOpen)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Reopen', KOR = '다시열기';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = '테스트를 다시 열어서 재확인합니다.';
                trigger OnAction()
                var
                    ItemLedger: Record "Item Ledger Entry";
                begin
                    if Rec.Status <> Rec.Status::Certified then
                        Error('다시열기 위해서는, 상태가 완료(Certified) 여야 합니다.');

                    //Item Ledger 해당 라인에 업데이트(결과)
                    ItemLedger.Reset();
                    ItemLedger.SetRange("Entry No.",Rec."Test Item Ledger Entry No.");
                    if ItemLedger.Find('-') then
                    begin
                        ItemLedger."QC Compliance" := "Quality Control Compliance".FromInteger(0);
                        ItemLedger."QC Non Compliance" := false;
                        ItemLedger.Modify();
                    end;                    
                    Rec.Status := Rec.Status::"Ready for Review";
                    isEditable := true;
                    CurrPage.Update();
                end;
            }
        }
        area(Reporting)
        {
            action(TestWorkSheet)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Testing Worksheet', KOR = '테스트 작업시트';
                Image = Questionnaire;
                Promoted = true;
                PromotedCategory = Report;
                ToolTip = '해당 테스트문서에 대해서 QC 작업을 진행할 작업시트를 출력합니다.';
                trigger OnAction()
                var
                    QCTest: Record "Quality Test Header";
                    TestWorkSheetRpt: Report "Quality Test Worksheet";
                begin
                    QCTest.Reset();
                    QCTest.SetRange("No.",Rec."No.");
                    TestWorkSheetRpt.SetTableView(QCTest);
                    TestWorkSheetRpt.RunModal();
                end;
            }
        }        
    }    
    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Certified then
            isEditable := false
        else
            isEditable := true;

    end;
    trigger OnInit()
    begin
        isEditable := true;
    end;
    var
        isEditable: Boolean;
}
