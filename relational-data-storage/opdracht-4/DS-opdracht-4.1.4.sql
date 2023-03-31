--4.1.4 Selecteer de naam, straat, huisnummer en postcode van alle leveranciers die 'specialistische leverancier' zijn of 'ook voor particulieren' werken.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
LEFT JOIN mhl_yn_properties prop
ON prop.supplier_ID=sup.id
LEFT JOIN mhl_propertytypes ptyp
ON ptyp.id=prop.propertytype_ID
WHERE ptyp.name IN ('specialistische leverancier', 'ook voor particulieren')