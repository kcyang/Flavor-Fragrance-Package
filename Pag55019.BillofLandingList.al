page 55019 "Bill of Landing List"
{
    
    CaptionML = ENU='Bill of Landing List',KOR='B/L 목록';
    PageType = List;
    SourceTable = "Bill of Landing";
    SourceTableView = SORTING("BL No.") ORDER(Ascending);
    Editable = false;
    CardPageId = "Bill of Landing Card";
    PromotedActionCategoriesML = ENU = 'New,Process,Report,Approve,Request Approval,Print/Send', KOR = '신규,프로세스,보고서,승인,승인요청,인쇄/전송';    
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("BL No."; Rec."BL No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("BL Date"; Rec."BL Date")
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
                field("Ship Date"; Rec."Ship Date")
                {
                    ApplicationArea = All;
                }
                field("Import Reference No."; Rec."Import Reference No.")
                {
                    ApplicationArea = All;
                }
                field("Import Reference Date"; Rec."Import Reference Date")
                {
                    ApplicationArea = All;
                }
                field("Import Refefence Remark"; Rec."Import Refefence Remark")
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Currency Exch. Rates"; Rec."Currency Exch. Rates")
                {
                    ApplicationArea = All;
                }
                field("Amount (FCY)"; Rec."Amount (FCY)")
                {
                    ApplicationArea = All;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Purch. Receipt No Count"; Rec."Purch. Receipt No Count")
                {
                    ApplicationArea = All;
                }
                field("Purch. Cr. Memo Count"; Rec."Purch. Cr. Memo Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(setRelease)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Release', KOR = '확정처리';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'B/L 상태를 확정으로 처리합니다.';
                trigger OnAction()
                begin
                    Status := Status::Released;
                    Modify(false);
                end;
            }
            action(setReOpen)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Reopen', KOR = '다시열기';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'B/L 상태를 오픈상태로 처리합니다.';
                trigger OnAction()
                begin
                    Status := Status::Open;
                    Modify(false);
                end;

            }
            action(setComplete)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Complete', KOR = '부대비용완료처리';
                Image = CompleteLine;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'B/L 상태를 부대비용배분 완료로 처리합니다.';
                trigger OnAction()
                begin
                    Status := Status::"Charge Complete";
                    Modify(false);
                end;

            }
        }
    }
    
}
