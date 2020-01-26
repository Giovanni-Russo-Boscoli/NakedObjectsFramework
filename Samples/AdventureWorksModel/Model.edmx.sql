
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/25/2020 22:36:39
-- Generated from EDMX file: C:\Users\Giovanni\source\repos\NOF\NakedObjectsFramework\Samples\AdventureWorksModel\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AdventureWorks];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Address_StateProvince_StateProvinceID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK_Address_StateProvince_StateProvinceID];
GO
IF OBJECT_ID(N'[dbo].[FK_BillOfMaterials_Product_ComponentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_Product_ComponentID];
GO
IF OBJECT_ID(N'[dbo].[FK_BillOfMaterials_Product_ProductAssemblyID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID];
GO
IF OBJECT_ID(N'[dbo].[FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillOfMaterials] DROP CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_ContactCreditCard_Contact_ContactID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContactCreditCard] DROP CONSTRAINT [FK_ContactCreditCard_Contact_ContactID];
GO
IF OBJECT_ID(N'[dbo].[FK_ContactCreditCard_CreditCard_CreditCardID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContactCreditCard] DROP CONSTRAINT [FK_ContactCreditCard_CreditCard_CreditCardID];
GO
IF OBJECT_ID(N'[dbo].[FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CountryRegionCurrency] DROP CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode];
GO
IF OBJECT_ID(N'[dbo].[FK_CountryRegionCurrency_Currency_CurrencyCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CountryRegionCurrency] DROP CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode];
GO
IF OBJECT_ID(N'[dbo].[FK_CurrencyRate_Currency_FromCurrencyCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CurrencyRate] DROP CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode];
GO
IF OBJECT_ID(N'[dbo].[FK_CurrencyRate_Currency_ToCurrencyCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CurrencyRate] DROP CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode];
GO
IF OBJECT_ID(N'[dbo].[FK_Customer_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAddress_Address_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Address_AddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAddress_AddressType_AddressTypeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_AddressType_AddressTypeID];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAddress_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Customer_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_Employee_Contact_ContactID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Contact_ContactID];
GO
IF OBJECT_ID(N'[dbo].[FK_Employee_Employee_ManagerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Employee_ManagerID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeAddress_Address_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeAddress] DROP CONSTRAINT [FK_EmployeeAddress_Address_AddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeAddress_Employee_EmployeeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeAddress] DROP CONSTRAINT [FK_EmployeeAddress_Employee_EmployeeID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeDepartmentHistory_Department_DepartmentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeDepartmentHistory] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeDepartmentHistory_Employee_EmployeeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeDepartmentHistory] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_EmployeeID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeDepartmentHistory_Shift_ShiftID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeDepartmentHistory] DROP CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeePayHistory_Employee_EmployeeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeePayHistory] DROP CONSTRAINT [FK_EmployeePayHistory_Employee_EmployeeID];
GO
IF OBJECT_ID(N'[dbo].[FK_Individual_Contact_ContactID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Individual] DROP CONSTRAINT [FK_Individual_Contact_ContactID];
GO
IF OBJECT_ID(N'[dbo].[FK_Individual_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Individual] DROP CONSTRAINT [FK_Individual_Customer_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_JobCandidate_Employee_EmployeeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JobCandidate] DROP CONSTRAINT [FK_JobCandidate_Employee_EmployeeID];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_ProductSubcategory_ProductSubcategoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_UnitMeasure_SizeUnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_UnitMeasure_WeightUnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductCostHistory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCostHistory] DROP CONSTRAINT [FK_ProductCostHistory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductDocument_Document_DocumentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductDocument] DROP CONSTRAINT [FK_ProductDocument_Document_DocumentID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductDocument_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductDocument] DROP CONSTRAINT [FK_ProductDocument_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductInventory_Location_LocationID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductInventory] DROP CONSTRAINT [FK_ProductInventory_Location_LocationID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductInventory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductInventory] DROP CONSTRAINT [FK_ProductInventory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductListPriceHistory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductListPriceHistory] DROP CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelIllustration_Illustration_IllustrationID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelIllustration] DROP CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelIllustration_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelIllustration] DROP CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelProductDescriptionCulture_Culture_CultureID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductModelProductDescriptionCulture] DROP CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductProductPhoto_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductProductPhoto] DROP CONSTRAINT [FK_ProductProductPhoto_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductProductPhoto] DROP CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductReview_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductReview] DROP CONSTRAINT [FK_ProductReview_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductSubcategory_ProductCategory_ProductCategoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductSubcategory] DROP CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductVendor_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductVendor] DROP CONSTRAINT [FK_ProductVendor_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductVendor_UnitMeasure_UnitMeasureCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductVendor] DROP CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductVendor_Vendor_VendorID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductVendor] DROP CONSTRAINT [FK_ProductVendor_Vendor_VendorID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetail_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderDetail] DROP CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderDetail] DROP CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderHeader_Employee_EmployeeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderHeader] DROP CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderHeader] DROP CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseOrderHeader_Vendor_VendorID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseOrderHeader] DROP CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_Address_BillToAddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_Address_ShipToAddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_Contact_ContactID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Contact_ContactID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_CreditCard_CreditCardID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_SalesPerson_SalesPersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeader_ShipMethod_ShipMethodID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaderSalesReason] DROP CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesOrderHeaderSalesReason] DROP CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesPerson_Employee_SalesPersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesPerson] DROP CONSTRAINT [FK_SalesPerson_Employee_SalesPersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesPerson_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesPerson] DROP CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesPersonQuotaHistory_SalesPerson_SalesPersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesPersonQuotaHistory] DROP CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_SalesPersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesTaxRate_StateProvince_StateProvinceID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesTaxRate] DROP CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesTerritoryHistory_SalesPerson_SalesPersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesTerritoryHistory] DROP CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_SalesPersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SalesTerritoryHistory] DROP CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_ShoppingCartItem_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShoppingCartItem] DROP CONSTRAINT [FK_ShoppingCartItem_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_SpecialOfferProduct_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialOfferProduct] DROP CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialOfferProduct] DROP CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID];
GO
IF OBJECT_ID(N'[dbo].[FK_StateProvince_CountryRegion_CountryRegionCode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StateProvince] DROP CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode];
GO
IF OBJECT_ID(N'[dbo].[FK_StateProvince_SalesTerritory_TerritoryID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StateProvince] DROP CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID];
GO
IF OBJECT_ID(N'[dbo].[FK_Store_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Store] DROP CONSTRAINT [FK_Store_Customer_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_Store_SalesPerson_SalesPersonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Store] DROP CONSTRAINT [FK_Store_SalesPerson_SalesPersonID];
GO
IF OBJECT_ID(N'[dbo].[FK_StoreContact_Contact_ContactID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StoreContact] DROP CONSTRAINT [FK_StoreContact_Contact_ContactID];
GO
IF OBJECT_ID(N'[dbo].[FK_StoreContact_ContactType_ContactTypeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StoreContact] DROP CONSTRAINT [FK_StoreContact_ContactType_ContactTypeID];
GO
IF OBJECT_ID(N'[dbo].[FK_StoreContact_Store_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StoreContact] DROP CONSTRAINT [FK_StoreContact_Store_CustomerID];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionHistory_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransactionHistory] DROP CONSTRAINT [FK_TransactionHistory_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_VendorAddress_Address_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VendorAddress] DROP CONSTRAINT [FK_VendorAddress_Address_AddressID];
GO
IF OBJECT_ID(N'[dbo].[FK_VendorAddress_AddressType_AddressTypeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VendorAddress] DROP CONSTRAINT [FK_VendorAddress_AddressType_AddressTypeID];
GO
IF OBJECT_ID(N'[dbo].[FK_VendorAddress_Vendor_VendorID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VendorAddress] DROP CONSTRAINT [FK_VendorAddress_Vendor_VendorID];
GO
IF OBJECT_ID(N'[dbo].[FK_VendorContact_Contact_ContactID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VendorContact] DROP CONSTRAINT [FK_VendorContact_Contact_ContactID];
GO
IF OBJECT_ID(N'[dbo].[FK_VendorContact_ContactType_ContactTypeID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VendorContact] DROP CONSTRAINT [FK_VendorContact_ContactType_ContactTypeID];
GO
IF OBJECT_ID(N'[dbo].[FK_VendorContact_Vendor_VendorID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VendorContact] DROP CONSTRAINT [FK_VendorContact_Vendor_VendorID];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrder_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_Product_ProductID];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrder_ScrapReason_ScrapReasonID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrder] DROP CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrderRouting_Location_LocationID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrderRouting] DROP CONSTRAINT [FK_WorkOrderRouting_Location_LocationID];
GO
IF OBJECT_ID(N'[dbo].[FK_WorkOrderRouting_WorkOrder_WorkOrderID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkOrderRouting] DROP CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Department]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Department];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[EmployeeAddress]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeAddress];
GO
IF OBJECT_ID(N'[dbo].[EmployeeDepartmentHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeDepartmentHistory];
GO
IF OBJECT_ID(N'[dbo].[EmployeePayHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeePayHistory];
GO
IF OBJECT_ID(N'[dbo].[JobCandidate]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JobCandidate];
GO
IF OBJECT_ID(N'[dbo].[Shift]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Shift];
GO
IF OBJECT_ID(N'[dbo].[Address]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Address];
GO
IF OBJECT_ID(N'[dbo].[AddressType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AddressType];
GO
IF OBJECT_ID(N'[dbo].[Contact]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contact];
GO
IF OBJECT_ID(N'[dbo].[ContactType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContactType];
GO
IF OBJECT_ID(N'[dbo].[CountryRegion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CountryRegion];
GO
IF OBJECT_ID(N'[dbo].[StateProvince]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StateProvince];
GO
IF OBJECT_ID(N'[dbo].[BillOfMaterials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BillOfMaterials];
GO
IF OBJECT_ID(N'[dbo].[Culture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Culture];
GO
IF OBJECT_ID(N'[dbo].[Document]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Document];
GO
IF OBJECT_ID(N'[dbo].[Illustration]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Illustration];
GO
IF OBJECT_ID(N'[dbo].[Location]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Location];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[ProductCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCategory];
GO
IF OBJECT_ID(N'[dbo].[ProductCostHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCostHistory];
GO
IF OBJECT_ID(N'[dbo].[ProductDescription]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductDescription];
GO
IF OBJECT_ID(N'[dbo].[ProductDocument]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductDocument];
GO
IF OBJECT_ID(N'[dbo].[ProductInventory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductInventory];
GO
IF OBJECT_ID(N'[dbo].[ProductListPriceHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductListPriceHistory];
GO
IF OBJECT_ID(N'[dbo].[ProductModel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductModel];
GO
IF OBJECT_ID(N'[dbo].[ProductModelIllustration]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductModelIllustration];
GO
IF OBJECT_ID(N'[dbo].[ProductModelProductDescriptionCulture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductModelProductDescriptionCulture];
GO
IF OBJECT_ID(N'[dbo].[ProductPhoto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductPhoto];
GO
IF OBJECT_ID(N'[dbo].[ProductProductPhoto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductProductPhoto];
GO
IF OBJECT_ID(N'[dbo].[ProductReview]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductReview];
GO
IF OBJECT_ID(N'[dbo].[ProductSubcategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductSubcategory];
GO
IF OBJECT_ID(N'[dbo].[ScrapReason]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ScrapReason];
GO
IF OBJECT_ID(N'[dbo].[TransactionHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionHistory];
GO
IF OBJECT_ID(N'[dbo].[UnitMeasure]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UnitMeasure];
GO
IF OBJECT_ID(N'[dbo].[WorkOrder]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkOrder];
GO
IF OBJECT_ID(N'[dbo].[WorkOrderRouting]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkOrderRouting];
GO
IF OBJECT_ID(N'[dbo].[ProductVendor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductVendor];
GO
IF OBJECT_ID(N'[dbo].[PurchaseOrderDetail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseOrderDetail];
GO
IF OBJECT_ID(N'[dbo].[PurchaseOrderHeader]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseOrderHeader];
GO
IF OBJECT_ID(N'[dbo].[ShipMethod]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShipMethod];
GO
IF OBJECT_ID(N'[dbo].[Vendor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vendor];
GO
IF OBJECT_ID(N'[dbo].[VendorAddress]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VendorAddress];
GO
IF OBJECT_ID(N'[dbo].[VendorContact]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VendorContact];
GO
IF OBJECT_ID(N'[dbo].[ContactCreditCard]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContactCreditCard];
GO
IF OBJECT_ID(N'[dbo].[CountryRegionCurrency]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CountryRegionCurrency];
GO
IF OBJECT_ID(N'[dbo].[CreditCard]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CreditCard];
GO
IF OBJECT_ID(N'[dbo].[Currency]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Currency];
GO
IF OBJECT_ID(N'[dbo].[CurrencyRate]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CurrencyRate];
GO
IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customer];
GO
IF OBJECT_ID(N'[dbo].[CustomerAddress]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerAddress];
GO
IF OBJECT_ID(N'[dbo].[Individual]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Individual];
GO
IF OBJECT_ID(N'[dbo].[SalesOrderDetail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesOrderDetail];
GO
IF OBJECT_ID(N'[dbo].[SalesOrderHeader]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesOrderHeader];
GO
IF OBJECT_ID(N'[dbo].[SalesOrderHeaderSalesReason]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesOrderHeaderSalesReason];
GO
IF OBJECT_ID(N'[dbo].[SalesPerson]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesPerson];
GO
IF OBJECT_ID(N'[dbo].[SalesPersonQuotaHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesPersonQuotaHistory];
GO
IF OBJECT_ID(N'[dbo].[SalesReason]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesReason];
GO
IF OBJECT_ID(N'[dbo].[SalesTaxRate]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesTaxRate];
GO
IF OBJECT_ID(N'[dbo].[SalesTerritory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesTerritory];
GO
IF OBJECT_ID(N'[dbo].[SalesTerritoryHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SalesTerritoryHistory];
GO
IF OBJECT_ID(N'[dbo].[ShoppingCartItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShoppingCartItem];
GO
IF OBJECT_ID(N'[dbo].[SpecialOffer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialOffer];
GO
IF OBJECT_ID(N'[dbo].[SpecialOfferProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialOfferProduct];
GO
IF OBJECT_ID(N'[dbo].[Store]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Store];
GO
IF OBJECT_ID(N'[dbo].[StoreContact]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StoreContact];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Department'
CREATE TABLE [dbo].[Department] (
    [DepartmentID] smallint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [GroupName] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Employee'
CREATE TABLE [dbo].[Employee] (
    [EmployeeID] int IDENTITY(1,1) NOT NULL,
    [NationalIDNumber] nvarchar(15)  NOT NULL,
    [LoginID] nvarchar(256)  NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [MaritalStatus] nchar(1)  NOT NULL,
    [Gender] nchar(1)  NOT NULL,
    [HireDate] datetime  NOT NULL,
    [Salaried] bit  NOT NULL,
    [VacationHours] smallint  NOT NULL,
    [SickLeaveHours] smallint  NOT NULL,
    [Current] bit  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [ContactDetails_ContactID] int  NOT NULL,
    [Manager_EmployeeID] int  NULL
);
GO

-- Creating table 'EmployeeAddress'
CREATE TABLE [dbo].[EmployeeAddress] (
    [EmployeeID] int  NOT NULL,
    [AddressID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'EmployeeDepartmentHistory'
CREATE TABLE [dbo].[EmployeeDepartmentHistory] (
    [EmployeeID] int  NOT NULL,
    [DepartmentID] smallint  NOT NULL,
    [ShiftID] tinyint  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'EmployeePayHistory'
CREATE TABLE [dbo].[EmployeePayHistory] (
    [EmployeeID] int  NOT NULL,
    [RateChangeDate] datetime  NOT NULL,
    [Rate] decimal(19,4)  NOT NULL,
    [PayFrequency] tinyint  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'JobCandidate'
CREATE TABLE [dbo].[JobCandidate] (
    [JobCandidateID] int IDENTITY(1,1) NOT NULL,
    [Resume] nvarchar(max)  NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Employee_EmployeeID] int  NULL
);
GO

-- Creating table 'Shift'
CREATE TABLE [dbo].[Shift] (
    [ShiftID] tinyint  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Times_StartTime] datetime  NOT NULL,
    [Times_EndTime] datetime  NOT NULL
);
GO

-- Creating table 'Address'
CREATE TABLE [dbo].[Address] (
    [AddressID] int IDENTITY(1,1) NOT NULL,
    [AddressLine1] nvarchar(60)  NOT NULL,
    [AddressLine2] nvarchar(60)  NULL,
    [City] nvarchar(30)  NOT NULL,
    [PostalCode] nvarchar(15)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [StateProvince_StateProvinceID] int  NOT NULL
);
GO

-- Creating table 'AddressType'
CREATE TABLE [dbo].[AddressType] (
    [AddressTypeID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Contact'
CREATE TABLE [dbo].[Contact] (
    [ContactID] int IDENTITY(1,1) NOT NULL,
    [NameStyle] bit  NOT NULL,
    [Title] nvarchar(8)  NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [MiddleName] nvarchar(50)  NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Suffix] nvarchar(10)  NULL,
    [EmailAddress] nvarchar(50)  NULL,
    [EmailPromotion] int  NOT NULL,
    [Phone] nvarchar(25)  NULL,
    [PasswordHash] varchar(128)  NOT NULL,
    [PasswordSalt] varchar(10)  NOT NULL,
    [AdditionalContactInfo] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ContactType'
CREATE TABLE [dbo].[ContactType] (
    [ContactTypeID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CountryRegion'
CREATE TABLE [dbo].[CountryRegion] (
    [CountryRegionCode] nvarchar(3)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'StateProvince'
CREATE TABLE [dbo].[StateProvince] (
    [StateProvinceID] int IDENTITY(1,1) NOT NULL,
    [StateProvinceCode] nchar(3)  NOT NULL,
    [IsOnlyStateProvinceFlag] bit  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [CountryRegion_CountryRegionCode] nvarchar(3)  NOT NULL,
    [SalesTerritory_TerritoryID] int  NOT NULL
);
GO

-- Creating table 'BillOfMaterials'
CREATE TABLE [dbo].[BillOfMaterials] (
    [BillOfMaterialsID] int IDENTITY(1,1) NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [BOMLevel] smallint  NOT NULL,
    [PerAssemblyQty] decimal(8,2)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Product_ProductID] int  NOT NULL,
    [Product1_ProductID] int  NULL,
    [UnitMeasure_UnitMeasureCode] nchar(3)  NOT NULL
);
GO

-- Creating table 'Culture'
CREATE TABLE [dbo].[Culture] (
    [CultureID] nchar(6)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Document'
CREATE TABLE [dbo].[Document] (
    [DocumentID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [FileName] nvarchar(400)  NOT NULL,
    [FileExtension] nvarchar(8)  NOT NULL,
    [Revision] nchar(5)  NOT NULL,
    [ChangeNumber] int  NOT NULL,
    [Status] tinyint  NOT NULL,
    [DocumentSummary] nvarchar(max)  NULL,
    [Document1] varbinary(max)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Illustration'
CREATE TABLE [dbo].[Illustration] (
    [IllustrationID] int IDENTITY(1,1) NOT NULL,
    [Diagram] nvarchar(max)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Location'
CREATE TABLE [dbo].[Location] (
    [LocationID] smallint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CostRate] decimal(10,4)  NOT NULL,
    [Availability] decimal(8,2)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ProductNumber] nvarchar(25)  NOT NULL,
    [Make] bit  NOT NULL,
    [FinishedGoods] bit  NOT NULL,
    [Color] nvarchar(15)  NULL,
    [SafetyStockLevel] smallint  NOT NULL,
    [ReorderPoint] smallint  NOT NULL,
    [StandardCost] decimal(19,4)  NOT NULL,
    [ListPrice] decimal(19,4)  NOT NULL,
    [Size] nvarchar(5)  NULL,
    [Weight] decimal(8,2)  NULL,
    [DaysToManufacture] int  NOT NULL,
    [ProductLine] nchar(2)  NULL,
    [Class] nchar(2)  NULL,
    [Style] nchar(2)  NULL,
    [SellStartDate] datetime  NOT NULL,
    [SellEndDate] datetime  NULL,
    [DiscontinuedDate] datetime  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [ProductModel_ProductModelID] int  NULL,
    [ProductSubcategory_ProductSubcategoryID] int  NULL,
    [SizeUnit_UnitMeasureCode] nchar(3)  NULL,
    [WeightUnit_UnitMeasureCode] nchar(3)  NULL
);
GO

-- Creating table 'ProductCategory'
CREATE TABLE [dbo].[ProductCategory] (
    [ProductCategoryID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductCostHistory'
CREATE TABLE [dbo].[ProductCostHistory] (
    [ProductID] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [StandardCost] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductDescription'
CREATE TABLE [dbo].[ProductDescription] (
    [ProductDescriptionID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(400)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductDocument'
CREATE TABLE [dbo].[ProductDocument] (
    [ProductID] int  NOT NULL,
    [DocumentID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductInventory'
CREATE TABLE [dbo].[ProductInventory] (
    [ProductID] int  NOT NULL,
    [LocationID] smallint  NOT NULL,
    [Shelf] nvarchar(10)  NOT NULL,
    [Bin] tinyint  NOT NULL,
    [Quantity] smallint  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductListPriceHistory'
CREATE TABLE [dbo].[ProductListPriceHistory] (
    [ProductID] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [ListPrice] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModel'
CREATE TABLE [dbo].[ProductModel] (
    [ProductModelID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CatalogDescription] nvarchar(max)  NULL,
    [Instructions] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModelIllustration'
CREATE TABLE [dbo].[ProductModelIllustration] (
    [ProductModelID] int  NOT NULL,
    [IllustrationID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModelProductDescriptionCulture'
CREATE TABLE [dbo].[ProductModelProductDescriptionCulture] (
    [ProductModelID] int  NOT NULL,
    [ProductDescriptionID] int  NOT NULL,
    [CultureID] nchar(6)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductPhoto'
CREATE TABLE [dbo].[ProductPhoto] (
    [ProductPhotoID] int IDENTITY(1,1) NOT NULL,
    [ThumbNailPhoto] varbinary(max)  NULL,
    [ThumbnailPhotoFileName] nvarchar(50)  NULL,
    [LargePhoto] varbinary(max)  NULL,
    [LargePhotoFileName] nvarchar(50)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductProductPhoto'
CREATE TABLE [dbo].[ProductProductPhoto] (
    [ProductID] int  NOT NULL,
    [ProductPhotoID] int  NOT NULL,
    [Primary] bit  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductReview'
CREATE TABLE [dbo].[ProductReview] (
    [ProductReviewID] int IDENTITY(1,1) NOT NULL,
    [ReviewerName] nvarchar(50)  NOT NULL,
    [ReviewDate] datetime  NOT NULL,
    [EmailAddress] nvarchar(50)  NOT NULL,
    [Rating] int  NOT NULL,
    [Comments] nvarchar(3850)  NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Product_ProductID] int  NOT NULL
);
GO

-- Creating table 'ProductSubcategory'
CREATE TABLE [dbo].[ProductSubcategory] (
    [ProductSubcategoryID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [ProductCategory_ProductCategoryID] int  NOT NULL
);
GO

-- Creating table 'ScrapReason'
CREATE TABLE [dbo].[ScrapReason] (
    [ScrapReasonID] smallint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'TransactionHistory'
CREATE TABLE [dbo].[TransactionHistory] (
    [TransactionID] int IDENTITY(1,1) NOT NULL,
    [ReferenceOrderID] int  NOT NULL,
    [ReferenceOrderLineID] int  NOT NULL,
    [TransactionDate] datetime  NOT NULL,
    [TransactionType] nchar(1)  NOT NULL,
    [Quantity] int  NOT NULL,
    [ActualCost] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Product_ProductID] int  NOT NULL
);
GO

-- Creating table 'UnitMeasure'
CREATE TABLE [dbo].[UnitMeasure] (
    [UnitMeasureCode] nchar(3)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'WorkOrder'
CREATE TABLE [dbo].[WorkOrder] (
    [WorkOrderID] int IDENTITY(1,1) NOT NULL,
    [OrderQty] int  NOT NULL,
    [StockedQty] int  NOT NULL,
    [ScrappedQty] smallint  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [DueDate] datetime  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Product_ProductID] int  NOT NULL,
    [ScrapReason_ScrapReasonID] smallint  NULL
);
GO

-- Creating table 'WorkOrderRouting'
CREATE TABLE [dbo].[WorkOrderRouting] (
    [WorkOrderID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [OperationSequence] smallint  NOT NULL,
    [ScheduledStartDate] datetime  NOT NULL,
    [ScheduledEndDate] datetime  NOT NULL,
    [ActualStartDate] datetime  NULL,
    [ActualEndDate] datetime  NULL,
    [ActualResourceHrs] decimal(9,4)  NULL,
    [PlannedCost] decimal(19,4)  NOT NULL,
    [ActualCost] decimal(19,4)  NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Location_LocationID] smallint  NOT NULL
);
GO

-- Creating table 'ProductVendor'
CREATE TABLE [dbo].[ProductVendor] (
    [ProductID] int  NOT NULL,
    [VendorID] int  NOT NULL,
    [AverageLeadTime] int  NOT NULL,
    [StandardPrice] decimal(19,4)  NOT NULL,
    [LastReceiptCost] decimal(19,4)  NULL,
    [LastReceiptDate] datetime  NULL,
    [MinOrderQty] int  NOT NULL,
    [MaxOrderQty] int  NOT NULL,
    [OnOrderQty] int  NULL,
    [ModifiedDate] datetime  NOT NULL,
    [UnitMeasure_UnitMeasureCode] nchar(3)  NOT NULL
);
GO

-- Creating table 'PurchaseOrderDetail'
CREATE TABLE [dbo].[PurchaseOrderDetail] (
    [PurchaseOrderID] int  NOT NULL,
    [PurchaseOrderDetailID] int  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [OrderQty] smallint  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [LineTotal] decimal(19,4)  NOT NULL,
    [ReceivedQty] decimal(8,2)  NOT NULL,
    [RejectedQty] decimal(8,2)  NOT NULL,
    [StockedQty] decimal(9,2)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Product_ProductID] int  NOT NULL
);
GO

-- Creating table 'PurchaseOrderHeader'
CREATE TABLE [dbo].[PurchaseOrderHeader] (
    [PurchaseOrderID] int IDENTITY(1,1) NOT NULL,
    [RevisionNumber] tinyint  NOT NULL,
    [Status] tinyint  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [ShipDate] datetime  NULL,
    [SubTotal] decimal(19,4)  NOT NULL,
    [TaxAmt] decimal(19,4)  NOT NULL,
    [Freight] decimal(19,4)  NOT NULL,
    [TotalDue] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [OrderPlacedBy_EmployeeID] int  NOT NULL,
    [ShipMethod_ShipMethodID] int  NOT NULL,
    [Vendor_VendorID] int  NOT NULL
);
GO

-- Creating table 'ShipMethod'
CREATE TABLE [dbo].[ShipMethod] (
    [ShipMethodID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ShipBase] decimal(19,4)  NOT NULL,
    [ShipRate] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Vendor'
CREATE TABLE [dbo].[Vendor] (
    [VendorID] int IDENTITY(1,1) NOT NULL,
    [AccountNumber] nvarchar(15)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CreditRating] tinyint  NOT NULL,
    [PreferredVendorStatus] bit  NOT NULL,
    [ActiveFlag] bit  NOT NULL,
    [PurchasingWebServiceURL] nvarchar(1024)  NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'VendorAddress'
CREATE TABLE [dbo].[VendorAddress] (
    [VendorID] int  NOT NULL,
    [AddressID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [AddressType_AddressTypeID] int  NOT NULL
);
GO

-- Creating table 'VendorContact'
CREATE TABLE [dbo].[VendorContact] (
    [VendorID] int  NOT NULL,
    [ContactID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [ContactType_ContactTypeID] int  NOT NULL
);
GO

-- Creating table 'ContactCreditCard'
CREATE TABLE [dbo].[ContactCreditCard] (
    [ContactID] int  NOT NULL,
    [CreditCardID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CountryRegionCurrency'
CREATE TABLE [dbo].[CountryRegionCurrency] (
    [CountryRegionCode] nvarchar(3)  NOT NULL,
    [CurrencyCode] nchar(3)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CreditCard'
CREATE TABLE [dbo].[CreditCard] (
    [CreditCardID] int IDENTITY(1,1) NOT NULL,
    [CardType] nvarchar(50)  NOT NULL,
    [CardNumber] nvarchar(25)  NOT NULL,
    [ExpMonth] tinyint  NOT NULL,
    [ExpYear] smallint  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Currency'
CREATE TABLE [dbo].[Currency] (
    [CurrencyCode] nchar(3)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CurrencyRate'
CREATE TABLE [dbo].[CurrencyRate] (
    [CurrencyRateID] int IDENTITY(1,1) NOT NULL,
    [CurrencyRateDate] datetime  NOT NULL,
    [AverageRate] decimal(19,4)  NOT NULL,
    [EndOfDayRate] decimal(19,4)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Currency_CurrencyCode] nchar(3)  NOT NULL,
    [Currency1_CurrencyCode] nchar(3)  NOT NULL
);
GO

-- Creating table 'Customer'
CREATE TABLE [dbo].[Customer] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AccountNumber] varchar(10)  NOT NULL,
    [CustomerType] nchar(1)  NOT NULL,
    [CustomerRowguid] uniqueidentifier  NOT NULL,
    [CustomerModifiedDate] datetime  NOT NULL,
    [SalesTerritory_TerritoryID] int  NULL
);
GO

-- Creating table 'CustomerAddress'
CREATE TABLE [dbo].[CustomerAddress] (
    [CustomerID] int  NOT NULL,
    [AddressID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [AddressType_AddressTypeID] int  NOT NULL
);
GO

-- Creating table 'SalesOrderDetail'
CREATE TABLE [dbo].[SalesOrderDetail] (
    [SalesOrderID] int  NOT NULL,
    [SalesOrderDetailID] int IDENTITY(1,1) NOT NULL,
    [CarrierTrackingNumber] nvarchar(25)  NULL,
    [OrderQty] smallint  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [UnitPriceDiscount] decimal(19,4)  NOT NULL,
    [LineTotal] decimal(38,6)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [SpecialOfferProduct_SpecialOfferID] int  NOT NULL,
    [SpecialOfferProduct_ProductID] int  NOT NULL
);
GO

-- Creating table 'SalesOrderHeader'
CREATE TABLE [dbo].[SalesOrderHeader] (
    [SalesOrderID] int IDENTITY(1,1) NOT NULL,
    [RevisionNumber] tinyint  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [ShipDate] datetime  NULL,
    [Status] tinyint  NOT NULL,
    [OnlineOrder] bit  NOT NULL,
    [SalesOrderNumber] nvarchar(25)  NOT NULL,
    [PurchaseOrderNumber] nvarchar(25)  NULL,
    [AccountNumber] nvarchar(15)  NULL,
    [CreditCardApprovalCode] varchar(15)  NULL,
    [SubTotal] decimal(19,4)  NOT NULL,
    [TaxAmt] decimal(19,4)  NOT NULL,
    [Freight] decimal(19,4)  NOT NULL,
    [TotalDue] decimal(19,4)  NOT NULL,
    [Comment] nvarchar(128)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [BillingAddress_AddressID] int  NOT NULL,
    [ShippingAddress_AddressID] int  NOT NULL,
    [Contact_ContactID] int  NOT NULL,
    [ShipMethod_ShipMethodID] int  NOT NULL,
    [CreditCard_CreditCardID] int  NULL,
    [CurrencyRate_CurrencyRateID] int  NULL,
    [Customer_Id] int  NOT NULL,
    [SalesPerson_SalesPersonID] int  NULL,
    [SalesTerritory_TerritoryID] int  NULL
);
GO

-- Creating table 'SalesOrderHeaderSalesReason'
CREATE TABLE [dbo].[SalesOrderHeaderSalesReason] (
    [SalesOrderID] int  NOT NULL,
    [SalesReasonID] int  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesPerson'
CREATE TABLE [dbo].[SalesPerson] (
    [SalesPersonID] int  NOT NULL,
    [SalesQuota] decimal(19,4)  NULL,
    [Bonus] decimal(19,4)  NOT NULL,
    [CommissionPct] decimal(10,4)  NOT NULL,
    [SalesYTD] decimal(19,4)  NOT NULL,
    [SalesLastYear] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [SalesTerritory_TerritoryID] int  NULL
);
GO

-- Creating table 'SalesPersonQuotaHistory'
CREATE TABLE [dbo].[SalesPersonQuotaHistory] (
    [SalesPersonID] int  NOT NULL,
    [QuotaDate] datetime  NOT NULL,
    [SalesQuota] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesReason'
CREATE TABLE [dbo].[SalesReason] (
    [SalesReasonID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ReasonType] nvarchar(50)  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesTaxRate'
CREATE TABLE [dbo].[SalesTaxRate] (
    [SalesTaxRateID] int IDENTITY(1,1) NOT NULL,
    [TaxType] tinyint  NOT NULL,
    [TaxRate] decimal(10,4)  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [StateProvince_StateProvinceID] int  NOT NULL
);
GO

-- Creating table 'SalesTerritory'
CREATE TABLE [dbo].[SalesTerritory] (
    [TerritoryID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CountryRegionCode] nvarchar(3)  NOT NULL,
    [Group] nvarchar(50)  NOT NULL,
    [SalesYTD] decimal(19,4)  NOT NULL,
    [SalesLastYear] decimal(19,4)  NOT NULL,
    [CostYTD] decimal(19,4)  NOT NULL,
    [CostLastYear] decimal(19,4)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesTerritoryHistory'
CREATE TABLE [dbo].[SalesTerritoryHistory] (
    [SalesPersonID] int  NOT NULL,
    [TerritoryID] int  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ShoppingCartItem'
CREATE TABLE [dbo].[ShoppingCartItem] (
    [ShoppingCartItemID] int IDENTITY(1,1) NOT NULL,
    [ShoppingCartID] nvarchar(50)  NOT NULL,
    [Quantity] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Product_ProductID] int  NOT NULL
);
GO

-- Creating table 'SpecialOffer'
CREATE TABLE [dbo].[SpecialOffer] (
    [SpecialOfferID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(255)  NOT NULL,
    [DiscountPct] decimal(10,4)  NOT NULL,
    [Type] nvarchar(50)  NOT NULL,
    [Category] nvarchar(50)  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [MinQty] int  NOT NULL,
    [MaxQty] int  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SpecialOfferProduct'
CREATE TABLE [dbo].[SpecialOfferProduct] (
    [SpecialOfferID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'StoreContact'
CREATE TABLE [dbo].[StoreContact] (
    [CustomerID] int  NOT NULL,
    [ContactID] int  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [ContactType_ContactTypeID] int  NOT NULL
);
GO

-- Creating table 'Customer_Individual'
CREATE TABLE [dbo].[Customer_Individual] (
    [Demographics] nvarchar(max)  NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Id] int  NOT NULL,
    [Contact_ContactID] int  NOT NULL
);
GO

-- Creating table 'Customer_Store'
CREATE TABLE [dbo].[Customer_Store] (
    [Name] nvarchar(50)  NOT NULL,
    [Demographics] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL,
    [Id] int  NOT NULL,
    [SalesPerson_SalesPersonID] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DepartmentID] in table 'Department'
ALTER TABLE [dbo].[Department]
ADD CONSTRAINT [PK_Department]
    PRIMARY KEY CLUSTERED ([DepartmentID] ASC);
GO

-- Creating primary key on [EmployeeID] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [PK_Employee]
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC);
GO

-- Creating primary key on [EmployeeID], [AddressID] in table 'EmployeeAddress'
ALTER TABLE [dbo].[EmployeeAddress]
ADD CONSTRAINT [PK_EmployeeAddress]
    PRIMARY KEY CLUSTERED ([EmployeeID], [AddressID] ASC);
GO

-- Creating primary key on [EmployeeID], [DepartmentID], [ShiftID], [StartDate] in table 'EmployeeDepartmentHistory'
ALTER TABLE [dbo].[EmployeeDepartmentHistory]
ADD CONSTRAINT [PK_EmployeeDepartmentHistory]
    PRIMARY KEY CLUSTERED ([EmployeeID], [DepartmentID], [ShiftID], [StartDate] ASC);
GO

-- Creating primary key on [EmployeeID], [RateChangeDate] in table 'EmployeePayHistory'
ALTER TABLE [dbo].[EmployeePayHistory]
ADD CONSTRAINT [PK_EmployeePayHistory]
    PRIMARY KEY CLUSTERED ([EmployeeID], [RateChangeDate] ASC);
GO

-- Creating primary key on [JobCandidateID] in table 'JobCandidate'
ALTER TABLE [dbo].[JobCandidate]
ADD CONSTRAINT [PK_JobCandidate]
    PRIMARY KEY CLUSTERED ([JobCandidateID] ASC);
GO

-- Creating primary key on [ShiftID] in table 'Shift'
ALTER TABLE [dbo].[Shift]
ADD CONSTRAINT [PK_Shift]
    PRIMARY KEY CLUSTERED ([ShiftID] ASC);
GO

-- Creating primary key on [AddressID] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [PK_Address]
    PRIMARY KEY CLUSTERED ([AddressID] ASC);
GO

-- Creating primary key on [AddressTypeID] in table 'AddressType'
ALTER TABLE [dbo].[AddressType]
ADD CONSTRAINT [PK_AddressType]
    PRIMARY KEY CLUSTERED ([AddressTypeID] ASC);
GO

-- Creating primary key on [ContactID] in table 'Contact'
ALTER TABLE [dbo].[Contact]
ADD CONSTRAINT [PK_Contact]
    PRIMARY KEY CLUSTERED ([ContactID] ASC);
GO

-- Creating primary key on [ContactTypeID] in table 'ContactType'
ALTER TABLE [dbo].[ContactType]
ADD CONSTRAINT [PK_ContactType]
    PRIMARY KEY CLUSTERED ([ContactTypeID] ASC);
GO

-- Creating primary key on [CountryRegionCode] in table 'CountryRegion'
ALTER TABLE [dbo].[CountryRegion]
ADD CONSTRAINT [PK_CountryRegion]
    PRIMARY KEY CLUSTERED ([CountryRegionCode] ASC);
GO

-- Creating primary key on [StateProvinceID] in table 'StateProvince'
ALTER TABLE [dbo].[StateProvince]
ADD CONSTRAINT [PK_StateProvince]
    PRIMARY KEY CLUSTERED ([StateProvinceID] ASC);
GO

-- Creating primary key on [BillOfMaterialsID] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [PK_BillOfMaterials]
    PRIMARY KEY CLUSTERED ([BillOfMaterialsID] ASC);
GO

-- Creating primary key on [CultureID] in table 'Culture'
ALTER TABLE [dbo].[Culture]
ADD CONSTRAINT [PK_Culture]
    PRIMARY KEY CLUSTERED ([CultureID] ASC);
GO

-- Creating primary key on [DocumentID] in table 'Document'
ALTER TABLE [dbo].[Document]
ADD CONSTRAINT [PK_Document]
    PRIMARY KEY CLUSTERED ([DocumentID] ASC);
GO

-- Creating primary key on [IllustrationID] in table 'Illustration'
ALTER TABLE [dbo].[Illustration]
ADD CONSTRAINT [PK_Illustration]
    PRIMARY KEY CLUSTERED ([IllustrationID] ASC);
GO

-- Creating primary key on [LocationID] in table 'Location'
ALTER TABLE [dbo].[Location]
ADD CONSTRAINT [PK_Location]
    PRIMARY KEY CLUSTERED ([LocationID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [ProductCategoryID] in table 'ProductCategory'
ALTER TABLE [dbo].[ProductCategory]
ADD CONSTRAINT [PK_ProductCategory]
    PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC);
GO

-- Creating primary key on [ProductID], [StartDate] in table 'ProductCostHistory'
ALTER TABLE [dbo].[ProductCostHistory]
ADD CONSTRAINT [PK_ProductCostHistory]
    PRIMARY KEY CLUSTERED ([ProductID], [StartDate] ASC);
GO

-- Creating primary key on [ProductDescriptionID] in table 'ProductDescription'
ALTER TABLE [dbo].[ProductDescription]
ADD CONSTRAINT [PK_ProductDescription]
    PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC);
GO

-- Creating primary key on [ProductID], [DocumentID] in table 'ProductDocument'
ALTER TABLE [dbo].[ProductDocument]
ADD CONSTRAINT [PK_ProductDocument]
    PRIMARY KEY CLUSTERED ([ProductID], [DocumentID] ASC);
GO

-- Creating primary key on [ProductID], [LocationID] in table 'ProductInventory'
ALTER TABLE [dbo].[ProductInventory]
ADD CONSTRAINT [PK_ProductInventory]
    PRIMARY KEY CLUSTERED ([ProductID], [LocationID] ASC);
GO

-- Creating primary key on [ProductID], [StartDate] in table 'ProductListPriceHistory'
ALTER TABLE [dbo].[ProductListPriceHistory]
ADD CONSTRAINT [PK_ProductListPriceHistory]
    PRIMARY KEY CLUSTERED ([ProductID], [StartDate] ASC);
GO

-- Creating primary key on [ProductModelID] in table 'ProductModel'
ALTER TABLE [dbo].[ProductModel]
ADD CONSTRAINT [PK_ProductModel]
    PRIMARY KEY CLUSTERED ([ProductModelID] ASC);
GO

-- Creating primary key on [ProductModelID], [IllustrationID] in table 'ProductModelIllustration'
ALTER TABLE [dbo].[ProductModelIllustration]
ADD CONSTRAINT [PK_ProductModelIllustration]
    PRIMARY KEY CLUSTERED ([ProductModelID], [IllustrationID] ASC);
GO

-- Creating primary key on [ProductModelID], [ProductDescriptionID], [CultureID] in table 'ProductModelProductDescriptionCulture'
ALTER TABLE [dbo].[ProductModelProductDescriptionCulture]
ADD CONSTRAINT [PK_ProductModelProductDescriptionCulture]
    PRIMARY KEY CLUSTERED ([ProductModelID], [ProductDescriptionID], [CultureID] ASC);
GO

-- Creating primary key on [ProductPhotoID] in table 'ProductPhoto'
ALTER TABLE [dbo].[ProductPhoto]
ADD CONSTRAINT [PK_ProductPhoto]
    PRIMARY KEY CLUSTERED ([ProductPhotoID] ASC);
GO

-- Creating primary key on [ProductID], [ProductPhotoID] in table 'ProductProductPhoto'
ALTER TABLE [dbo].[ProductProductPhoto]
ADD CONSTRAINT [PK_ProductProductPhoto]
    PRIMARY KEY CLUSTERED ([ProductID], [ProductPhotoID] ASC);
GO

-- Creating primary key on [ProductReviewID] in table 'ProductReview'
ALTER TABLE [dbo].[ProductReview]
ADD CONSTRAINT [PK_ProductReview]
    PRIMARY KEY CLUSTERED ([ProductReviewID] ASC);
GO

-- Creating primary key on [ProductSubcategoryID] in table 'ProductSubcategory'
ALTER TABLE [dbo].[ProductSubcategory]
ADD CONSTRAINT [PK_ProductSubcategory]
    PRIMARY KEY CLUSTERED ([ProductSubcategoryID] ASC);
GO

-- Creating primary key on [ScrapReasonID] in table 'ScrapReason'
ALTER TABLE [dbo].[ScrapReason]
ADD CONSTRAINT [PK_ScrapReason]
    PRIMARY KEY CLUSTERED ([ScrapReasonID] ASC);
GO

-- Creating primary key on [TransactionID] in table 'TransactionHistory'
ALTER TABLE [dbo].[TransactionHistory]
ADD CONSTRAINT [PK_TransactionHistory]
    PRIMARY KEY CLUSTERED ([TransactionID] ASC);
GO

-- Creating primary key on [UnitMeasureCode] in table 'UnitMeasure'
ALTER TABLE [dbo].[UnitMeasure]
ADD CONSTRAINT [PK_UnitMeasure]
    PRIMARY KEY CLUSTERED ([UnitMeasureCode] ASC);
GO

-- Creating primary key on [WorkOrderID] in table 'WorkOrder'
ALTER TABLE [dbo].[WorkOrder]
ADD CONSTRAINT [PK_WorkOrder]
    PRIMARY KEY CLUSTERED ([WorkOrderID] ASC);
GO

-- Creating primary key on [WorkOrderID], [ProductID], [OperationSequence] in table 'WorkOrderRouting'
ALTER TABLE [dbo].[WorkOrderRouting]
ADD CONSTRAINT [PK_WorkOrderRouting]
    PRIMARY KEY CLUSTERED ([WorkOrderID], [ProductID], [OperationSequence] ASC);
GO

-- Creating primary key on [ProductID], [VendorID] in table 'ProductVendor'
ALTER TABLE [dbo].[ProductVendor]
ADD CONSTRAINT [PK_ProductVendor]
    PRIMARY KEY CLUSTERED ([ProductID], [VendorID] ASC);
GO

-- Creating primary key on [PurchaseOrderID], [PurchaseOrderDetailID] in table 'PurchaseOrderDetail'
ALTER TABLE [dbo].[PurchaseOrderDetail]
ADD CONSTRAINT [PK_PurchaseOrderDetail]
    PRIMARY KEY CLUSTERED ([PurchaseOrderID], [PurchaseOrderDetailID] ASC);
GO

-- Creating primary key on [PurchaseOrderID] in table 'PurchaseOrderHeader'
ALTER TABLE [dbo].[PurchaseOrderHeader]
ADD CONSTRAINT [PK_PurchaseOrderHeader]
    PRIMARY KEY CLUSTERED ([PurchaseOrderID] ASC);
GO

-- Creating primary key on [ShipMethodID] in table 'ShipMethod'
ALTER TABLE [dbo].[ShipMethod]
ADD CONSTRAINT [PK_ShipMethod]
    PRIMARY KEY CLUSTERED ([ShipMethodID] ASC);
GO

-- Creating primary key on [VendorID] in table 'Vendor'
ALTER TABLE [dbo].[Vendor]
ADD CONSTRAINT [PK_Vendor]
    PRIMARY KEY CLUSTERED ([VendorID] ASC);
GO

-- Creating primary key on [VendorID], [AddressID] in table 'VendorAddress'
ALTER TABLE [dbo].[VendorAddress]
ADD CONSTRAINT [PK_VendorAddress]
    PRIMARY KEY CLUSTERED ([VendorID], [AddressID] ASC);
GO

-- Creating primary key on [VendorID], [ContactID] in table 'VendorContact'
ALTER TABLE [dbo].[VendorContact]
ADD CONSTRAINT [PK_VendorContact]
    PRIMARY KEY CLUSTERED ([VendorID], [ContactID] ASC);
GO

-- Creating primary key on [ContactID], [CreditCardID] in table 'ContactCreditCard'
ALTER TABLE [dbo].[ContactCreditCard]
ADD CONSTRAINT [PK_ContactCreditCard]
    PRIMARY KEY CLUSTERED ([ContactID], [CreditCardID] ASC);
GO

-- Creating primary key on [CountryRegionCode], [CurrencyCode] in table 'CountryRegionCurrency'
ALTER TABLE [dbo].[CountryRegionCurrency]
ADD CONSTRAINT [PK_CountryRegionCurrency]
    PRIMARY KEY CLUSTERED ([CountryRegionCode], [CurrencyCode] ASC);
GO

-- Creating primary key on [CreditCardID] in table 'CreditCard'
ALTER TABLE [dbo].[CreditCard]
ADD CONSTRAINT [PK_CreditCard]
    PRIMARY KEY CLUSTERED ([CreditCardID] ASC);
GO

-- Creating primary key on [CurrencyCode] in table 'Currency'
ALTER TABLE [dbo].[Currency]
ADD CONSTRAINT [PK_Currency]
    PRIMARY KEY CLUSTERED ([CurrencyCode] ASC);
GO

-- Creating primary key on [CurrencyRateID] in table 'CurrencyRate'
ALTER TABLE [dbo].[CurrencyRate]
ADD CONSTRAINT [PK_CurrencyRate]
    PRIMARY KEY CLUSTERED ([CurrencyRateID] ASC);
GO

-- Creating primary key on [Id] in table 'Customer'
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT [PK_Customer]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [CustomerID], [AddressID] in table 'CustomerAddress'
ALTER TABLE [dbo].[CustomerAddress]
ADD CONSTRAINT [PK_CustomerAddress]
    PRIMARY KEY CLUSTERED ([CustomerID], [AddressID] ASC);
GO

-- Creating primary key on [SalesOrderID], [SalesOrderDetailID] in table 'SalesOrderDetail'
ALTER TABLE [dbo].[SalesOrderDetail]
ADD CONSTRAINT [PK_SalesOrderDetail]
    PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesOrderDetailID] ASC);
GO

-- Creating primary key on [SalesOrderID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [PK_SalesOrderHeader]
    PRIMARY KEY CLUSTERED ([SalesOrderID] ASC);
GO

-- Creating primary key on [SalesOrderID], [SalesReasonID] in table 'SalesOrderHeaderSalesReason'
ALTER TABLE [dbo].[SalesOrderHeaderSalesReason]
ADD CONSTRAINT [PK_SalesOrderHeaderSalesReason]
    PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesReasonID] ASC);
GO

-- Creating primary key on [SalesPersonID] in table 'SalesPerson'
ALTER TABLE [dbo].[SalesPerson]
ADD CONSTRAINT [PK_SalesPerson]
    PRIMARY KEY CLUSTERED ([SalesPersonID] ASC);
GO

-- Creating primary key on [SalesPersonID], [QuotaDate] in table 'SalesPersonQuotaHistory'
ALTER TABLE [dbo].[SalesPersonQuotaHistory]
ADD CONSTRAINT [PK_SalesPersonQuotaHistory]
    PRIMARY KEY CLUSTERED ([SalesPersonID], [QuotaDate] ASC);
GO

-- Creating primary key on [SalesReasonID] in table 'SalesReason'
ALTER TABLE [dbo].[SalesReason]
ADD CONSTRAINT [PK_SalesReason]
    PRIMARY KEY CLUSTERED ([SalesReasonID] ASC);
GO

-- Creating primary key on [SalesTaxRateID] in table 'SalesTaxRate'
ALTER TABLE [dbo].[SalesTaxRate]
ADD CONSTRAINT [PK_SalesTaxRate]
    PRIMARY KEY CLUSTERED ([SalesTaxRateID] ASC);
GO

-- Creating primary key on [TerritoryID] in table 'SalesTerritory'
ALTER TABLE [dbo].[SalesTerritory]
ADD CONSTRAINT [PK_SalesTerritory]
    PRIMARY KEY CLUSTERED ([TerritoryID] ASC);
GO

-- Creating primary key on [SalesPersonID], [TerritoryID], [StartDate] in table 'SalesTerritoryHistory'
ALTER TABLE [dbo].[SalesTerritoryHistory]
ADD CONSTRAINT [PK_SalesTerritoryHistory]
    PRIMARY KEY CLUSTERED ([SalesPersonID], [TerritoryID], [StartDate] ASC);
GO

-- Creating primary key on [ShoppingCartItemID] in table 'ShoppingCartItem'
ALTER TABLE [dbo].[ShoppingCartItem]
ADD CONSTRAINT [PK_ShoppingCartItem]
    PRIMARY KEY CLUSTERED ([ShoppingCartItemID] ASC);
GO

-- Creating primary key on [SpecialOfferID] in table 'SpecialOffer'
ALTER TABLE [dbo].[SpecialOffer]
ADD CONSTRAINT [PK_SpecialOffer]
    PRIMARY KEY CLUSTERED ([SpecialOfferID] ASC);
GO

-- Creating primary key on [SpecialOfferID], [ProductID] in table 'SpecialOfferProduct'
ALTER TABLE [dbo].[SpecialOfferProduct]
ADD CONSTRAINT [PK_SpecialOfferProduct]
    PRIMARY KEY CLUSTERED ([SpecialOfferID], [ProductID] ASC);
GO

-- Creating primary key on [CustomerID], [ContactID] in table 'StoreContact'
ALTER TABLE [dbo].[StoreContact]
ADD CONSTRAINT [PK_StoreContact]
    PRIMARY KEY CLUSTERED ([CustomerID], [ContactID] ASC);
GO

-- Creating primary key on [Id] in table 'Customer_Individual'
ALTER TABLE [dbo].[Customer_Individual]
ADD CONSTRAINT [PK_Customer_Individual]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Customer_Store'
ALTER TABLE [dbo].[Customer_Store]
ADD CONSTRAINT [PK_Customer_Store]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DepartmentID] in table 'EmployeeDepartmentHistory'
ALTER TABLE [dbo].[EmployeeDepartmentHistory]
ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID]
    FOREIGN KEY ([DepartmentID])
    REFERENCES [dbo].[Department]
        ([DepartmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeDepartmentHistory_Department_DepartmentID'
CREATE INDEX [IX_FK_EmployeeDepartmentHistory_Department_DepartmentID]
ON [dbo].[EmployeeDepartmentHistory]
    ([DepartmentID]);
GO

-- Creating foreign key on [ContactDetails_ContactID] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [FK_Employee_Contact_ContactID]
    FOREIGN KEY ([ContactDetails_ContactID])
    REFERENCES [dbo].[Contact]
        ([ContactID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Employee_Contact_ContactID'
CREATE INDEX [IX_FK_Employee_Contact_ContactID]
ON [dbo].[Employee]
    ([ContactDetails_ContactID]);
GO

-- Creating foreign key on [Manager_EmployeeID] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [FK_Employee_Employee_ManagerID]
    FOREIGN KEY ([Manager_EmployeeID])
    REFERENCES [dbo].[Employee]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Employee_Employee_ManagerID'
CREATE INDEX [IX_FK_Employee_Employee_ManagerID]
ON [dbo].[Employee]
    ([Manager_EmployeeID]);
GO

-- Creating foreign key on [EmployeeID] in table 'EmployeeAddress'
ALTER TABLE [dbo].[EmployeeAddress]
ADD CONSTRAINT [FK_EmployeeAddress_Employee_EmployeeID]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employee]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EmployeeID] in table 'EmployeeDepartmentHistory'
ALTER TABLE [dbo].[EmployeeDepartmentHistory]
ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_EmployeeID]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employee]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EmployeeID] in table 'EmployeePayHistory'
ALTER TABLE [dbo].[EmployeePayHistory]
ADD CONSTRAINT [FK_EmployeePayHistory_Employee_EmployeeID]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[Employee]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Employee_EmployeeID] in table 'JobCandidate'
ALTER TABLE [dbo].[JobCandidate]
ADD CONSTRAINT [FK_JobCandidate_Employee_EmployeeID]
    FOREIGN KEY ([Employee_EmployeeID])
    REFERENCES [dbo].[Employee]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JobCandidate_Employee_EmployeeID'
CREATE INDEX [IX_FK_JobCandidate_Employee_EmployeeID]
ON [dbo].[JobCandidate]
    ([Employee_EmployeeID]);
GO

-- Creating foreign key on [OrderPlacedBy_EmployeeID] in table 'PurchaseOrderHeader'
ALTER TABLE [dbo].[PurchaseOrderHeader]
ADD CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID]
    FOREIGN KEY ([OrderPlacedBy_EmployeeID])
    REFERENCES [dbo].[Employee]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderHeader_Employee_EmployeeID'
CREATE INDEX [IX_FK_PurchaseOrderHeader_Employee_EmployeeID]
ON [dbo].[PurchaseOrderHeader]
    ([OrderPlacedBy_EmployeeID]);
GO

-- Creating foreign key on [SalesPersonID] in table 'SalesPerson'
ALTER TABLE [dbo].[SalesPerson]
ADD CONSTRAINT [FK_SalesPerson_Employee_SalesPersonID]
    FOREIGN KEY ([SalesPersonID])
    REFERENCES [dbo].[Employee]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AddressID] in table 'EmployeeAddress'
ALTER TABLE [dbo].[EmployeeAddress]
ADD CONSTRAINT [FK_EmployeeAddress_Address_AddressID]
    FOREIGN KEY ([AddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeAddress_Address_AddressID'
CREATE INDEX [IX_FK_EmployeeAddress_Address_AddressID]
ON [dbo].[EmployeeAddress]
    ([AddressID]);
GO

-- Creating foreign key on [ShiftID] in table 'EmployeeDepartmentHistory'
ALTER TABLE [dbo].[EmployeeDepartmentHistory]
ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID]
    FOREIGN KEY ([ShiftID])
    REFERENCES [dbo].[Shift]
        ([ShiftID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeDepartmentHistory_Shift_ShiftID'
CREATE INDEX [IX_FK_EmployeeDepartmentHistory_Shift_ShiftID]
ON [dbo].[EmployeeDepartmentHistory]
    ([ShiftID]);
GO

-- Creating foreign key on [StateProvince_StateProvinceID] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID]
    FOREIGN KEY ([StateProvince_StateProvinceID])
    REFERENCES [dbo].[StateProvince]
        ([StateProvinceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Address_StateProvince_StateProvinceID'
CREATE INDEX [IX_FK_Address_StateProvince_StateProvinceID]
ON [dbo].[Address]
    ([StateProvince_StateProvinceID]);
GO

-- Creating foreign key on [AddressID] in table 'CustomerAddress'
ALTER TABLE [dbo].[CustomerAddress]
ADD CONSTRAINT [FK_CustomerAddress_Address_AddressID]
    FOREIGN KEY ([AddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAddress_Address_AddressID'
CREATE INDEX [IX_FK_CustomerAddress_Address_AddressID]
ON [dbo].[CustomerAddress]
    ([AddressID]);
GO

-- Creating foreign key on [BillingAddress_AddressID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]
    FOREIGN KEY ([BillingAddress_AddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_BillToAddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_BillToAddressID]
ON [dbo].[SalesOrderHeader]
    ([BillingAddress_AddressID]);
GO

-- Creating foreign key on [ShippingAddress_AddressID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]
    FOREIGN KEY ([ShippingAddress_AddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_ShipToAddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_ShipToAddressID]
ON [dbo].[SalesOrderHeader]
    ([ShippingAddress_AddressID]);
GO

-- Creating foreign key on [AddressID] in table 'VendorAddress'
ALTER TABLE [dbo].[VendorAddress]
ADD CONSTRAINT [FK_VendorAddress_Address_AddressID]
    FOREIGN KEY ([AddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VendorAddress_Address_AddressID'
CREATE INDEX [IX_FK_VendorAddress_Address_AddressID]
ON [dbo].[VendorAddress]
    ([AddressID]);
GO

-- Creating foreign key on [AddressType_AddressTypeID] in table 'CustomerAddress'
ALTER TABLE [dbo].[CustomerAddress]
ADD CONSTRAINT [FK_CustomerAddress_AddressType_AddressTypeID]
    FOREIGN KEY ([AddressType_AddressTypeID])
    REFERENCES [dbo].[AddressType]
        ([AddressTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAddress_AddressType_AddressTypeID'
CREATE INDEX [IX_FK_CustomerAddress_AddressType_AddressTypeID]
ON [dbo].[CustomerAddress]
    ([AddressType_AddressTypeID]);
GO

-- Creating foreign key on [AddressType_AddressTypeID] in table 'VendorAddress'
ALTER TABLE [dbo].[VendorAddress]
ADD CONSTRAINT [FK_VendorAddress_AddressType_AddressTypeID]
    FOREIGN KEY ([AddressType_AddressTypeID])
    REFERENCES [dbo].[AddressType]
        ([AddressTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VendorAddress_AddressType_AddressTypeID'
CREATE INDEX [IX_FK_VendorAddress_AddressType_AddressTypeID]
ON [dbo].[VendorAddress]
    ([AddressType_AddressTypeID]);
GO

-- Creating foreign key on [ContactID] in table 'ContactCreditCard'
ALTER TABLE [dbo].[ContactCreditCard]
ADD CONSTRAINT [FK_ContactCreditCard_Contact_ContactID]
    FOREIGN KEY ([ContactID])
    REFERENCES [dbo].[Contact]
        ([ContactID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Contact_ContactID] in table 'Customer_Individual'
ALTER TABLE [dbo].[Customer_Individual]
ADD CONSTRAINT [FK_Individual_Contact_ContactID]
    FOREIGN KEY ([Contact_ContactID])
    REFERENCES [dbo].[Contact]
        ([ContactID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Individual_Contact_ContactID'
CREATE INDEX [IX_FK_Individual_Contact_ContactID]
ON [dbo].[Customer_Individual]
    ([Contact_ContactID]);
GO

-- Creating foreign key on [Contact_ContactID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_Contact_ContactID]
    FOREIGN KEY ([Contact_ContactID])
    REFERENCES [dbo].[Contact]
        ([ContactID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Contact_ContactID'
CREATE INDEX [IX_FK_SalesOrderHeader_Contact_ContactID]
ON [dbo].[SalesOrderHeader]
    ([Contact_ContactID]);
GO

-- Creating foreign key on [ContactID] in table 'StoreContact'
ALTER TABLE [dbo].[StoreContact]
ADD CONSTRAINT [FK_StoreContact_Contact_ContactID]
    FOREIGN KEY ([ContactID])
    REFERENCES [dbo].[Contact]
        ([ContactID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StoreContact_Contact_ContactID'
CREATE INDEX [IX_FK_StoreContact_Contact_ContactID]
ON [dbo].[StoreContact]
    ([ContactID]);
GO

-- Creating foreign key on [ContactID] in table 'VendorContact'
ALTER TABLE [dbo].[VendorContact]
ADD CONSTRAINT [FK_VendorContact_Contact_ContactID]
    FOREIGN KEY ([ContactID])
    REFERENCES [dbo].[Contact]
        ([ContactID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VendorContact_Contact_ContactID'
CREATE INDEX [IX_FK_VendorContact_Contact_ContactID]
ON [dbo].[VendorContact]
    ([ContactID]);
GO

-- Creating foreign key on [ContactType_ContactTypeID] in table 'StoreContact'
ALTER TABLE [dbo].[StoreContact]
ADD CONSTRAINT [FK_StoreContact_ContactType_ContactTypeID]
    FOREIGN KEY ([ContactType_ContactTypeID])
    REFERENCES [dbo].[ContactType]
        ([ContactTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StoreContact_ContactType_ContactTypeID'
CREATE INDEX [IX_FK_StoreContact_ContactType_ContactTypeID]
ON [dbo].[StoreContact]
    ([ContactType_ContactTypeID]);
GO

-- Creating foreign key on [ContactType_ContactTypeID] in table 'VendorContact'
ALTER TABLE [dbo].[VendorContact]
ADD CONSTRAINT [FK_VendorContact_ContactType_ContactTypeID]
    FOREIGN KEY ([ContactType_ContactTypeID])
    REFERENCES [dbo].[ContactType]
        ([ContactTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VendorContact_ContactType_ContactTypeID'
CREATE INDEX [IX_FK_VendorContact_ContactType_ContactTypeID]
ON [dbo].[VendorContact]
    ([ContactType_ContactTypeID]);
GO

-- Creating foreign key on [CountryRegionCode] in table 'CountryRegionCurrency'
ALTER TABLE [dbo].[CountryRegionCurrency]
ADD CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]
    FOREIGN KEY ([CountryRegionCode])
    REFERENCES [dbo].[CountryRegion]
        ([CountryRegionCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CountryRegion_CountryRegionCode] in table 'StateProvince'
ALTER TABLE [dbo].[StateProvince]
ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode]
    FOREIGN KEY ([CountryRegion_CountryRegionCode])
    REFERENCES [dbo].[CountryRegion]
        ([CountryRegionCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StateProvince_CountryRegion_CountryRegionCode'
CREATE INDEX [IX_FK_StateProvince_CountryRegion_CountryRegionCode]
ON [dbo].[StateProvince]
    ([CountryRegion_CountryRegionCode]);
GO

-- Creating foreign key on [StateProvince_StateProvinceID] in table 'SalesTaxRate'
ALTER TABLE [dbo].[SalesTaxRate]
ADD CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]
    FOREIGN KEY ([StateProvince_StateProvinceID])
    REFERENCES [dbo].[StateProvince]
        ([StateProvinceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesTaxRate_StateProvince_StateProvinceID'
CREATE INDEX [IX_FK_SalesTaxRate_StateProvince_StateProvinceID]
ON [dbo].[SalesTaxRate]
    ([StateProvince_StateProvinceID]);
GO

-- Creating foreign key on [SalesTerritory_TerritoryID] in table 'StateProvince'
ALTER TABLE [dbo].[StateProvince]
ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID]
    FOREIGN KEY ([SalesTerritory_TerritoryID])
    REFERENCES [dbo].[SalesTerritory]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StateProvince_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_StateProvince_SalesTerritory_TerritoryID]
ON [dbo].[StateProvince]
    ([SalesTerritory_TerritoryID]);
GO

-- Creating foreign key on [Product_ProductID] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillOfMaterials_Product_ComponentID'
CREATE INDEX [IX_FK_BillOfMaterials_Product_ComponentID]
ON [dbo].[BillOfMaterials]
    ([Product_ProductID]);
GO

-- Creating foreign key on [Product1_ProductID] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]
    FOREIGN KEY ([Product1_ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillOfMaterials_Product_ProductAssemblyID'
CREATE INDEX [IX_FK_BillOfMaterials_Product_ProductAssemblyID]
ON [dbo].[BillOfMaterials]
    ([Product1_ProductID]);
GO

-- Creating foreign key on [UnitMeasure_UnitMeasureCode] in table 'BillOfMaterials'
ALTER TABLE [dbo].[BillOfMaterials]
ADD CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
    FOREIGN KEY ([UnitMeasure_UnitMeasureCode])
    REFERENCES [dbo].[UnitMeasure]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillOfMaterials_UnitMeasure_UnitMeasureCode'
CREATE INDEX [IX_FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
ON [dbo].[BillOfMaterials]
    ([UnitMeasure_UnitMeasureCode]);
GO

-- Creating foreign key on [CultureID] in table 'ProductModelProductDescriptionCulture'
ALTER TABLE [dbo].[ProductModelProductDescriptionCulture]
ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID]
    FOREIGN KEY ([CultureID])
    REFERENCES [dbo].[Culture]
        ([CultureID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelProductDescriptionCulture_Culture_CultureID'
CREATE INDEX [IX_FK_ProductModelProductDescriptionCulture_Culture_CultureID]
ON [dbo].[ProductModelProductDescriptionCulture]
    ([CultureID]);
GO

-- Creating foreign key on [DocumentID] in table 'ProductDocument'
ALTER TABLE [dbo].[ProductDocument]
ADD CONSTRAINT [FK_ProductDocument_Document_DocumentID]
    FOREIGN KEY ([DocumentID])
    REFERENCES [dbo].[Document]
        ([DocumentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductDocument_Document_DocumentID'
CREATE INDEX [IX_FK_ProductDocument_Document_DocumentID]
ON [dbo].[ProductDocument]
    ([DocumentID]);
GO

-- Creating foreign key on [IllustrationID] in table 'ProductModelIllustration'
ALTER TABLE [dbo].[ProductModelIllustration]
ADD CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID]
    FOREIGN KEY ([IllustrationID])
    REFERENCES [dbo].[Illustration]
        ([IllustrationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelIllustration_Illustration_IllustrationID'
CREATE INDEX [IX_FK_ProductModelIllustration_Illustration_IllustrationID]
ON [dbo].[ProductModelIllustration]
    ([IllustrationID]);
GO

-- Creating foreign key on [LocationID] in table 'ProductInventory'
ALTER TABLE [dbo].[ProductInventory]
ADD CONSTRAINT [FK_ProductInventory_Location_LocationID]
    FOREIGN KEY ([LocationID])
    REFERENCES [dbo].[Location]
        ([LocationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductInventory_Location_LocationID'
CREATE INDEX [IX_FK_ProductInventory_Location_LocationID]
ON [dbo].[ProductInventory]
    ([LocationID]);
GO

-- Creating foreign key on [Location_LocationID] in table 'WorkOrderRouting'
ALTER TABLE [dbo].[WorkOrderRouting]
ADD CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]
    FOREIGN KEY ([Location_LocationID])
    REFERENCES [dbo].[Location]
        ([LocationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkOrderRouting_Location_LocationID'
CREATE INDEX [IX_FK_WorkOrderRouting_Location_LocationID]
ON [dbo].[WorkOrderRouting]
    ([Location_LocationID]);
GO

-- Creating foreign key on [ProductModel_ProductModelID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModel_ProductModelID])
    REFERENCES [dbo].[ProductModel]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductModel_ProductModelID'
CREATE INDEX [IX_FK_Product_ProductModel_ProductModelID]
ON [dbo].[Product]
    ([ProductModel_ProductModelID]);
GO

-- Creating foreign key on [ProductSubcategory_ProductSubcategoryID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]
    FOREIGN KEY ([ProductSubcategory_ProductSubcategoryID])
    REFERENCES [dbo].[ProductSubcategory]
        ([ProductSubcategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductSubcategory_ProductSubcategoryID'
CREATE INDEX [IX_FK_Product_ProductSubcategory_ProductSubcategoryID]
ON [dbo].[Product]
    ([ProductSubcategory_ProductSubcategoryID]);
GO

-- Creating foreign key on [SizeUnit_UnitMeasureCode] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]
    FOREIGN KEY ([SizeUnit_UnitMeasureCode])
    REFERENCES [dbo].[UnitMeasure]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_UnitMeasure_SizeUnitMeasureCode'
CREATE INDEX [IX_FK_Product_UnitMeasure_SizeUnitMeasureCode]
ON [dbo].[Product]
    ([SizeUnit_UnitMeasureCode]);
GO

-- Creating foreign key on [WeightUnit_UnitMeasureCode] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]
    FOREIGN KEY ([WeightUnit_UnitMeasureCode])
    REFERENCES [dbo].[UnitMeasure]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_UnitMeasure_WeightUnitMeasureCode'
CREATE INDEX [IX_FK_Product_UnitMeasure_WeightUnitMeasureCode]
ON [dbo].[Product]
    ([WeightUnit_UnitMeasureCode]);
GO

-- Creating foreign key on [ProductID] in table 'ProductCostHistory'
ALTER TABLE [dbo].[ProductCostHistory]
ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductDocument'
ALTER TABLE [dbo].[ProductDocument]
ADD CONSTRAINT [FK_ProductDocument_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductInventory'
ALTER TABLE [dbo].[ProductInventory]
ADD CONSTRAINT [FK_ProductInventory_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductListPriceHistory'
ALTER TABLE [dbo].[ProductListPriceHistory]
ADD CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'ProductProductPhoto'
ALTER TABLE [dbo].[ProductProductPhoto]
ADD CONSTRAINT [FK_ProductProductPhoto_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Product_ProductID] in table 'ProductReview'
ALTER TABLE [dbo].[ProductReview]
ADD CONSTRAINT [FK_ProductReview_Product_ProductID]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductReview_Product_ProductID'
CREATE INDEX [IX_FK_ProductReview_Product_ProductID]
ON [dbo].[ProductReview]
    ([Product_ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'ProductVendor'
ALTER TABLE [dbo].[ProductVendor]
ADD CONSTRAINT [FK_ProductVendor_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Product_ProductID] in table 'PurchaseOrderDetail'
ALTER TABLE [dbo].[PurchaseOrderDetail]
ADD CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderDetail_Product_ProductID'
CREATE INDEX [IX_FK_PurchaseOrderDetail_Product_ProductID]
ON [dbo].[PurchaseOrderDetail]
    ([Product_ProductID]);
GO

-- Creating foreign key on [Product_ProductID] in table 'ShoppingCartItem'
ALTER TABLE [dbo].[ShoppingCartItem]
ADD CONSTRAINT [FK_ShoppingCartItem_Product_ProductID]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShoppingCartItem_Product_ProductID'
CREATE INDEX [IX_FK_ShoppingCartItem_Product_ProductID]
ON [dbo].[ShoppingCartItem]
    ([Product_ProductID]);
GO

-- Creating foreign key on [ProductID] in table 'SpecialOfferProduct'
ALTER TABLE [dbo].[SpecialOfferProduct]
ADD CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialOfferProduct_Product_ProductID'
CREATE INDEX [IX_FK_SpecialOfferProduct_Product_ProductID]
ON [dbo].[SpecialOfferProduct]
    ([ProductID]);
GO

-- Creating foreign key on [Product_ProductID] in table 'TransactionHistory'
ALTER TABLE [dbo].[TransactionHistory]
ADD CONSTRAINT [FK_TransactionHistory_Product_ProductID]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionHistory_Product_ProductID'
CREATE INDEX [IX_FK_TransactionHistory_Product_ProductID]
ON [dbo].[TransactionHistory]
    ([Product_ProductID]);
GO

-- Creating foreign key on [Product_ProductID] in table 'WorkOrder'
ALTER TABLE [dbo].[WorkOrder]
ADD CONSTRAINT [FK_WorkOrder_Product_ProductID]
    FOREIGN KEY ([Product_ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkOrder_Product_ProductID'
CREATE INDEX [IX_FK_WorkOrder_Product_ProductID]
ON [dbo].[WorkOrder]
    ([Product_ProductID]);
GO

-- Creating foreign key on [ProductCategory_ProductCategoryID] in table 'ProductSubcategory'
ALTER TABLE [dbo].[ProductSubcategory]
ADD CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID]
    FOREIGN KEY ([ProductCategory_ProductCategoryID])
    REFERENCES [dbo].[ProductCategory]
        ([ProductCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductSubcategory_ProductCategory_ProductCategoryID'
CREATE INDEX [IX_FK_ProductSubcategory_ProductCategory_ProductCategoryID]
ON [dbo].[ProductSubcategory]
    ([ProductCategory_ProductCategoryID]);
GO

-- Creating foreign key on [ProductDescriptionID] in table 'ProductModelProductDescriptionCulture'
ALTER TABLE [dbo].[ProductModelProductDescriptionCulture]
ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]
    FOREIGN KEY ([ProductDescriptionID])
    REFERENCES [dbo].[ProductDescription]
        ([ProductDescriptionID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID'
CREATE INDEX [IX_FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]
ON [dbo].[ProductModelProductDescriptionCulture]
    ([ProductDescriptionID]);
GO

-- Creating foreign key on [ProductModelID] in table 'ProductModelIllustration'
ALTER TABLE [dbo].[ProductModelIllustration]
ADD CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModel]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductModelID] in table 'ProductModelProductDescriptionCulture'
ALTER TABLE [dbo].[ProductModelProductDescriptionCulture]
ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModel]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductPhotoID] in table 'ProductProductPhoto'
ALTER TABLE [dbo].[ProductProductPhoto]
ADD CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]
    FOREIGN KEY ([ProductPhotoID])
    REFERENCES [dbo].[ProductPhoto]
        ([ProductPhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductProductPhoto_ProductPhoto_ProductPhotoID'
CREATE INDEX [IX_FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]
ON [dbo].[ProductProductPhoto]
    ([ProductPhotoID]);
GO

-- Creating foreign key on [ScrapReason_ScrapReasonID] in table 'WorkOrder'
ALTER TABLE [dbo].[WorkOrder]
ADD CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID]
    FOREIGN KEY ([ScrapReason_ScrapReasonID])
    REFERENCES [dbo].[ScrapReason]
        ([ScrapReasonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WorkOrder_ScrapReason_ScrapReasonID'
CREATE INDEX [IX_FK_WorkOrder_ScrapReason_ScrapReasonID]
ON [dbo].[WorkOrder]
    ([ScrapReason_ScrapReasonID]);
GO

-- Creating foreign key on [UnitMeasure_UnitMeasureCode] in table 'ProductVendor'
ALTER TABLE [dbo].[ProductVendor]
ADD CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]
    FOREIGN KEY ([UnitMeasure_UnitMeasureCode])
    REFERENCES [dbo].[UnitMeasure]
        ([UnitMeasureCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductVendor_UnitMeasure_UnitMeasureCode'
CREATE INDEX [IX_FK_ProductVendor_UnitMeasure_UnitMeasureCode]
ON [dbo].[ProductVendor]
    ([UnitMeasure_UnitMeasureCode]);
GO

-- Creating foreign key on [WorkOrderID] in table 'WorkOrderRouting'
ALTER TABLE [dbo].[WorkOrderRouting]
ADD CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]
    FOREIGN KEY ([WorkOrderID])
    REFERENCES [dbo].[WorkOrder]
        ([WorkOrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [VendorID] in table 'ProductVendor'
ALTER TABLE [dbo].[ProductVendor]
ADD CONSTRAINT [FK_ProductVendor_Vendor_VendorID]
    FOREIGN KEY ([VendorID])
    REFERENCES [dbo].[Vendor]
        ([VendorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductVendor_Vendor_VendorID'
CREATE INDEX [IX_FK_ProductVendor_Vendor_VendorID]
ON [dbo].[ProductVendor]
    ([VendorID]);
GO

-- Creating foreign key on [PurchaseOrderID] in table 'PurchaseOrderDetail'
ALTER TABLE [dbo].[PurchaseOrderDetail]
ADD CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]
    FOREIGN KEY ([PurchaseOrderID])
    REFERENCES [dbo].[PurchaseOrderHeader]
        ([PurchaseOrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ShipMethod_ShipMethodID] in table 'PurchaseOrderHeader'
ALTER TABLE [dbo].[PurchaseOrderHeader]
ADD CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]
    FOREIGN KEY ([ShipMethod_ShipMethodID])
    REFERENCES [dbo].[ShipMethod]
        ([ShipMethodID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderHeader_ShipMethod_ShipMethodID'
CREATE INDEX [IX_FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]
ON [dbo].[PurchaseOrderHeader]
    ([ShipMethod_ShipMethodID]);
GO

-- Creating foreign key on [Vendor_VendorID] in table 'PurchaseOrderHeader'
ALTER TABLE [dbo].[PurchaseOrderHeader]
ADD CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID]
    FOREIGN KEY ([Vendor_VendorID])
    REFERENCES [dbo].[Vendor]
        ([VendorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseOrderHeader_Vendor_VendorID'
CREATE INDEX [IX_FK_PurchaseOrderHeader_Vendor_VendorID]
ON [dbo].[PurchaseOrderHeader]
    ([Vendor_VendorID]);
GO

-- Creating foreign key on [ShipMethod_ShipMethodID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]
    FOREIGN KEY ([ShipMethod_ShipMethodID])
    REFERENCES [dbo].[ShipMethod]
        ([ShipMethodID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_ShipMethod_ShipMethodID'
CREATE INDEX [IX_FK_SalesOrderHeader_ShipMethod_ShipMethodID]
ON [dbo].[SalesOrderHeader]
    ([ShipMethod_ShipMethodID]);
GO

-- Creating foreign key on [VendorID] in table 'VendorAddress'
ALTER TABLE [dbo].[VendorAddress]
ADD CONSTRAINT [FK_VendorAddress_Vendor_VendorID]
    FOREIGN KEY ([VendorID])
    REFERENCES [dbo].[Vendor]
        ([VendorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [VendorID] in table 'VendorContact'
ALTER TABLE [dbo].[VendorContact]
ADD CONSTRAINT [FK_VendorContact_Vendor_VendorID]
    FOREIGN KEY ([VendorID])
    REFERENCES [dbo].[Vendor]
        ([VendorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CreditCardID] in table 'ContactCreditCard'
ALTER TABLE [dbo].[ContactCreditCard]
ADD CONSTRAINT [FK_ContactCreditCard_CreditCard_CreditCardID]
    FOREIGN KEY ([CreditCardID])
    REFERENCES [dbo].[CreditCard]
        ([CreditCardID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContactCreditCard_CreditCard_CreditCardID'
CREATE INDEX [IX_FK_ContactCreditCard_CreditCard_CreditCardID]
ON [dbo].[ContactCreditCard]
    ([CreditCardID]);
GO

-- Creating foreign key on [CurrencyCode] in table 'CountryRegionCurrency'
ALTER TABLE [dbo].[CountryRegionCurrency]
ADD CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode]
    FOREIGN KEY ([CurrencyCode])
    REFERENCES [dbo].[Currency]
        ([CurrencyCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CountryRegionCurrency_Currency_CurrencyCode'
CREATE INDEX [IX_FK_CountryRegionCurrency_Currency_CurrencyCode]
ON [dbo].[CountryRegionCurrency]
    ([CurrencyCode]);
GO

-- Creating foreign key on [CreditCard_CreditCardID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]
    FOREIGN KEY ([CreditCard_CreditCardID])
    REFERENCES [dbo].[CreditCard]
        ([CreditCardID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_CreditCard_CreditCardID'
CREATE INDEX [IX_FK_SalesOrderHeader_CreditCard_CreditCardID]
ON [dbo].[SalesOrderHeader]
    ([CreditCard_CreditCardID]);
GO

-- Creating foreign key on [Currency_CurrencyCode] in table 'CurrencyRate'
ALTER TABLE [dbo].[CurrencyRate]
ADD CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]
    FOREIGN KEY ([Currency_CurrencyCode])
    REFERENCES [dbo].[Currency]
        ([CurrencyCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CurrencyRate_Currency_FromCurrencyCode'
CREATE INDEX [IX_FK_CurrencyRate_Currency_FromCurrencyCode]
ON [dbo].[CurrencyRate]
    ([Currency_CurrencyCode]);
GO

-- Creating foreign key on [Currency1_CurrencyCode] in table 'CurrencyRate'
ALTER TABLE [dbo].[CurrencyRate]
ADD CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]
    FOREIGN KEY ([Currency1_CurrencyCode])
    REFERENCES [dbo].[Currency]
        ([CurrencyCode])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CurrencyRate_Currency_ToCurrencyCode'
CREATE INDEX [IX_FK_CurrencyRate_Currency_ToCurrencyCode]
ON [dbo].[CurrencyRate]
    ([Currency1_CurrencyCode]);
GO

-- Creating foreign key on [CurrencyRate_CurrencyRateID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
    FOREIGN KEY ([CurrencyRate_CurrencyRateID])
    REFERENCES [dbo].[CurrencyRate]
        ([CurrencyRateID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID'
CREATE INDEX [IX_FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
ON [dbo].[SalesOrderHeader]
    ([CurrencyRate_CurrencyRateID]);
GO

-- Creating foreign key on [SalesTerritory_TerritoryID] in table 'Customer'
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID]
    FOREIGN KEY ([SalesTerritory_TerritoryID])
    REFERENCES [dbo].[SalesTerritory]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Customer_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_Customer_SalesTerritory_TerritoryID]
ON [dbo].[Customer]
    ([SalesTerritory_TerritoryID]);
GO

-- Creating foreign key on [CustomerID] in table 'CustomerAddress'
ALTER TABLE [dbo].[CustomerAddress]
ADD CONSTRAINT [FK_CustomerAddress_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Customer_Id] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
    FOREIGN KEY ([Customer_Id])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Customer_CustomerID'
CREATE INDEX [IX_FK_SalesOrderHeader_Customer_CustomerID]
ON [dbo].[SalesOrderHeader]
    ([Customer_Id]);
GO

-- Creating foreign key on [SalesOrderID] in table 'SalesOrderDetail'
ALTER TABLE [dbo].[SalesOrderDetail]
ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
    FOREIGN KEY ([SalesOrderID])
    REFERENCES [dbo].[SalesOrderHeader]
        ([SalesOrderID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SpecialOfferProduct_SpecialOfferID], [SpecialOfferProduct_ProductID] in table 'SalesOrderDetail'
ALTER TABLE [dbo].[SalesOrderDetail]
ADD CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
    FOREIGN KEY ([SpecialOfferProduct_SpecialOfferID], [SpecialOfferProduct_ProductID])
    REFERENCES [dbo].[SpecialOfferProduct]
        ([SpecialOfferID], [ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID'
CREATE INDEX [IX_FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
ON [dbo].[SalesOrderDetail]
    ([SpecialOfferProduct_SpecialOfferID], [SpecialOfferProduct_ProductID]);
GO

-- Creating foreign key on [SalesPerson_SalesPersonID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]
    FOREIGN KEY ([SalesPerson_SalesPersonID])
    REFERENCES [dbo].[SalesPerson]
        ([SalesPersonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_SalesPerson_SalesPersonID'
CREATE INDEX [IX_FK_SalesOrderHeader_SalesPerson_SalesPersonID]
ON [dbo].[SalesOrderHeader]
    ([SalesPerson_SalesPersonID]);
GO

-- Creating foreign key on [SalesTerritory_TerritoryID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]
    FOREIGN KEY ([SalesTerritory_TerritoryID])
    REFERENCES [dbo].[SalesTerritory]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_SalesOrderHeader_SalesTerritory_TerritoryID]
ON [dbo].[SalesOrderHeader]
    ([SalesTerritory_TerritoryID]);
GO

-- Creating foreign key on [SalesOrderID] in table 'SalesOrderHeaderSalesReason'
ALTER TABLE [dbo].[SalesOrderHeaderSalesReason]
ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]
    FOREIGN KEY ([SalesOrderID])
    REFERENCES [dbo].[SalesOrderHeader]
        ([SalesOrderID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SalesReasonID] in table 'SalesOrderHeaderSalesReason'
ALTER TABLE [dbo].[SalesOrderHeaderSalesReason]
ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]
    FOREIGN KEY ([SalesReasonID])
    REFERENCES [dbo].[SalesReason]
        ([SalesReasonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID'
CREATE INDEX [IX_FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]
ON [dbo].[SalesOrderHeaderSalesReason]
    ([SalesReasonID]);
GO

-- Creating foreign key on [SalesTerritory_TerritoryID] in table 'SalesPerson'
ALTER TABLE [dbo].[SalesPerson]
ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]
    FOREIGN KEY ([SalesTerritory_TerritoryID])
    REFERENCES [dbo].[SalesTerritory]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesPerson_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_SalesPerson_SalesTerritory_TerritoryID]
ON [dbo].[SalesPerson]
    ([SalesTerritory_TerritoryID]);
GO

-- Creating foreign key on [SalesPersonID] in table 'SalesPersonQuotaHistory'
ALTER TABLE [dbo].[SalesPersonQuotaHistory]
ADD CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_SalesPersonID]
    FOREIGN KEY ([SalesPersonID])
    REFERENCES [dbo].[SalesPerson]
        ([SalesPersonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SalesPersonID] in table 'SalesTerritoryHistory'
ALTER TABLE [dbo].[SalesTerritoryHistory]
ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_SalesPersonID]
    FOREIGN KEY ([SalesPersonID])
    REFERENCES [dbo].[SalesPerson]
        ([SalesPersonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SalesPerson_SalesPersonID] in table 'Customer_Store'
ALTER TABLE [dbo].[Customer_Store]
ADD CONSTRAINT [FK_Store_SalesPerson_SalesPersonID]
    FOREIGN KEY ([SalesPerson_SalesPersonID])
    REFERENCES [dbo].[SalesPerson]
        ([SalesPersonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Store_SalesPerson_SalesPersonID'
CREATE INDEX [IX_FK_Store_SalesPerson_SalesPersonID]
ON [dbo].[Customer_Store]
    ([SalesPerson_SalesPersonID]);
GO

-- Creating foreign key on [TerritoryID] in table 'SalesTerritoryHistory'
ALTER TABLE [dbo].[SalesTerritoryHistory]
ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]
    FOREIGN KEY ([TerritoryID])
    REFERENCES [dbo].[SalesTerritory]
        ([TerritoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesTerritoryHistory_SalesTerritory_TerritoryID'
CREATE INDEX [IX_FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]
ON [dbo].[SalesTerritoryHistory]
    ([TerritoryID]);
GO

-- Creating foreign key on [SpecialOfferID] in table 'SpecialOfferProduct'
ALTER TABLE [dbo].[SpecialOfferProduct]
ADD CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
    FOREIGN KEY ([SpecialOfferID])
    REFERENCES [dbo].[SpecialOffer]
        ([SpecialOfferID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CustomerID] in table 'StoreContact'
ALTER TABLE [dbo].[StoreContact]
ADD CONSTRAINT [FK_StoreContact_Store_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customer_Store]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Customer_Individual'
ALTER TABLE [dbo].[Customer_Individual]
ADD CONSTRAINT [FK_Individual_inherits_Customer]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Customer_Store'
ALTER TABLE [dbo].[Customer_Store]
ADD CONSTRAINT [FK_Store_inherits_Customer]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------