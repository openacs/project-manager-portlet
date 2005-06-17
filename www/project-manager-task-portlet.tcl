array set config $cf

set community_id [dotlrn_community::get_community_id_from_url \
		  -url [ad_conn url] \
		     ]

if {![empty_string_p $community_id]} {

    set base_url "project-manager/"

}

set package_id $config(project_manager_id)

