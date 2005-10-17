ad_page_contract {
} {
    {watcher_p 0}
    {page_num 0}
    {is_observer_p ""}
} 
# daily?
set daily_p [parameter::get -parameter "UseDayInsteadOfHour" -default "f"]

#------------------------
# Check if the project will be handled on daily basis or will show hours and minutes
#------------------------

set fmt "%x %r"
if { $daily_p } {
    set fmt "%x"
} 

array set config $cf

set community_id [dotlrn_community::get_community_id_from_url]

if {![empty_string_p $community_id]} {

    set base_url "project-manager/"
    set pm_package_id [dotlrn_community::get_package_id_from_package_key -package_key "project-manager" -community_id $community_id]
    set party_id ""
    set elements "project_item_id task_item_id title role end_date status_type edit_url"
} else {
    
    set elements "project_item_id task_item_id title end_date status_type edit_url"
    set party_id [ad_conn user_id]
    set base_url ""
    set pm_package_id ""
}
