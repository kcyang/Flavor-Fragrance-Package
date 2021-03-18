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
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
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
                ApplicationArea = All;
                CaptionML = ENU = '📏 Get QC Spec.', KOR = '📏 측정사양가져오기';
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
        }
    }    
}
