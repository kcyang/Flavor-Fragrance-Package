page 55008 "Formula Manage"
{
    
    CaptionML = ENU='Formula Manage',KOR='처방 관리';
    PageType = List;
    SourceTable = "Formula Manage";
    SourceTableView = SORTING("No.") ORDER(Ascending);
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;
    PromotedActionCategoriesML = ENU = 'Process,Report,Order',KOR='프로세스,보고서,주문';
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field(D_LAT_COST; Rec.D_LAT_COST)
                {
                    ApplicationArea = All;
                }
                field(D_FWD_COST; Rec.D_FWD_COST)
                {
                    ApplicationArea = All;
                }
                field(D_AVE_COST; Rec.D_AVE_COST)
                {
                    ApplicationArea = All;
                }
                field(APP_DESCR; Rec.APP_DESCR)
                {
                    ApplicationArea = All;
                }
                field(D_Type; Rec.D_Type)
                {
                    ApplicationArea = All;
                }
                field(B_Type2; Rec.B_Type2)
                {
                    ApplicationArea = All;
                }
                field(ApplyName; Rec.ApplyName)
                {
                    ApplicationArea = All;
                }
                field(OdorDesc; Rec.OdorDesc)
                {
                    ApplicationArea = All;
                }
                field(TECHNOLOGIST; Rec.TECHNOLOGIST)
                {
                    ApplicationArea = All;
                }
                field(DATE_OF_APP; Rec.DATE_OF_APP)
                {
                    ApplicationArea = All;
                }
                field(EVAL_NOTES; Rec.EVAL_NOTES)
                {
                    ApplicationArea = All;
                }
                field(Note1; Rec.Note1)
                {
                    ApplicationArea = All;
                }
                field(EVAL_NOTES_POS; Rec.EVAL_NOTES_POS)
                {
                    ApplicationArea = All;
                }
                field(Concept_POS; Rec.Concept_POS)
                {
                    ApplicationArea = All;
                }
                field(Top_POS; Rec.Top_POS)
                {
                    ApplicationArea = All;
                }
                field(Middle_POS; Rec.Middle_POS)
                {
                    ApplicationArea = All;
                }
                field(Base_POS; Rec.Base_POS)
                {
                    ApplicationArea = All;
                }
                field(ETC_POS; Rec.ETC_POS)
                {
                    ApplicationArea = All;
                }
                field(Color_POS; Rec.Color_POS)
                {
                    ApplicationArea = All;
                }
                field(DLIMONENE; Rec.DLIMONENE)
                {
                    ApplicationArea = All;
                }
                field(EU_ALLERGEN; Rec.EU_ALLERGEN)
                {
                    ApplicationArea = All;
                }
                field(HOT_ISSUE; Rec.HOT_ISSUE)
                {
                    ApplicationArea = All;
                }
                field(K_REACH; Rec.K_REACH)
                {
                    ApplicationArea = All;
                }
                field(Natural; Rec.Natural)
                {
                    ApplicationArea = All;
                }
                field(N_Prohibit; Rec.N_Prohibit)
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
            action(DataUpdate)
            {
                CaptionML = ENU='Update Data',KOR='자료업데이트';
                ApplicationArea = All;
                Image = LinesFromTimesheet;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(DangerUpdate)
            {
                CaptionML = ENU='Update Dangerous Content',KOR='위험물 함량업데이트';
                ApplicationArea = All;
                Image = Warning;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(BOM)
            {
                CaptionML = ENU='BOM',KOR='BOM';
                ApplicationArea = All;
                Image = BOM;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(Guide)
            {
                CaptionML = ENU='Guide',KOR='업체별 가이드';
                ApplicationArea = All;
                Image = Documents;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(EditGuide)
            {
                CaptionML = ENU='Edit Guide',KOR='가이드 수정';
                ApplicationArea = All;
                Image = EditAttachment;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
        }
        area(Navigation)
        {
            action(PostedSalesInvoice)
            {
                CaptionML = ENU='Posted Sales Invoice',KOR='전기된 매출송장';
                ApplicationArea = All;
                Image = PostedTaxInvoice;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(PostedSampleInvoice)
            {
                CaptionML = ENU='Posted Sample Invoice',KOR='전기된 샘플송장';
                ApplicationArea = All;
                Image = PostedInventoryPick;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
        }
        area(Reporting)
        {
            action(UnitCost)
            {
                CaptionML = ENU='Unit Cost',KOR='단위 원가';
                ApplicationArea = All;
                Image = Cost;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(ForwardCost)
            {
                CaptionML = ENU='Forward Cost',KOR='Forward Cost';
                ApplicationArea = All;
                Image = CostBudget;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(PrintFormula)
            {
                CaptionML = ENU='Print Formula',KOR='처방 인쇄';
                ApplicationArea = All;
                Image = PrintAcknowledgement;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
            action(PurchSimulation)
            {
                CaptionML = ENU='Simulation(Purch)',KOR='시뮬레이션(구매)';
                ApplicationArea = All;
                Image = Simulate;
                trigger OnAction()
                begin
                    Message('🚽기능 업데이트 중입니다!🚬');
                end;
            }
        }
    }
    
}
