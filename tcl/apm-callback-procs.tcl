ad_library {
    Procedures for initializing service contracts etc. for the
    project manager portlet package. Should only be executed 
    once upon installation.
    
    @creation-date 8 May 2003
    @author Simon Carstensen (simon@collaboraid.biz)
    @cvs-id $Id$
}


namespace eval project_manager_portlet {}
namespace eval project_manager_admin_portlet {}

ad_proc -private project_manager_portlet::after_install {} {
    Create the datasources needed by the project manager portlet.
} {
    
    db_transaction {
	set ds_id [portal::datasource::new \
                   -name "project_manager_portlet" \
                   -description "Project Manager Portlet"]

	portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key shadeable_p \
            -value t

	portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key hideable_p \
            -value t

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key user_editable_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key shaded_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key link_hideable_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p f \
            -key package_id \
            -value ""

	register_portal_datasource_impl
        
        project_manager_admin_portlet::after_install

    }
}



ad_proc -private project_manager_portlet::register_portal_datasource_impl {} {
    Create the service contracts needed by the project-manager portlet.
} {
    set spec {
        name "project_manager_portlet"
	contract_name "portal_datasource"
	owner "project-manager-portlet"
        aliases {
	    GetMyName project_manager_portlet::get_my_name
	    GetPrettyName  project_manager_portlet::get_pretty_name
	    Link project_manager_portlet::link
	    AddSelfToPage project_manager_portlet::add_self_to_page
	    Show project_manager_portlet::show
	    Edit project_manager_portlet::edit
	    RemoveSelfFromPage project_manager_portlet::remove_self_from_page
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}



ad_proc -private project_manager_portlet::uninstall {} {
    Project Manager Portlet package uninstall proc
} {
    unregister_implementations

    project_manager_admin_portlet::unregister_implementations
}



ad_proc -private project_manager_portlet::unregister_implementations {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "portal_datasource" \
        -impl_name "project_manager_portlet"
}



ad_proc -private project_manager_admin_portlet::after_install {} {
    Create the datasources needed by the project manager portlet.
} {
    
    db_transaction {
	set ds_id [portal::datasource::new \
                   -name "project_manager_admin_portlet" \
                   -description "Project Manager Admin Portlet"]

	portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key shadeable_p \
            -value f

	portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key hideable_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key user_editable_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key shaded_p \
            -value f

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p t \
            -key link_hideable_p \
            -value t

        portal::datasource::set_def_param \
            -datasource_id $ds_id \
            -config_required_p t \
            -configured_p f \
            -key package_id \
            -value ""

	register_portal_datasource_impl
    }
}



ad_proc -private project_manager_admin_portlet::register_portal_datasource_impl {} {
    Create the service contracts needed by the project-manager admin portlet.
} {
    set spec {
        name "project_manager_admin_portlet"
	contract_name "portal_datasource"
	owner "project-manager-portlet"
        aliases {
	    GetMyName project_manager_admin_portlet::get_my_name
	    GetPrettyName  project_manager_admin_portlet::get_pretty_name
	    Link project_manager_admin_portlet::link
	    AddSelfToPage project_manager_admin_portlet::add_self_to_page
	    Show project_manager_admin_portlet::show
	    Edit project_manager_admin_portlet::edit
	    RemoveSelfFromPage project_manager_admin_portlet::remove_self_from_page
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}



ad_proc -private project_manager_admin_portlet::before_uninstall {} {
    Project Manager Portlet package uninstall proc
} {
    unregister_implementations
}



ad_proc -private project_manager_admin_portlet::unregister_implementations {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "portal_datasource" \
        -impl_name "project_manager_admin_portlet"
}
