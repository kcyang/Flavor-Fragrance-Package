/// <summary>
/// Blanket Order 를 복제하여, 샘플요청서를 생성하였습니다.
/// </summary>
page 55000 "Sales Sample Request"
{

    CaptionML = ENU = 'Sales Sample Request', KOR = '샘플 요청';
    PageType = Document;
    PromotedActionCategoriesML = ENU = 'New,Process,Report,Approve,Request Approval,Print/Send,Release,Order', KOR = '신규,프로세스,보고서,승인,승인요청,인쇄/전송,확정,주문';
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER("Sample Request"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Suite;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = DocNoVisible;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Customer No.', KOR = '매출처 번호';
                    Importance = Additional;
                    NotBlank = true;
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';

                    trigger OnValidate()
                    begin
                        SelltoCustomerNoOnAfterValidate(Rec, xRec);
                        CurrPage.Update;
                    end;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Customer Name', KOR = '매출처 이름';
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default.';

                    trigger OnValidate()
                    begin
                        SelltoCustomerNoOnAfterValidate(Rec, xRec);

                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        if LookupSellToCustomerName() then
                            CurrPage.Update();
                    end;
                }
                group("Sell-to")
                {
                    CaptionML = ENU = 'Sell-to', KOR = '판매처';
                    field("Sell-to Address"; "Sell-to Address")
                    {
                        ApplicationArea = Suite;
                        //Caption = 'Address';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the customer''s address.';
                    }
                    field("Sell-to Address 2"; "Sell-to Address 2")
                    {
                        ApplicationArea = Suite;
                        //Caption = 'Address 2';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies an additional part of the customer''s address.';
                    }
                    field("Sell-to Post Code"; "Sell-to Post Code")
                    {
                        ApplicationArea = Suite;
                        //Caption = 'Post Code';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the postal code of the customer''s address.';
                    }
                    field("Sell-to City"; "Sell-to City")
                    {
                        ApplicationArea = Suite;
                        //Caption = 'City';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the city of the customer''s address.';
                    }
                    field("Sell-to Contact No."; "Sell-to Contact No.")
                    {
                        ApplicationArea = Suite;
                        //Caption = 'Contact No.';
                        Importance = Additional;
                        ToolTip = 'Specifies the number of the contact person at the customer.';

                        trigger OnValidate()
                        begin
                            if GetFilter("Sell-to Contact No.") = xRec."Sell-to Contact No." then
                                if "Sell-to Contact No." <> xRec."Sell-to Contact No." then
                                    SetRange("Sell-to Contact No.");
                        end;
                    }
                    field(SellToPhoneNo; SellToContact."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Phone No.', KOR = '판매처 전화번호';
                        Importance = Additional;
                        Editable = false;
                        ExtendedDatatype = PhoneNo;
                        ToolTip = 'Specifies the telephone number of the contact person that the sales document will be sent to.';
                    }
                    field(SellToMobilePhoneNo; SellToContact."Mobile Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Mobile Phone No.', KOR = '판매처 담당휴대전화';
                        Importance = Additional;
                        Editable = false;
                        ExtendedDatatype = PhoneNo;
                        ToolTip = 'Specifies the mobile telephone number of the contact person that the sales document will be sent to.';
                    }
                    field(SellToEmail; SellToContact."E-Mail")
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Email', KOR = '이메일';
                        Importance = Additional;
                        Editable = false;
                        ExtendedDatatype = EMail;
                        ToolTip = 'Specifies the email address of the contact person that the sales document will be sent to.';
                    }
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    ApplicationArea = Suite;
                    //Caption = 'Contact';
                    Editable = "Sell-to Customer No." <> '';
                    ToolTip = 'Specifies the name of the contact person at the customer.';
                }
                field("No. of Archived Versions"; "No. of Archived Versions")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of archived versions for this document.';
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies when the related sales invoice must be paid.';
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("External Document No."; "External Document No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Your Reference"; "Your Reference")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s reference. The content will be printed on sales documents.';
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';

                    trigger OnValidate()
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Campaign No."; "Campaign No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the campaign that the document is linked to.';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field(Status; Status)
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    StyleExpr = StatusStyleTxt;
                    ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
                }
            }

            part(SalesLines; "Sales Sample Request Subform")
            {
                ApplicationArea = Suite;
                Editable = "Sell-to Customer No." <> '';
                Enabled = "Sell-to Customer No." <> '';
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }
            group("Invoice Details")
            {
                CaptionML = ENU = 'Invoice Details', KOR = '송장 내용';
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency that is used on the entry.';

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = ACTION::OK then begin
                            Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            SaveInvoiceDiscountAmount;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                        SalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
                    end;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Prices Including VAT"; "Prices Including VAT")
                {
                    ApplicationArea = VAT;
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';

                    trigger OnValidate()
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field("Transaction Type"; "Transaction Type")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.';
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';

                    trigger OnValidate()
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                }
                field("Tax Liable"; "Tax Liable")
                {
                    ApplicationArea = SalesTax;
                    ToolTip = 'Specifies if this vendor charges you sales tax for purchases.';
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    ApplicationArea = SalesTax;
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';

                    trigger OnValidate()
                    begin
                        CurrPage.SalesLines.PAGE.RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
            }
            group("Shipping and Billing")
            {
                CaptionML = ENU = 'Shipping and Billing', KOR = '배송 및 청구';
                Enabled = "Sell-to Customer No." <> '';
                group(Control25)
                {
                    ShowCaption = false;
                    group(Control21)
                    {
                        ShowCaption = false;
                        field(ShippingOptions; ShipToOptions)
                        {
                            ApplicationArea = Basic, Suite;
                            CaptionML = ENU = 'Ship-to', KOR = '출고지';
                            OptionCaption = 'Default (Sell-to Address),Alternate Shipping Address,Custom Address';
                            ToolTip = 'Specifies the address that the products on the sales document are shipped to. Default (Sell-to Address): The same as the customer''s sell-to address. Alternate Ship-to Address: One of the customer''s alternate ship-to addresses. Custom Address: Any ship-to address that you specify in the fields below.';

                            trigger OnValidate()
                            var
                                ShipToAddress: Record "Ship-to Address";
                                ShipToAddressList: Page "Ship-to Address List";
                            begin
                                OnBeforeValidateShipToOptions(Rec, ShipToOptions);

                                case ShipToOptions of
                                    ShipToOptions::"Default (Sell-to Address)":
                                        begin
                                            Validate("Ship-to Code", '');
                                            CopySellToAddressToShipToAddress;
                                        end;
                                    ShipToOptions::"Alternate Shipping Address":
                                        begin
                                            ShipToAddress.SetRange("Customer No.", "Sell-to Customer No.");
                                            ShipToAddressList.LookupMode := true;
                                            ShipToAddressList.SetTableView(ShipToAddress);

                                            if ShipToAddressList.RunModal = ACTION::LookupOK then begin
                                                ShipToAddressList.GetRecord(ShipToAddress);
                                                Validate("Ship-to Code", ShipToAddress.Code);
                                            end else
                                                ShipToOptions := ShipToOptions::"Custom Address";
                                        end;
                                    ShipToOptions::"Custom Address":
                                        Validate("Ship-to Code", '');
                                end;

                                OnAfterValidateShipToOptions(Rec, ShipToOptions);
                            end;
                        }
                        group(Control4)
                        {
                            ShowCaption = false;
                            Visible = NOT (ShipToOptions = ShipToOptions::"Default (Sell-to Address)");
                            field("Ship-to Code"; "Ship-to Code")
                            {
                                ApplicationArea = Suite;
                                CaptionML = ENU = 'Code', KOR = '출고지 코드';
                                Editable = ShipToOptions = ShipToOptions::"Alternate Shipping Address";
                                Importance = Promoted;
                                ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default.';

                                trigger OnValidate()
                                begin
                                    if (xRec."Ship-to Code" <> '') and ("Ship-to Code" = '') then
                                        Error(EmptyShipToCodeErr);
                                end;
                            }
                            field("Ship-to Name"; "Ship-to Name")
                            {
                                ApplicationArea = Suite;
                                CaptionML = ENU = 'Name', KOR = '출고지이름';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                ToolTip = 'Specifies the name that products on the sales document will be shipped to.';
                            }
                            field("Ship-to Address"; "Ship-to Address")
                            {
                                ApplicationArea = Suite;
                                CaptionML = ENU = 'Address', KOR = '출고지주소';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                QuickEntry = false;
                                ToolTip = 'Specifies the address that products on the sales document will be shipped to. By default, the field is filled with the value in the Address field on the customer card or with the value in the Address field in the Ship-to Address window.';
                            }
                            field("Ship-to Address 2"; "Ship-to Address 2")
                            {
                                ApplicationArea = Suite;
                                CaptionML = ENU = 'Address 2', KOR = '출고지주소2';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                QuickEntry = false;
                                ToolTip = 'Specifies an additional part of the shipping address.';
                            }
                            field("Ship-to Post Code"; "Ship-to Post Code")
                            {
                                ApplicationArea = Suite;
                                CaptionML = ENU = 'Post Code', KOR = '출고지우편번호';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                QuickEntry = false;
                                ToolTip = 'Specifies the postal code of the shipping address.';
                            }
                            field("Ship-to City"; "Ship-to City")
                            {
                                ApplicationArea = Suite;
                                //Caption = 'City';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                QuickEntry = false;
                                ToolTip = 'Specifies the city of the shipping address.';
                            }
                            field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                            {
                                ApplicationArea = Suite;
                                //Caption = 'Country/Region';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                QuickEntry = false;
                                ToolTip = 'Specifies the country/region of the shipping address.';
                            }
                        }
                        field("Ship-to Contact"; "Ship-to Contact")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Contact', KOR = '출고지 담당';
                            ToolTip = 'Specifies the name of the contact person at the address that products on the sales document will be shipped to.';
                        }
                    }
                    group("Shipment Method")
                    {
                        CaptionML = ENU = 'Shipment Method', KOR = '출고 정보';
                        field("Shipment Method Code"; "Shipment Method Code")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Code', KOR = '출고방법코드';
                            Importance = Additional;
                            ToolTip = 'Specifies how items on the sales document are shipped to the customer.';
                        }
                        field("Shipping Agent Code"; "Shipping Agent Code")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Agent', KOR = '출고에이전트';
                            Importance = Additional;
                            ToolTip = 'Specifies which shipping agent is used to transport the items on the sales document to the customer.';
                        }
                        field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Agent service', KOR = '에이전트 서비스';
                            Importance = Additional;
                            ToolTip = 'Specifies which shipping agent service is used to transport the items on the sales document to the customer.';
                        }
                        field("Package Tracking No."; "Package Tracking No.")
                        {
                            ApplicationArea = Suite;
                            Importance = Additional;
                            ToolTip = 'Specifies the shipping agent''s package number.';
                        }
                    }
                }
                group(Control41)
                {
                    ShowCaption = false;
                    field(BillToOptions; BillToOptions)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU = 'Bill-to', KOR = '청구처';
                        OptionCaption = 'Default (Customer),Another Customer,Custom Address';
                        ToolTip = 'Specifies the customer that the sales invoice will be sent to. Default (Customer): The same as the customer on the sales invoice. Another Customer: Any customer that you specify in the fields below.';

                        trigger OnValidate()
                        begin
                            if BillToOptions = BillToOptions::"Default (Customer)" then begin
                                Validate("Bill-to Customer No.", "Sell-to Customer No.");
                                RecallModifyAddressNotification(GetModifyBillToCustomerAddressNotificationId);
                            end;

                            CopySellToAddressToBillToAddress;
                        end;
                    }
                    group(Control43)
                    {
                        ShowCaption = false;
                        Visible = NOT (BillToOptions = BillToOptions::"Default (Customer)");
                        field("Bill-to Name"; "Bill-to Name")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Name', KOR = '청구처 이름';
                            Editable = BillToOptions = BillToOptions::"Another Customer";
                            Enabled = BillToOptions = BillToOptions::"Another Customer";
                            Importance = Promoted;
                            ToolTip = 'Specifies the customer to whom you will send the invoice, when different from the customer that you are selling to.';

                            trigger OnValidate()
                            var
                                ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
                            begin
                                if GetFilter("Bill-to Customer No.") = xRec."Bill-to Customer No." then
                                    if "Bill-to Customer No." <> xRec."Bill-to Customer No." then
                                        SetRange("Bill-to Customer No.");

                                CurrPage.SaveRecord;
                                if ApplicationAreaMgmtFacade.IsFoundationEnabled then
                                    SalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);

                                CurrPage.Update(false);
                            end;
                        }
                        field("Bill-to Address"; "Bill-to Address")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Address', KOR = '청구지 주소';
                            Editable = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Enabled = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Importance = Additional;
                            QuickEntry = false;
                            ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
                        }
                        field("Bill-to Address 2"; "Bill-to Address 2")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Address 2', KOR = '청구지 주소2';
                            Editable = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Enabled = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Importance = Additional;
                            QuickEntry = false;
                            ToolTip = 'Specifies an additional part of the billing address.';
                        }
                        field("Bill-to Post Code"; "Bill-to Post Code")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Post Code', KOR = '청구지우편ㅂ너호';
                            Editable = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Enabled = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Importance = Additional;
                            QuickEntry = false;
                            ToolTip = 'Specifies the postal code of the billing address.';
                        }
                        field("Bill-to City"; "Bill-to City")
                        {
                            ApplicationArea = Suite;
                            //Caption = 'City';
                            Editable = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Enabled = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Importance = Additional;
                            QuickEntry = false;
                            ToolTip = 'Specifies the city of the billing address.';
                        }
                        field("Bill-to Contact No."; "Bill-to Contact No.")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Contact No.', KOR = '청구지 연락처 코드번호';
                            Editable = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Enabled = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Importance = Additional;
                            ToolTip = 'Specifies the number of the contact person at the billing address.';
                        }
                        field("Bill-to Contact"; "Bill-to Contact")
                        {
                            ApplicationArea = Suite;
                            CaptionML = ENU = 'Contact', KOR = '청구지 담당연락';
                            Editable = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            Enabled = (BillToOptions = BillToOptions::"Custom Address") OR ("Bill-to Customer No." <> "Sell-to Customer No.");
                            ToolTip = 'Specifies the name of the contact person at the billing address';
                        }
                        field(BillToContactPhoneNo; BillToContact."Phone No.")
                        {
                            ApplicationArea = Basic, Suite;
                            CaptionML = ENU = 'Phone No.', KOR = '청구처 담당전화';
                            Editable = false;
                            Importance = Additional;
                            ExtendedDatatype = PhoneNo;
                            ToolTip = 'Specifies the telephone number of the person you should contact at the customer you are sending the invoice to.';
                        }
                        field(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
                        {
                            ApplicationArea = Basic, Suite;
                            CaptionML = ENU = 'Mobile Phone No.', KOR = '청구처 담당휴대전화';
                            Editable = false;
                            Importance = Additional;
                            ExtendedDatatype = PhoneNo;
                            ToolTip = 'Specifies the mobile telephone number of the person you should contact at the customer you are sending the invoice to.';
                        }
                        field(BillToContactEmail; BillToContact."E-Mail")
                        {
                            ApplicationArea = Basic, Suite;
                            CaptionML = ENU = 'Email', KOR = '청구처 이메일';
                            Editable = false;
                            Importance = Additional;
                            ExtendedDatatype = EMail;
                            ToolTip = 'Specifies the email address of the person you should contact at the customer you are sending the invoice to.';
                        }
                    }
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU = 'Foreign Trade', KOR = '해외 거래';
                Visible = false;
                field("EU 3-Party Trade"; "EU 3-Party Trade")
                {
                    ApplicationArea = BasicEU;
                    ToolTip = 'Specifies if the transaction is related to trade with a third party within the EU.';
                }
                field("Transaction Specification"; "Transaction Specification")
                {
                    ApplicationArea = BasicEU;
                    ToolTip = 'Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.';
                }
                field("Transport Method"; "Transport Method")
                {
                    ApplicationArea = BasicEU;
                    ToolTip = 'Specifies the transport method, for the purpose of reporting to INTRASTAT.';
                }
                field("Exit Point"; "Exit Point")
                {
                    ApplicationArea = BasicEU;
                    ToolTip = 'Specifies the point of exit through which you ship the items out of your country/region, for reporting to Intrastat.';
                }
                field("Area"; Area)
                {
                    ApplicationArea = BasicEU;
                    ToolTip = 'Specifies the area of the customer or vendor, for the purpose of reporting to INTRASTAT.';
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Attachments', KOR = '첨부';
                SubPageLink = "Table ID" = CONST(36),
                              "No." = FIELD("No."),
                              "Document Type" = FIELD("Document Type");
            }
            part(Control13; "Pending Approval FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "Table ID" = CONST(36),
                              "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("No.");
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = FIELD("Sell-to Customer No.");
            }
            part(Control1906127307; "Sales Line FactBox")
            {
                ApplicationArea = Suite;
                Provider = SalesLines;
                SubPageLink = "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("Document No."),
                              "Line No." = FIELD("Line No.");
                Visible = false;
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part(Control1907012907; "Resource Details FactBox")
            {
                ApplicationArea = Suite;
                Provider = SalesLines;
                SubPageLink = "No." = FIELD("No.");
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
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
                action(Statistics)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Statistics', KOR = '상태';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                    trigger OnAction()
                    var
                        Handled: Boolean;
                    begin
                        OnBeforeStatisticsAction(Rec, Handled);
                        if not Handled then begin
                            OpenSalesOrderStatistics;
                            SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                        end
                    end;
                }
                action(Card)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Card', KOR = '카드';
                    Image = EditLines;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Customer Card";
                    RunPageLink = "No." = FIELD("Sell-to Customer No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View or edit detailed information about the customer on the sales document.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Co&mments', KOR = '주석';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = CONST("Sample Request"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    CaptionML = ENU = 'Dimensions', KOR = '관리항목';
                    Enabled = "No." <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDocDim;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Approvals', KOR = '승인';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RecordId, DATABASE::"Sales Header", "Document Type".AsInteger(), "No.");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Attachments', KOR = '첨부';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
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
            }
        }
        area(processing)
        {
            group(Approval)
            {
                CaptionML = ENU = 'Approval', KOR = '승인';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Approve', KOR = '승인';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Reject', KOR = '반려';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Delegate', KOR = '위임';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Comments', KOR = '주석';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU = 'F&unctions', KOR = '기능';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = TableData "Cust. Invoice Disc." = R;
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Calculate &Invoice Discount', KOR = '송장할인 계산';
                    Image = CalculateInvoiceDiscount;
                    ToolTip = 'Calculate the invoice discount that applies to the sales order.';

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                        SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator(Action134)
                {
                }
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Copy Document', KOR = '문서 복사';
                    Ellipsis = true;
                    Enabled = "No." <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another sales document to this document. You can copy a posted sales invoice into a new sales invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        CopyDocument();
                    end;
                }
                action("Archi&ve Document")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Archi&ve Document', KOR = '문서 보관';
                    Image = Archive;
                    ToolTip = 'Archive document.';

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchiveSalesDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                separator(Action138)
                {
                }
                action(Release)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Re&lease', KOR = '확정';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
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
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Re&open', KOR = '다시열기';
                    Enabled = Status <> Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
            }

            action(MakeOrder)
            {
                ApplicationArea = Suite;
                CaptionML = ENU = 'Make &Order', KOR = '샘플주문서 생성';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTipML = ENU = 'Convert the Sample Sales Request to a sample sales order.', KOR = '샘플요청서에서 샘플주문서를 생성합니다.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    FFPackage: Codeunit "FF Package Functions";
                begin
                    //Approval Check.
                    if ApprovalsMgmt.PrePostApprovalCheckSales(Rec) then
                        FFPackage.makeSampletoOrder(Rec); //Make an Order.
                end;
            }
            action(SampleRequestPrint)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Sample Request', KOR = '샘플요청서';
                Ellipsis = true;
                Image = PrintDocument;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = '샘플요청서를 인쇄합니다.';

                trigger OnAction()
                var 
                    SampleRequest: Report "Sample Request";
                    SH: Record "Sales Header";
                begin
                    SH.Reset();
                    SH.SetRange("Document Type",SH."Document Type"::"Sample Request");
                    SH.SetRange("No.",Rec."No.");
                    SampleRequest.SetTableView(SH);
                    SampleRequest.Run();
                end;
            }

            action(Print)
            {
                ApplicationArea = Suite;
                CaptionML = ENU = '&Print', KOR = '인쇄';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    DocPrint.PrintSalesHeader(Rec);
                end;
            }
            action(AttachAsPDF)
            {
                ApplicationArea = Basic, Suite;
                CaptionML = ENU = 'Attach as PDF', KOR = 'PDF로 첨부';
                Image = PrintAttachment;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Create a PDF file and attach it to the document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader := Rec;
                    SalesHeader.SetRecFilter();
                    DocPrint.PrintSalesHeaderToDocumentAttachment(SalesHeader);
                end;
            }
            group("Request Approval")
            {
                CaptionML = ENU = 'Request Approval', KOR = '승인 요청';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Send A&pproval Request', KOR = '승인요청 전송';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
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
                    ApplicationArea = Suite;
                    CaptionML = ENU = 'Cancel Approval Re&quest', KOR = '승인요청 취소';
                    Enabled = CanCancelApprovalForRecord;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RecordId);
        CurrPage.ApprovalFactBox.PAGE.UpdateApprovalEntriesFromSourceRecord(RecordId);
        StatusStyleTxt := GetStatusStyleText();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        UpdateShipToBillToGroupVisibility();
        if SellToContact.Get("Sell-to Contact No.") then;
        if BillToContact.Get("Bill-to Contact No.") then;
    end;

    trigger OnDeleteRecord(): Boolean
    var
        SalesLine: Record "Sales Line";
    begin
        CurrPage.SaveRecord;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", "Document Type"::"Sample Request");
        SalesLine.SetRange("Document No.", Rec."No.");
        if SalesLine.FindSet() then begin
            repeat
                if (SalesLine."Qty. Invoiced (Base)" <> 0) OR (SalesLine."Qty. Shipped (Base)" <> 0) then
                    Error('라인에, 이미 처리된 출고,송장이 있는 경우 샘플요청서를 삭제하실 수 없습니다.');
            until SalesLine.Next() = 0;
        end;
        exit(ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if DocNoVisible then
            CheckCreditMaxBeforeInsert;

        if ("Sell-to Customer No." = '') and (GetFilter("Sell-to Customer No.") <> '') then
            CurrPage.Update(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        xRec.Init();
        "Responsibility Center" := UserMgt.GetSalesFilter;
        isRelatedSample := true;
        if (not DocNoVisible) and ("No." = '') then
            SetSellToCustomerFromFilter;
        UpdateShipToBillToGroupVisibility;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetSalesFilter <> '' then begin
            FilterGroup(2);
            SetRange("Responsibility Center", UserMgt.GetSalesFilter);
            FilterGroup(0);
        end;

        SetDocNoVisible;
    end;

    var
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesCalcDiscByType: Codeunit "Sales - Calc Discount By Type";
        CustomerMgt: Codeunit "Customer Mgt.";
        ChangeExchangeRate: Page "Change Exchange Rate";
        DocNoVisible: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        [InDataSet]
        StatusStyleTxt: Text;
        EmptyShipToCodeErr: Label 'The Code field can only be empty if you select Custom Address in the Ship-to field.';

    protected var
        ShipToOptions: Option "Default (Sell-to Address)","Alternate Shipping Address","Custom Address";
        BillToOptions: Option "Default (Customer)","Another Customer","Custom Address";

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure SaveInvoiceDiscountAmount()
    var
        DocumentTotals: Codeunit "Document Totals";
    begin
        CurrPage.SaveRecord;
        DocumentTotals.SalesRedistributeInvoiceDiscountAmountsOnDocument(Rec);
        CurrPage.Update(false);
    end;

    local procedure SalespersonCodeOnAfterValidate()
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(true);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    /*
    // 기존 Order 에서 사용한 SetDocNoVisible 을 샘플용으로 사용하도록 따로 구성함.
    */
    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit "FF Package Functions";
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible("No.");
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
    end;

    local procedure UpdateShipToBillToGroupVisibility()
    begin
        CustomerMgt.CalculateShipToBillToOptions(ShipToOptions, BillToOptions, Rec);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeStatisticsAction(var SalesHeader: Record "Sales Header"; var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateShipToOptions(var SalesHeader: Record "Sales Header"; ShipToOptions: Option)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateShipToOptions(var SalesHeader: Record "Sales Header"; ShipToOptions: Option)
    begin
    end;




}
