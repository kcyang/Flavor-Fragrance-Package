/// <summary>
/// 샘플요청서의 SubForm 입니다.
/// </summary>
page 55001 "Sales Sample Request Subform"
{
    AutoSplitKey = true;
    CaptionML = ENU='Lines',KOR='라인';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    //이 페이지는, Sample Request 유형에 대해서동작하도록 합니다.
    SourceTableView = WHERE("Document Type" = FILTER("Sample Request"));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Type; Type)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the line type.';

                    trigger OnValidate()
                    begin
                        NoOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Item: Record Item;
                        ItemList: Page "Item List";
                        SalesSetup: Record "Sales & Receivables Setup";
                    begin
                        //품목유형인 경우, 외상매출설정에 정의된 품목으로 선택하도록 한다.
                        if Type = Type::Item then begin
                            if SalesSetup.Get() then
                            begin
                                if SalesSetup."Sample Item No." = '' then
                                    Error('외상매출 설정에, 샘플 품목번호를 먼저 지정하시기 바랍니다.');
                                Item.Reset();                                
                                Item.SetRange("No.",SalesSetup."Sample Item No.");
                                ItemList.SetTableView(Item);
                                ItemList.LookupMode(true);
                                if ItemList.RunModal() = Action::LookupOK then
                                begin
                                    ItemList.GetRecord(Item);
                                    Validate("No.",Item."No.");
                                end;
                            end;
                        end;
                    end;
                    trigger OnValidate()
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                /*
                field("Cross-Reference No."; Rec."Cross-Reference No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the cross-referenced item number. If you enter a cross reference between yours and your vendor''s or customer''s item number, then this number will override the standard item number when you enter the cross-reference number on a sales or purchase document.';
                    Visible = false;
                    ObsoleteReason = 'Cross-Reference replaced by Item Reference feature.';
                    ObsoleteState = Pending;
                    ObsoleteTag = '17.0';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CrossReferenceNoLookUp();
                        InsertExtendedText(false);
                        OnCrossReferenceNoOnLookup(Rec);
                    end;

                    trigger OnValidate()
                    begin
                        InsertExtendedText(false);
                        DeltaUpdateTotals();
                    end;
                }
                */
                field("Item Reference No."; "Item Reference No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the referenced item number.';
                    Visible = ItemReferenceVisible;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemReferenceMgt: Codeunit "Item Reference Management";
                    begin
                        ItemReferenceMgt.SalesReferenceNoLookup(Rec);
                        InsertExtendedText(false);
                        OnCrossReferenceNoOnLookup(Rec);
                    end;

                    trigger OnValidate()
                    begin
                        InsertExtendedText(false);
                        DeltaUpdateTotals();
                    end;
                }
                field("Variant Code"; "Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        VariantCodeOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the blanket sales order.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';

                    trigger OnValidate()
                    begin
                        LocationCodeOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies the quantity of the sales order line.';

                    trigger OnValidate()
                    begin
                        QuantityOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                field("Qty. to Assemble to Order"; "Qty. to Assemble to Order")
                {
                    ApplicationArea = Assembly;
                    ToolTip = 'Specifies how many units of the blanket sales line quantity that you want to supply by assembly.';
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        ShowAsmToOrderLines();
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                        CurrPage.Update(true);
                    end;
                }
                field("Work Type Code"; "Work Type Code")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the work type code of the service line linked to this entry.';
                    Visible = false;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';

                    trigger OnValidate()
                    begin
                        UnitofMeasureCodeOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                    Visible = false;
                }
                field(Application;Application)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Application',KOR='Application';
                    ToolTip = 'Application 을 정의합니다.';
                }
                field(Direction;Direction)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Direction',KOR='Direction(방향)';
                    ToolTip = '방향(Direction)을 정의합니다.';
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Cost (LCY)',KOR='원가';
                    ToolTip = '샘플요청서에 표시될 원가를 표시하시면 됩니다.';
                    //Visible = false;
                }
                field(PriceExists; PriceExists)
                {
                    ApplicationArea = Suite;
                    Caption = 'Sale Price Exists';
                    Editable = false;
                    ToolTip = 'Specifies that there is a specific price for this customer. The sales prices can be seen in the Sales Prices window.';
                    Visible = false;
                }
                field("Unit Price"; "Unit Price")
                {
                    CaptionML = ENU='Unit Price',KOR='단가';
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    ApplicationArea = SalesTax;
                    Editable = false;
                    ToolTip = 'Specifies if this vendor charges you sales tax for purchases.';
                    Visible = false;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    ApplicationArea = SalesTax;
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                    ApplicationArea = SalesTax;
                    ToolTip = 'Specifies the tax group code for the tax detail entry.';

                    trigger OnValidate()
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies the discount percentage that is granted for the item on the line.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Line Amount"; "Line Amount")
                {
                    CaptionML = ENU='Line Amount',KOR='라인금액(부가세제외)';
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies the net amount, excluding any invoice discount amount, that must be paid for products on the line.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field(LineDiscExists; LineDiscExists)
                {
                    ApplicationArea = Suite;
                    Caption = 'Sales Line Disc. Exists';
                    Editable = false;
                    ToolTip = 'Specifies that there is a specific discount for this customer. The sales line discounts can be seen in the Sales Line Discounts window.';
                    Visible = false;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the discount amount that is granted for the item on the line.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies if the invoice line is included when the invoice discount is calculated.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Qty. to Ship"; "Qty. to Ship")
                {
                    CaptionML = ENU='Qty. to Ship',KOR='출고 수량';
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies the quantity of items that remain to be shipped.';
                }
                field("Quantity Shipped"; "Quantity Shipped")
                {
                    CaptionML = ENU='Quantity Shipped',KOR='출고완료 수량';
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as shipped.';
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                    CaptionML = ENU='Quantity Invoiced',KOR='송장완료 수량';
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as invoiced.';
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = DimVisible1;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = DimVisible2;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = DimVisible3;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(3);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = DimVisible4;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(4);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = DimVisible5;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(5);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = DimVisible6;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(6);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = DimVisible7;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(7);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Visible = DimVisible8;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(8);
                    end;
                }
            }
            group(Control53)
            {
                ShowCaption = false;
                group(Control49)
                {
                    ShowCaption = false;
                    field(SubtotalExclVAT; TotalSalesLine."Line Amount")
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalLineAmountWithVATAndCurrencyCaption(Currency.Code, TotalSalesHeader."Prices Including VAT");
                        Caption = 'Subtotal Excl. VAT';
                        Editable = false;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document.';
                    }
                    field("Invoice Discount Amount"; InvoiceDiscountAmount)
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetInvoiceDiscAmountWithVATAndCurrencyCaption(FieldCaption("Inv. Discount Amount"), Currency.Code);
                        Caption = 'Invoice Discount Amount';
                        Editable = InvDiscAmountEditable;
                        ToolTip = 'Specifies a discount amount that is deducted from the value in the Total Incl. VAT field.';

                        trigger OnValidate()
                        begin
                            DocumentTotals.SalesDocTotalsNotUpToDate();
                            ValidateInvoiceDiscountAmount();
                        end;
                    }
                    field("Invoice Disc. Pct."; InvoiceDiscountPct)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Invoice Discount %';
                        DecimalPlaces = 0 : 2;
                        Editable = InvDiscAmountEditable;
                        ToolTip = 'Specifies a discount percentage that is granted if criteria that you have set up for the customer are met.';

                        trigger OnValidate()
                        begin
                            DocumentTotals.SalesDocTotalsNotUpToDate();
                            AmountWithDiscountAllowed := DocumentTotals.CalcTotalSalesAmountOnlyDiscountAllowed(Rec);
                            InvoiceDiscountAmount := Round(AmountWithDiscountAllowed * InvoiceDiscountPct / 100, Currency."Amount Rounding Precision");
                            ValidateInvoiceDiscountAmount();
                        end;
                    }
                }
                group(Control35)
                {
                    ShowCaption = false;
                    field("Total Amount Excl. VAT"; TotalSalesLine.Amount)
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalExclVATCaption(Currency.Code);
                        Caption = 'Total Amount Excl. VAT';
                        DrillDown = false;
                        Editable = false;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
                    }
                    field("Total VAT Amount"; VATAmount)
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalVATCaption(Currency.Code);
                        Caption = 'Total VAT';
                        Editable = false;
                        ToolTip = 'Specifies the sum of VAT amounts on all lines in the document.';
                    }
                    field("Total Amount Incl. VAT"; TotalSalesLine."Amount Including VAT")
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = "Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalInclVATCaption(Currency.Code);
                        Caption = 'Total Amount Incl. VAT';
                        Editable = false;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Incl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',KOR='라인';
                Image = Line;
                group("Item Availability by")
                {
                    CaptionML = ENU='Item Availability by',KOR='품목 가용량';
                    Image = ItemAvailability;
                    Enabled = Type = Type::Item;
                    action("Event")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Event',KOR='이벤트';
                        Image = "Event";
                        ToolTip = 'View how the actual and the projected available balance of an item will develop over time according to supply and demand events.';

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Period',KOR='기간';
                        Image = Period;
                        ToolTip = 'View the projected quantity of the item over time according to time periods, such as day, week, or month.';

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = Planning;
                        CaptionML = ENU='Variant',KOR='사양';
                        Image = ItemVariant;
                        ToolTip = 'View or edit the item''s variants. Instead of setting up each color of an item as a separate item, you can set up the various colors as variants of the item.';

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData Location = R;
                        ApplicationArea = Location;
                        CaptionML = ENU='Location',KOR='위치';
                        Image = Warehouse;
                        ToolTip = 'View the actual and projected quantity of the item per location.';

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='BOM Level',KOR='BOM레벨';
                        Image = BOMLevel;
                        ToolTip = 'View availability figures for items on bills of materials that show how many units of a parent item you can make based on the availability of child items.';

                        trigger OnAction()
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByBOM)
                        end;
                    }
                }
                group("Unposted Lines")
                {
                    CaptionML = ENU='Unposted Lines',KOR='미전기 라인';
                    Image = "Order";
                    action(Orders)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Orders',KOR='주문';
                        Image = Document;
                        ToolTip = 'View related sales orders.';

                        trigger OnAction()
                        begin
                            ShowOrders;
                        end;
                    }
                    action(Invoices)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Invoices',KOR='송장';
                        Image = Invoice;
                        ToolTip = 'View a list of ongoing sales invoices for the order.';

                        trigger OnAction()
                        begin
                            ShowInvoices;
                        end;
                    }
                    action("Return Orders")
                    {
                        AccessByPermission = TableData "Return Receipt Header" = R;
                        ApplicationArea = SalesReturnOrder;
                        CaptionML = ENU='Return Orders',KOR='반품주문';
                        Image = ReturnOrder;
                        ToolTip = 'Open the list of ongoing return orders.';

                        trigger OnAction()
                        begin
                            ShowReturnOrders;
                        end;
                    }
                    action("Credit Memos")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Credit Memos',KOR='반품송장';
                        Image = CreditMemo;
                        ToolTip = 'View a list of ongoing credit memos for the order.';

                        trigger OnAction()
                        begin
                            ShowCreditMemos;
                        end;
                    }
                }
                group("Posted Lines")
                {
                    CaptionML = ENU='Posted Lines',KOR='전기된 라인';
                    Image = Post;
                    action(Shipments)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Shipments',KOR='출고';
                        Image = Shipment;
                        ToolTip = 'View a list of ongoing sales shipments for the order.';

                        trigger OnAction()
                        begin
                            ShowPostedOrders;
                        end;
                    }
                    action(Action1901092104)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Invoices',KOR='송장';
                        Image = Invoice;
                        ToolTip = 'View a list of ongoing sales invoices for the order.';

                        trigger OnAction()
                        begin
                            ShowPostedInvoices;
                        end;
                    }
                    action("Return Receipts")
                    {
                        AccessByPermission = TableData "Return Receipt Header" = R;
                        ApplicationArea = Suite;
                        CaptionML = ENU='Return Receipts',KOR='반품입고';
                        Image = ReturnReceipt;
                        ToolTip = 'View a list of posted return receipts for the order.';

                        trigger OnAction()
                        begin
                            ShowPostedReturnReceipts;
                        end;
                    }
                    action(Action1901033504)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Credit Memos',KOR='반품송장';
                        Image = CreditMemo;
                        ToolTip = 'View a list of ongoing credit memos for the order.';

                        trigger OnAction()
                        begin
                            ShowPostedCreditMemos;
                        end;
                    }
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    CaptionML = ENU='Dimensions',KOR='관리항목';
                    Image = Dimensions;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDimensions();
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Attachments',KOR='첨부';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
/*                
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    CaptionML = ENU='Co&mments',KOR='주석';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';

                    trigger OnAction()
                    begin
                        ShowLineComments();
                    end;
                }
*/                
                group("Assemble to Order")
                {
                    CaptionML = ENU='Assemble to Order',KOR='조립주문';
                    Image = AssemblyBOM;
                    action("Assemble-to-Order Lines")
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        ApplicationArea = Assembly;
                        CaptionML = ENU='Assemble-to-Order Lines',KOR='조립주문 라인';
                        ToolTip = 'View any linked assembly order lines if the documents represents an assemble-to-order sale.';

                        trigger OnAction()
                        begin
                            ShowAsmToOrderLines();
                        end;
                    }
                    action("Roll Up &Price")
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        ApplicationArea = Assembly;
                        CaptionML = ENU='Roll Up &Price',KOR='단가 업데이트';
                        Ellipsis = true;
                        ToolTip = '조립 부품 변경 사항에 따라 조립품 단가를 업데이트합니다.';

                        trigger OnAction()
                        begin
                            RollupAsmPrice;
                        end;
                    }
                    action("Roll Up &Cost")
                    {
                        AccessByPermission = TableData "BOM Component" = R;
                        ApplicationArea = Assembly;
                        CaptionML = ENU='Roll Up &Cost',KOR='단위원가 업데이트';
                        Ellipsis = true;
                        ToolTip = 'Update the unit cost of the assembly item according to any changes that you have made to the assembly components.';

                        trigger OnAction()
                        begin
                            RollUpAsmCost;
                        end;
                    }
                }
                action(DocumentLineTracking)
                {
                    ApplicationArea = Basic, Suite;
                    CaptionML = ENU='Document &Line Tracking',KOR='문서라인 추적';
                    Image = Navigate;
                    ToolTip = 'View related open, posted, or archived documents or document lines.';

                    trigger OnAction()
                    begin
                        ShowDocumentLineTracking();
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',KOR='기능';
                Image = "Action";
                action("Get &Price")
                {
                    //AccessByPermission = TableData "Sales Price" = R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Get &Price',KOR='단가 불러오기';
                    Ellipsis = true;
                    Image = Price;
                    Visible = not ExtendedPriceEnabled;
                    ToolTip = 'Insert the lowest possible price in the Unit Price field according to any special price that you have set up.';

                    trigger OnAction()
                    begin
                        PickPrice();
                    end;
                }
                action("Get Li&ne Discount")
                {
                    //AccessByPermission = TableData "Sales Line Discount" = R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Get Li&ne Discount',KOR='할인가 불러오기';
                    Ellipsis = true;
                    Image = LineDiscount;
                    Visible = not ExtendedPriceEnabled;
                    ToolTip = 'Insert the best possible discount in the Line Discount field according to any special discounts that you have set up.';

                    trigger OnAction()
                    begin
                        PickDiscount();
                    end;
                }
                action(GetPrice)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Get &Price',KOR='단가 불러오기';
                    Ellipsis = true;
                    Image = Price;
                    Visible = ExtendedPriceEnabled;
                    ToolTip = 'Insert the lowest possible price in the Unit Price field according to any special price that you have set up.';

                    trigger OnAction()
                    begin
                        PickPrice();
                    end;
                }
                action(GetLineDiscount)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Get Li&ne Discount',KOR='할인가 불러오기';
                    Ellipsis = true;
                    Image = LineDiscount;
                    Visible = ExtendedPriceEnabled;
                    ToolTip = 'Insert the best possible discount in the Line Discount field according to any special discounts that you have set up.';

                    trigger OnAction()
                    begin
                        PickDiscount();
                    end;
                }
                action("E&xplode BOM")
                {
                    AccessByPermission = TableData "BOM Component" = R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='E&xplode BOM',KOR='BOM확장';
                    Image = ExplodeBOM;
                    Enabled = Type = Type::Item;
                    ToolTip = 'Add a line for each component on the bill of materials for the selected item. For example, this is useful for selling the parent item as a kit. CAUTION: The line for the parent item will be deleted and only its description will display. To undo this action, delete the component lines and add a line for the parent item again. This action is available only for lines that contain an item.';

                    trigger OnAction()
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert &Ext. Texts")
                {
                    AccessByPermission = TableData "Extended Text Header" = R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Insert &Ext. Texts',KOR='확장테스트 넣기';
                    Image = Text;
                    ToolTip = 'Insert the extended item description that is set up for the item that is being processed on the line.';

                    trigger OnAction()
                    begin
                        InsertExtendedText(true);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        GetTotalSalesHeader;
        CalculateTotals;
        UpdateEditableOnRow();
    end;

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        Clear(DocumentTotals);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        DocumentTotals.SalesDocTotalsNotUpToDate();
        //라인삭제 불가처리.
        if (Rec."Qty. Invoiced (Base)" <> 0) OR (Rec."Qty. Shipped (Base)" <> 0) then
            Error('이미 처리된 송장이나 출고서가 있는 경우, 라인을 삭제하실 수 없습니다.'); 
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        DocumentTotals.SalesCheckAndClearTotals(Rec, xRec, TotalSalesLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
        exit(Find(Which));
    end;

    trigger OnInit()
    begin
        SalesReceivablesSetup.Get();
        Currency.InitRoundingPrecision;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        DocumentTotals.SalesCheckIfDocumentChanged(Rec, xRec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        InitType;
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    var
        PriceCalculationMgt: Codeunit "Price Calculation Mgt.";
    begin
        SetDimensionsVisibility();
        SetItemReferenceVisibility();
        ExtendedPriceEnabled := PriceCalculationMgt.IsExtendedPriceCalculationEnabled();
    end;

    var
        CurrentSalesLine: Record "Sales Line";
        SalesLine: Record "Sales Line";
        TotalSalesHeader: Record "Sales Header";
        TotalSalesLine: Record "Sales Line";
        Currency: Record Currency;
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
        DocumentTotals: Codeunit "Document Totals";
        VATAmount: Decimal;
        InvoiceDiscountAmount: Decimal;
        InvoiceDiscountPct: Decimal;
        AmountWithDiscountAllowed: Decimal;
        UpdateInvDiscountQst: Label '하나 이상의 라인이 송장처리되었습니다. 송장 처리된 라인에 이미 분배된 할인은 고려되지 않습니다.\\송장 할인을 업데이트하시겠습니까?';
        ExtendedPriceEnabled: Boolean;

    protected var
        ShortcutDimCode: array[8] of Code[20];
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;
        IsBlankNumber: Boolean;
        IsCommentLine: Boolean;
        [InDataSet]
        ItemReferenceVisible: Boolean;
        InvDiscAmountEditable: Boolean;

    procedure ApproveCalcInvDisc()
    begin
        CODEUNIT.Run(CODEUNIT::"Sales-Disc. (Yes/No)", Rec);
        DocumentTotals.SalesDocTotalsNotUpToDate();
    end;

    local procedure ValidateInvoiceDiscountAmount()
    var
        SalesHeader: Record "Sales Header";
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        SalesHeader.Get("Document Type", "Document No.");
        if SalesHeader.InvoicedLineExists then
            if not ConfirmManagement.GetResponseOrDefault(UpdateInvDiscountQst, true) then
                exit;

        SalesCalcDiscountByType.ApplyInvDiscBasedOnAmt(InvoiceDiscountAmount, SalesHeader);
        DocumentTotals.SalesDocTotalsNotUpToDate();
        CurrPage.Update(false);
    end;

    local procedure ExplodeBOM()
    begin
        CODEUNIT.Run(CODEUNIT::"Sales-Explode BOM", Rec);
        DocumentTotals.SalesDocTotalsNotUpToDate();
    end;

    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
        OnBeforeInsertExtendedText(Rec);
        if TransferExtendedText.SalesCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord;
            Commit();
            TransferExtendedText.InsertSalesExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate then
            UpdateForm(true);
    end;

    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.Update(SetSaveRecord);
    end;

    local procedure GetTotalSalesHeader()
    begin
        DocumentTotals.GetTotalSalesHeaderAndCurrency(Rec, TotalSalesHeader, Currency);
    end;

    local procedure CalculateTotals()
    begin
        DocumentTotals.SalesCheckIfDocumentChanged(Rec, xRec);
        DocumentTotals.CalculateSalesSubPageTotals(TotalSalesHeader, TotalSalesLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
        DocumentTotals.RefreshSalesLine(Rec);
    end;

    procedure CallDeltaUpdateTotals()
    begin
        DeltaUpdateTotals();
    end;

    local procedure DeltaUpdateTotals()
    begin
        DocumentTotals.SalesDeltaUpdateTotals(Rec, xRec, TotalSalesLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
        if "Line Amount" <> xRec."Line Amount" then
            SendLineInvoiceDiscountResetNotification();
    end;

    procedure UpdateEditableOnRow()
    begin
        IsCommentLine := not HasTypeToFillMandatoryFields;
        IsBlankNumber := IsCommentLine;

        InvDiscAmountEditable := CurrPage.Editable and not SalesReceivablesSetup."Calc. Inv. Discount";

        OnAfterUpdateEditableOnRow(Rec, IsCommentLine, IsBlankNumber);
    end;

    local procedure ShowOrders()
    begin
        CurrentSalesLine := Rec;
        SalesLine.Reset();
        SalesLine.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        SalesLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Sales Lines", SalesLine);
    end;

    local procedure ShowInvoices()
    begin
        CurrentSalesLine := Rec;
        SalesLine.Reset();
        SalesLine.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Invoice);
        SalesLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        SalesLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Sales Lines", SalesLine);
    end;

    local procedure ShowReturnOrders()
    begin
        CurrentSalesLine := Rec;
        SalesLine.Reset();
        SalesLine.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Return Order");
        SalesLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        SalesLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Sales Lines", SalesLine);
    end;

    local procedure ShowCreditMemos()
    begin
        CurrentSalesLine := Rec;
        SalesLine.Reset();
        SalesLine.SetCurrentKey("Document Type", "Blanket Order No.", "Blanket Order Line No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Credit Memo");
        SalesLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        SalesLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Sales Lines", SalesLine);
    end;

    local procedure ShowPostedOrders()
    var
        SaleShptLine: Record "Sales Shipment Line";
    begin
        CurrentSalesLine := Rec;
        SaleShptLine.Reset();
        SaleShptLine.SetCurrentKey("Blanket Order No.", "Blanket Order Line No.");
        SaleShptLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        SaleShptLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Posted Sales Shipment Lines", SaleShptLine);
    end;

    local procedure ShowPostedInvoices()
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        CurrentSalesLine := Rec;
        SalesInvLine.Reset();
        SalesInvLine.SetCurrentKey("Blanket Order No.", "Blanket Order Line No.");
        SalesInvLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        SalesInvLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Posted Sales Invoice Lines", SalesInvLine);
    end;

    local procedure ShowPostedReturnReceipts()
    var
        ReturnRcptLine: Record "Return Receipt Line";
    begin
        CurrentSalesLine := Rec;
        ReturnRcptLine.Reset();
        ReturnRcptLine.SetCurrentKey("Blanket Order No.", "Blanket Order Line No.");
        ReturnRcptLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        ReturnRcptLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Posted Return Receipt Lines", ReturnRcptLine);
    end;

    local procedure ShowPostedCreditMemos()
    var
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
    begin
        CurrentSalesLine := Rec;
        SalesCrMemoLine.Reset();
        SalesCrMemoLine.SetCurrentKey("Blanket Order No.", "Blanket Order Line No.");
        SalesCrMemoLine.SetRange("Blanket Order No.", CurrentSalesLine."Document No.");
        SalesCrMemoLine.SetRange("Blanket Order Line No.", CurrentSalesLine."Line No.");
        PAGE.RunModal(PAGE::"Posted Sales Credit Memo Lines", SalesCrMemoLine);
    end;

    procedure NoOnAfterValidate()
    begin
        InsertExtendedText(false);

        SaveAndAutoAsmToOrder();

        OnAfterNoOnAfterValidate(Rec, xRec);
    end;

    protected procedure LocationCodeOnAfterValidate()
    begin
        SaveAndAutoAsmToOrder();
    end;

    protected procedure VariantCodeOnAfterValidate()
    begin
        SaveAndAutoAsmToOrder();
    end;

    protected procedure QuantityOnAfterValidate()
    begin
        if Reserve = Reserve::Always then begin
            CurrPage.SaveRecord;
            AutoReserve();
        end;

        if (Type = Type::Item) and
           (Quantity <> xRec.Quantity)
        then
            CurrPage.Update(true);
    end;

    protected procedure UnitofMeasureCodeOnAfterValidate()
    begin
        if Reserve = Reserve::Always then begin
            CurrPage.SaveRecord;
            AutoReserve();
        end;
    end;

    protected procedure SaveAndAutoAsmToOrder()
    begin
        if (Type = Type::Item) and IsAsmToOrderRequired then begin
            CurrPage.SaveRecord;
            AutoAsmToOrder;
            CurrPage.Update(false);
        end;
    end;

    procedure ShowDocumentLineTracking()
    var
        DocumentLineTracking: Page "Document Line Tracking";
    begin
        Clear(DocumentLineTracking);
        DocumentLineTracking.SetDoc(2, "Document No.", "Line No.", "Blanket Order No.", "Blanket Order Line No.", '', 0);
        DocumentLineTracking.RunModal;
    end;

    procedure RedistributeTotalsOnAfterValidate()
    begin
        CurrPage.SaveRecord;

        DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec, VATAmount, TotalSalesLine);
        CurrPage.Update(false);
    end;

    local procedure SetDimensionsVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;

        DimMgt.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimMgt);
    end;

    local procedure SetItemReferenceVisibility()
    var
        ItemReferenceMgt: Codeunit "Item Reference Management";
    begin
        ItemReferenceVisible := ItemReferenceMgt.IsEnabled();
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
        AssembleToOrderLink: Record "Assemble-to-Order Link";
    begin
        ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
        AssembleToOrderLink.UpdateAsmDimFromSalesLine(Rec);

        OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, DimIndex);
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterNoOnAfterValidate(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateEditableOnRow(SalesLine: Record "Sales Line"; var IsCommentLine: Boolean; var IsBlankNumber: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateShortcutDimCode(var SalesLine: Record "Sales Line"; var ShortcutDimCode: array[8] of Code[20]; DimIndex: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertExtendedText(var SalesLine: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCrossReferenceNoOnLookup(var SalesLine: Record "Sales Line")
    begin
    end;




}
