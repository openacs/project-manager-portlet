<?xml version="1.0"?>
<queryset>
  <rdbms><type>postgresql</type><version>7.3</version></rdbms>

  <fullquery name="project_folders">
    <querytext>
        SELECT
        p.item_id as project_item_id,
        p.project_id,
	p.status_id,
        p.parent_id as folder_id,
        p.object_type as content_type,
        p.title as project_name,
        p.project_code,
        to_char(p.planned_end_date, 'YYYY-MM-DD HH24:MI:SS') as planned_end_date,
        p.ongoing_p,
        p.customer_id as customer_id, f.package_id
        FROM pm_projectsx p, 
        cr_items i, 
	cr_folders f
        WHERE 
        p.project_id = i.live_revision 
	and i.parent_id = f.folder_id
        and f.package_id in ($package_ids) 
        and exists (select 1 from acs_object_party_privilege_map ppm 
                    where ppm.object_id = p.project_id
                    and ppm.privilege = 'read'
                    and ppm.party_id = :user_id)
        [template::list::filter_where_clauses -and -name "projects"]
    order by planned_end_date desc
    </querytext>
</fullquery>

</queryset>
