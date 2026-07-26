---------------------------------------------------------
-- Roles
---------------------------------------------------------

insert into roles (code,name) values
('owner','Owner'),
('manager','Manager'),
('admin','Administrator'),
('warehouse','Warehouse'),
('picker','Picker'),
('qc','Quality Control'),
('packing','Packing'),
('driver','Driver'),
('finance','Finance')
on conflict do nothing;

---------------------------------------------------------
-- Customer Groups
---------------------------------------------------------

insert into customer_groups (code,name) values
('retail','Retail'),
('member','Member'),
('reseller','Reseller'),
('corporate','Corporate')
on conflict do nothing;

---------------------------------------------------------
-- Supplier Types
---------------------------------------------------------

insert into supplier_types (code,name) values
('farmer','Farmer'),
('importer','Importer'),
('distributor','Distributor'),
('market','Traditional Market')
on conflict do nothing;

