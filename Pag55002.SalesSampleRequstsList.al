/// <summary>
/// 샘플 요청서 목록페이지 입니다. 
/// 유형은, 리스트입니다.
/// </summary>
//TODO 번역추가.
page 55002 "Sales Sample Requsts List"
{
    ApplicationArea = Basic, Suite, Assembly;
    CaptionML = ENU = 'Sales Sample Requests', KOR = '샘플요청 목록';
    CardPageID = "Sales Sample Request";
    DataCaptionFields = "Sell-to Customer No.";
    Editable = false;
    PageType = List;
    PromotedActionCategoriesML = ENU='New,Process,Report,Request Approval,Order,Release,Posting,Print/Send,Navigate',KOR='신규,프로세스,보고서,승인요청,주문,확정,전기,인쇄/전송,탐색';
    QueryCategory = 'Sales Sample Requests List';
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    //Source Table 은, Sample Request 를 추가하여 사용합니다.
    SourceTableView = WHERE("Document Type" = CONST("Sample Request"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the customer.';
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the postal code of the customer''s main address.';
                    Visible = false;
                }
                field("Sell-to Country/Region Code"; "Sell-to Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region code of the customer''s main address.';
                    Visible = false;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the contact person at the customer''s main address.';
                    Visible = false;
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                    Visible = false;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the customer that you send or sent the invoice or credit memo to.';
                    Visible = false;
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the postal code of the customer''s billing address.';
                    Visible = false;
                }
                field("Bill-to Country/Region Code"; "Bill-to Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region code of the customer''s billing address.';
                    Visible = false;
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the contact person at the customer''s billing address.';
                    Visible = false;
                }
                field("Ship-to Code"; "Ship-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    Visible = false;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the customer at the address that the items are shipped to.';
                    Visible = false;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the postal code of the address that the items are shipped to.';
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region code of the address that the items are shipped to.';
                    Visible = false;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the contact person at the address that the items are shipped to.';
                    Visible = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
                field("Quote No."; "Quote No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the sales quote that the sales order was created from. You can track the number to sales quote documents that you have printed, saved, or emailed.';
                    Visible = false;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
                    Visible = false;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency of amounts on the sales document.';
                    Visible = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date that the customer has asked for the order to be delivered.';
                    Visible = false;
                }
                field("Campaign No."; "Campaign No.")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the campaign number the document is linked to.';
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                    Visible = false;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies when the sales invoice must be paid.';
                    Visible = false;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                    Visible = false;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                    Visible = false;
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
                    Visible = false;
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.';
                    Visible = false;
                }
                field("Package Tracking No."; "Package Tracking No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the shipping agent''s package number.';
                    Visible = false;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                    Visible = false;
                }
                field("Shipping Advice"; "Shipping Advice")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the customer accepts partial shipment of orders.';
                    Visible = false;
                }
                field("Completely Shipped"; "Completely Shipped")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether all the items on the order have been shipped or, in the case of inbound items, completely received.';
                }
                field("Job Queue Status"; "Job Queue Status")
                {
                    ApplicationArea = All;
                    Style = Unfavorable;
                    StyleExpr = "Job Queue Status" = "Job Queue Status"::ERROR;
                    ToolTip = 'Specifies the status of a job queue entry or task that handles the posting of sales orders.';
                    Visible = JobQueueActive;

                    trigger OnDrillDown()
                    var
                        JobQueueEntry: Record "Job Queue Entry";
                    begin
                        if "Job Queue Status" = "Job Queue Status"::" " then
                            exit;
                        JobQueueEntry.ShowStatusMsg("Job Queue Entry ID");
                    end;
                }
                field("Amt. Ship. Not Inv. (LCY) Base"; "Amt. Ship. Not Inv. (LCY) Base")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
                }
                field("Amt. Ship. Not Inv. (LCY)"; "Amt. Ship. Not Inv. (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of amounts in the Line Amount field on the sales order lines.';
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total of the amounts, including VAT, on all the lines on the document.';
                }
                field("Posting Description"; "Posting Description")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(36),
                              "No." = FIELD("No."),
                              "Document Type" = FIELD("Document Type");
            }
            part("Power BI Report FactBox"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
                Visible = PowerBIVisible;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Basic, Suite;
                ShowFilter = false;
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                CaptionML = ENU = 'O&rder', KOR = '주문';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    CaptionML = ENU = 'Dimensions', KOR = '관리항목';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDocDim;
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Statistics', KOR = '상태';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                    trigger OnAction()
                    begin
                        OpenSalesOrderStatistics;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Approvals', KOR = '승인';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RecordId, DATABASE::"Sales Header", "Document Type".AsInteger(), "No.");
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    CaptionML = ENU = 'Co&mments', KOR = '주석';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                    ToolTip = 'View or add comments for the record.';
                }
            }
            group(Documents)
            {
                CaptionML = ENU = 'Documents', KOR = '문서';
                Image = Documents;
                action("S&hipments")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'S&hipments', KOR = '출고';
                    Image = Shipment;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Posted Sales Shipments";
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                    ToolTip = 'View related posted sales shipments.';
                }
                action(PostedSalesInvoices)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Invoices', KOR = '송장';
                    Image = Invoice;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Posted Sales Invoices";
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                    ToolTip = 'View a list of ongoing sales invoices for the order.';
                }
                action(PostedSalesPrepmtInvoices)
                {
                    ApplicationArea = Prepayments;
                    CaptionML = ENU = 'Prepa&yment Invoices', KOR = '선불송장';
                    Image = PrepaymentInvoice;
                    RunObject = Page "Posted Sales Invoices";
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                    ToolTip = 'View related posted sales invoices that involve a prepayment. ';
                }
                action("Prepayment Credi&t Memos")
                {
                    ApplicationArea = Prepayments;
                    CaptionML = ENU = 'Prepayment Credi&t Memos', KOR = '선불반품송장';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page "Posted Sales Credit Memos";
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                    ToolTip = 'View related posted sales credit memos that involve a prepayment. ';
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU = 'Warehouse', KOR = '창고';
                Image = Warehouse;
                action("Warehouse Shipment Lines")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU = 'Warehouse Shipment Lines', KOR = '창고출고라인';
                    Image = ShipmentLines;
                    RunObject = Page "Whse. Shipment Lines";
                    RunPageLink = "Source Type" = CONST(37),
                                  "Source Subtype" = FIELD("Document Type"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                    ToolTip = 'View ongoing warehouse shipments for the document, in advanced warehouse configurations.';
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU = 'In&vt. Put-away/Pick Lines', KOR = '재고 적치/불출 라인';
                    Image = PickLines;
                    RunObject = Page "Warehouse Activity List";
                    RunPageLink = "Source Document" = CONST("Sales Order"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Document", "Source No.", "Location Code");
                    ToolTip = 'View items that are inbound or outbound on inventory put-away or inventory pick documents for the transfer order.';
                }
            }
            /*          //CRM 연동관련 불필요. //FIXME 나중에 삭제할 것.  
                        group(ActionGroupCRM)
                        {
                            Caption = 'Dynamics 365 Sales';
                            Visible = CRMIntegrationEnabled;
                            action(CRMGoToSalesOrderListInNAV)
                            {
                                ApplicationArea = Basic, Suite;
                                CaptionML = ENU='Sales Order List',KOR='판매주문목록';
                                Enabled = CRMIntegrationEnabled;
                                Image = "Order";
                                ToolTip = 'Open the Sales Order List - Dynamics 365 Sales page in Business Central';
                                Visible = CRMIntegrationEnabled;

                                trigger OnAction()
                                var
                                    CRMSalesorder: Record "CRM Salesorder";
                                begin
                                    PAGE.Run(PAGE::"CRM Sales Order List", CRMSalesorder);
                                end;
                            }
                        }
            */
        }
        area(processing)
        {
            group(Action12)
            {
                CaptionML = ENU = 'Release', KOR = '확정';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Re&lease', KOR = '확정';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Re&open', KOR = '다시열기';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU = 'F&unctions', KOR = '기능';
                Image = "Action";
                action("Pla&nning")
                {
                    ApplicationArea = Planning;
                    CaptionML = ENU = 'Pla&nning', KOR = '계획';
                    Image = Planning;
                    ToolTip = 'Open a tool for manual supply planning that displays all new demand along with availability information and suggestions for supply. It provides the visibility and tools needed to plan for demand from sales lines and component lines and then create different types of supply orders directly.';

                    trigger OnAction()
                    var
                        SalesOrderPlanningForm: Page "Sales Order Planning";
                    begin
                        SalesOrderPlanningForm.SetSalesOrder("No.");
                        SalesOrderPlanningForm.RunModal;
                    end;
                }
                action("Order &Promising")
                {
                    AccessByPermission = TableData "Order Promising Line" = R;
                    ApplicationArea = OrderPromising;
                    CaptionML = ENU = 'Order &Promising', KOR = '주문 예측';
                    Image = OrderPromising;
                    ToolTip = 'Calculate the shipment and delivery dates based on the item''s known and expected availability dates, and then promise the dates to the customer.';

                    trigger OnAction()
                    var
                        OrderPromisingLine: Record "Order Promising Line" temporary;
                    begin
                        OrderPromisingLine.SetRange("Source Type", "Document Type");
                        OrderPromisingLine.SetRange("Source ID", "No.");
                        PAGE.RunModal(PAGE::"Order Promising Lines", OrderPromisingLine);
                    end;
                }
                action("Send IC Sales Order Cnfmn.")
                {
                    AccessByPermission = TableData "IC G/L Account" = R;
                    ApplicationArea = Intercompany;
                    CaptionML = ENU = 'Send IC Sales Order Cnfmn.', KOR = 'IC 확정 매출주문 전송';
                    Image = IntercompanyOrder;
                    ToolTip = 'Send the document to the intercompany outbox or directly to the intercompany partner if automatic transaction sending is enabled.';

                    trigger OnAction()
                    var
                        ICInOutboxMgt: Codeunit ICInboxOutboxMgt;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.PrePostApprovalCheckSales(Rec) then
                            ICInOutboxMgt.SendSalesDoc(Rec, false);
                    end;
                }
                action("Delete Invoiced")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Delete Invoiced Sales Orders', KOR = '송장완료된 매출주문 삭제';
                    Image = Delete;
                    RunObject = Report "Delete Invoiced Sales Orders";
                    ToolTip = 'Delete orders that were not automatically deleted after completion. For example, when several sales orders were completed by a single invoice.';
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU = 'Request Approval', KOR = '승인요청';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Send A&pproval Request', KOR = '승인요청 전송';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.CheckSalesApprovalPossible(Rec) then
                            ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Cancel Approval Re&quest', KOR = '승인요청 취소';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                        WorkflowWebhookManagement.FindAndCancel(RecordId);
                    end;
                }
            }
            group(Action3)
            {
                CaptionML = ENU = 'Warehouse', KOR = '창고';
                Image = Warehouse;
                action("Create Inventor&y Put-away/Pick")
                {
                    AccessByPermission = TableData "Posted Invt. Pick Header" = R;
                    ApplicationArea = Warehouse;
                    CaptionML = ENU = 'Create Inventor&y Put-away/Pick', KOR = '재고 불출/적재문서 생성';
                    Ellipsis = true;
                    Image = CreatePutawayPick;
                    ToolTip = 'Create an inventory put-away or inventory pick to handle items on the document according to a basic warehouse configuration that does not require warehouse receipt or shipment documents.';

                    trigger OnAction()
                    begin
                        CreateInvtPutAwayPick;

                        if not Find('=><') then
                            Init;
                    end;
                }
                action("Create &Warehouse Shipment")
                {
                    AccessByPermission = TableData "Warehouse Shipment Header" = R;
                    ApplicationArea = Warehouse;
                    CaptionML = ENU = 'Create &Warehouse Shipment', KOR = '창고출고문서 생성';
                    Image = NewShipment;
                    ToolTip = 'Create a warehouse shipment to start a pick a ship process according to an advanced warehouse configuration.';

                    trigger OnAction()
                    var
                        GetSourceDocOutbound: Codeunit "Get Source Doc. Outbound";
                    begin
                        GetSourceDocOutbound.CreateFromSalesOrder(Rec);

                        if not Find('=><') then
                            Init;
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU = 'P&osting', KOR = '전기';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'P&ost', KOR = '전기';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        SalesBatchPostMgt: Codeunit "Sales Batch Post Mgt.";
                        BatchProcessingMgt: Codeunit "Batch Processing Mgt.";
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.Count > 1 then begin
                            BatchProcessingMgt.SetParameter("Batch Posting Parameter Type"::Invoice, true);
                            BatchProcessingMgt.SetParameter("Batch Posting Parameter Type"::Ship, true);

                            SalesBatchPostMgt.SetBatchProcessor(BatchProcessingMgt);
                            SalesBatchPostMgt.RunWithUI(SalesHeader, Count, ReadyToPostQst);
                        end else
                            PostDocument(CODEUNIT::"Sales-Post (Yes/No)");
                    end;
                }
                action(PostAndSend)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Post and Send', KOR = '전기 및 전송';
                    Ellipsis = true;
                    Image = PostMail;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    ToolTip = 'Finalize and prepare to send the document according to the customer''s sending profile, such as attached to an email. The Send document to window opens where you can confirm or select a sending profile.';

                    trigger OnAction()
                    begin
                        PostDocument(CODEUNIT::"Sales-Post and Send");
                    end;
                }
                action("Test Report")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Test Report', KOR = '테스트 보고서';
                    Ellipsis = true;
                    Image = TestReport;
                    ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                    trigger OnAction()
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("Post &Batch")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Post &Batch', KOR = '배치 전기';
                    Ellipsis = true;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Post several documents at once. A report request window opens where you can specify which documents to post.';

                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        SelectionFilterManagement: Codeunit SelectionFilterManagement;
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        SalesHeader.SetFilter("No.", SelectionFilterManagement.GetSelectionFilterForSalesHeader(SalesHeader));
                        REPORT.RunModal(REPORT::"Batch Post Sales Orders", true, true, SalesHeader);
                        CurrPage.Update(false);
                    end;
                }
                action("Remove From Job Queue")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Remove From Job Queue', KOR = '잡큐에서 제거';
                    Image = RemoveLine;
                    ToolTip = 'Remove the scheduled processing of this record from the job queue.';
                    Visible = JobQueueActive;

                    trigger OnAction()
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                action("Preview Posting")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Preview Posting', KOR = '전기 미리보기';
                    Image = ViewPostedOrder;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Review the different types of entries that will be created when you post the document or journal.';

                    trigger OnAction()
                    begin
                        ShowPreview
                    end;
                }
            }
            group("&Print")
            {
                CaptionML = ENU = '&Print', KOR = '인쇄';
                Image = Print;
                action("Work Order")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Work Order', KOR = '작업 주문';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Prepare to registers actual item quantities or time used in connection with the sales order. For example, the document can be used by staff who perform any kind of processing work in connection with the sales order. It can also be exported to Excel if you need to process the sales line data further.';

                    trigger OnAction()
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Work Order");
                    end;
                }
                action("Pick Instruction")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU = 'Pick Instruction', KOR = '불출 지시서';
                    Image = Print;
                    ToolTip = 'Print a picking list that shows which items to pick and ship for the sales order. If an item is assembled to order, then the report includes rows for the assembly components that must be picked. Use this report as a pick instruction to employees in charge of picking sales items or assembly components for the sales order.';

                    trigger OnAction()
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");
                    end;
                }
            }
            group("&Order Confirmation")
            {
                CaptionML = ENU = '&Order Confirmation', KOR = '주문 확인';
                Image = Email;
                action("Email Confirmation")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Email Confirmation', KOR = '이메일로 확인';
                    Ellipsis = true;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Send an order confirmation by email. The Send Email window opens prefilled for the customer so you can add or change information before you send the email.';

                    trigger OnAction()
                    begin
                        DocPrint.EmailSalesHeader(Rec);
                    end;
                }
                action("Print Confirmation")
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Print Confirmation', KOR = '확인서 인쇄';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Print an order confirmation. A report request window opens where you can specify what to include on the print-out.';
                    Visible = NOT IsOfficeAddin;

                    trigger OnAction()
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");
                    end;
                }
                action(AttachAsPDF)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Attach as PDF', KOR = 'PDF로 첨부';
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = Category8;
                    Ellipsis = true;
                    ToolTip = 'Create a PDF file and attach it to the document.';

                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                    begin
                        SalesHeader := Rec;
                        CurrPage.SetSelectionFilter(SalesHeader);
                        DocPrint.PrintSalesOrderToDocumentAttachment(SalesHeader, DocPrint.GetSalesOrderPrintToAttachmentOption(Rec));
                    end;
                }
            }
            group(Display)
            {
                CaptionML = ENU = 'Display', KOR = '보기';
                action(ReportFactBoxVisibility)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU = 'Show/Hide Power BI Reports', KOR = 'Power BI 보고서 보기/숨기기';
                    Image = "Report";
                    ToolTip = 'Select if the Power BI FactBox is visible or not.';

                    trigger OnAction()
                    begin
                        // save visibility value into the table
                        CurrPage."Power BI Report FactBox".PAGE.SetFactBoxVisibility(PowerBIVisible);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Sales Reservation Avail.")
            {
                ApplicationArea = Reservation;
                CaptionML = ENU = 'Sales Reservation Avail.', KOR = '판매 예약가능';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Sales Reservation Avail.";
                ToolTip = 'View, print, or save an overview of availability of items for shipment on sales documents, filtered on shipment status.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlVisibility;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

        // Contextual Power BI FactBox: send data to filter the report in the FactBox
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection("No.", false, PowerBIVisible);
    end;

    trigger OnFindRecord(Which: Text): Boolean
    var
        NextRecNotFound: Boolean;
    begin
        if not Find(Which) then
            exit(false);

        if ShowHeader then
            exit(true);

        repeat
            NextRecNotFound := Next <= 0;
            if ShowHeader then
                exit(true);
        until NextRecNotFound;

        exit(false);
    end;

    trigger OnInit()
    begin
        PowerBIVisible := false;
        CurrPage."Power BI Report FactBox".PAGE.InitFactBox(CurrPage.ObjectId(false), CurrPage.Caption, PowerBIVisible);
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    var
        NewStepCount: Integer;
    begin
        repeat
            NewStepCount := Next(Steps);
        until (NewStepCount = 0) or ShowHeader;

        exit(NewStepCount);
    end;

    trigger OnOpenPage()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        OfficeMgt: Codeunit "Office Management";
    begin
        if UserMgt.GetSalesFilter <> '' then begin
            FilterGroup(2);
            SetRange("Responsibility Center", UserMgt.GetSalesFilter);
            FilterGroup(0);
        end;

        SetRange("Date Filter", 0D, WorkDate());

        JobQueueActive := SalesSetup.JobQueueActive;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        IsOfficeAddin := OfficeMgt.IsAvailable;

        CopySellToCustomerFilter;
    end;

    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        DocPrint: Codeunit "Document-Print";
        ReportPrint: Codeunit "Test Report-Print";
        UserMgt: Codeunit "User Setup Management";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        [InDataSet]
        JobQueueActive: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CRMIntegrationEnabled: Boolean;
        IsOfficeAddin: Boolean;
        CanCancelApprovalForRecord: Boolean;
        SkipLinesWithoutVAT: Boolean;
        PowerBIVisible: Boolean;
        ReadyToPostQst: Label 'The number of orders that will be posted is %1. \Do you want to continue?', Comment = '%1 - selected count';
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;

    procedure ShowPreview()
    var
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure SetControlVisibility()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);

        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        WorkflowWebhookManagement.GetCanRequestAndCanCancel(RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

    local procedure PostDocument(PostingCodeunitID: Integer)
    var
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
    begin
        if ApplicationAreaMgmtFacade.IsFoundationEnabled then
            LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);

        SendToPosting(PostingCodeunitID);

        CurrPage.Update(false);
    end;

    procedure SkipShowingLinesWithoutVAT()
    begin
        SkipLinesWithoutVAT := true;
    end;

    local procedure ShowHeader(): Boolean
    var
        CashFlowManagement: Codeunit "Cash Flow Management";
    begin
        if not SkipLinesWithoutVAT then
            exit(true);

        exit(CashFlowManagement.GetTaxAmountFromSalesOrder(Rec) <> 0);
    end;




}
