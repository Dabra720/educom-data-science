-- ======================================== DROP FOREIGN KEY CONSTRAINTS =================================================
ALTER TABLE mhl_districts
DROP FOREIGN KEY FK_CountryID;

ALTER TABLE mhl_communes
DROP FOREIGN KEY FK_DistrictID;

ALTER TABLE mhl_cities
DROP FOREIGN KEY FK_CommuneID;

ALTER TABLE mhl_contacts
DROP FOREIGN KEY FK_Department,
-- DROP FOREIGN KEY FK_SupplierID;

-- ALTER TABLE mhl_rubrieken
-- DROP FOREIGN KEY FK_ParentID;

-- ALTER TABLE mhl_suppliers_mhl_rubriek_view
-- DROP FOREIGN KEY FK_mhl_SupplierID,
-- DROP FOREIGN KEY FK_mhl_Rubriek_ViewID;

-- ALTER TABLE mhl_hitcount
-- DROP FOREIGN KEY FK_SupplierID;

ALTER TABLE mhl_detaildefs
DROP FOREIGN KEY FK_GroupID,
-- DROP FOREIGN KEY FK_PropertytypeID;

-- ALTER TABLE mhl_yn_properties
-- DROP FOREIGN KEY FK_SupplierID,
-- DROP FOREIGN KEY FK_PropertytypeID;

-- ALTER TABLE mhl_properties
-- DROP FOREIGN KEY FK_SupplierID,
-- DROP FOREIGN KEY FK_PropertytypeID;

-- ALTER TABLE mhl_suppliers
-- DROP FOREIGN KEY FK_Membertype,
-- DROP FOREIGN KEY FK_Company,
-- DROP FOREIGN KEY FK_Postcode,
-- DROP FOREIGN KEY FK_CityID;

-- ======================================== ADD FOREIGN KEY CONSTRAINTS =================================================

ALTER TABLE mhl_districts
ADD CONSTRAINT FK_CountryID
FOREIGN KEY (country_ID) REFERENCES mhl_countries(id);

ALTER TABLE mhl_communes
ADD CONSTRAINT FK_DistrictID
FOREIGN KEY (district_ID) REFERENCES mhl_districts(id);

ALTER TABLE mhl_cities
ADD CONSTRAINT FK_CommuneID
FOREIGN KEY (commune_ID) REFERENCES mhl_communes(id); 

ALTER TABLE mhl_contacts
ADD CONSTRAINT FK_Department
FOREIGN KEY (department) REFERENCES mhl_departments(id),
-- ADD CONSTRAINT FK_SupplierID
-- FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);

-- ALTER TABLE mhl_rubrieken
-- ADD CONSTRAINT FK_ParentID
-- FOREIGN KEY (parent) REFERENCES mhl_rubrieken(id);

-- ALTER TABLE mhl_suppliers_mhl_rubriek_view
-- ADD CONSTRAINT FK_mhl_SupplierID
-- FOREIGN KEY (mhl_suppliers_ID) REFERENCES mhl_suppliers(id),
-- ADD CONSTRAINT FK_mhl_Rubriek_ViewID
-- FOREIGN KEY (mhl_rubriek_view_ID) REFERENCES mhl_rubrieken(id);

-- ALTER TABLE mhl_hitcount
-- ADD CONSTRAINT FK_SupplierID
-- FOREIGN KEY (Supplier_ID) REFERENCES mhl_suppliers(id);

ALTER TABLE mhl_detaildefs
ADD CONSTRAINT FK_GroupID
FOREIGN KEY (group_ID) REFERENCES mhl_detailgroups(id),
-- ADD CONSTRAINT FK_PropertytypeID
-- FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);

-- ALTER TABLE mhl_yn_properties
-- ADD CONSTRAINT FK_SupplierID
-- FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id),
-- ADD CONSTRAINT FK_PropertytypeID
-- FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);


-- ALTER TABLE mhl_properties
-- ADD CONSTRAINT FK_SupplierID
-- FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id),
-- ADD CONSTRAINT FK_PropertytypeID
-- FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);


-- ALTER TABLE mhl_suppliers
-- ADD CONSTRAINT FK_Membertype
-- FOREIGN KEY (membertype) REFERENCES mhl_membertypes(id),
-- ADD CONSTRAINT FK_Company
-- FOREIGN KEY (company) REFERENCES mhl_companies(id),
-- ADD CONSTRAINT FK_Postcode
-- FOREIGN KEY (postcode) REFERENCES mhl_pc_lat_long(pc6),
-- ADD CONSTRAINT FK_CityID
-- FOREIGN KEY (city_ID) REFERENCES mhl_cities(id);