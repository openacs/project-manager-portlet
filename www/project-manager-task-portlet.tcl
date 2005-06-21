array set config $cf

set community_id [dotlrn_community::get_community_id_from_url]

if {![empty_string_p $community_id]} {

    set base_url "project-manager/"
    set pm_package_id [dotlrn_community::get_package_id_from_package_key -package_key "project-manager" -community_id $community_id]

} else {
    
    set base_url ""
    set pm_package_id ""
}


